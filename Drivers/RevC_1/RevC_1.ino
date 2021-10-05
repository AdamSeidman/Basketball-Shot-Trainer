#include <Adafruit_ATParser.h>
#include <Adafruit_BLE.h>
#include <Adafruit_BLEBattery.h>
#include <Adafruit_BLEEddystone.h>
#include <Adafruit_BLEGatt.h>
#include <Adafruit_BLEMIDI.h>
#include <Adafruit_BluefruitLE_SPI.h>
#include <Adafruit_BluefruitLE_UART.h>

#include <Adafruit_BLE_UART.h>

#include <Arduino.h>
#include <SPI.h>
#include "Adafruit_BLE.h"
#include "Adafruit_BluefruitLE_SPI.h"
#include "Adafruit_BluefruitLE_UART.h"

#include "BluefruitConfig.h"
#include "ShotTrainer.h"

#if SOFTWARE_SERIAL_AVAILABLE
  #include <SoftwareSerial.h>
#endif

Adafruit_BluefruitLE_SPI ble(BLUEFRUIT_SPI_CS, BLUEFRUIT_SPI_IRQ, BLUEFRUIT_SPI_RST);

void error(const __FlashStringHelper*err) {
  Serial.println(err);
  while (1);
}

char _buffer[3];
long last_time = 0;

void setup(void)
{
  while (!Serial);
  delay(500);

  Serial.begin(BAUD_RATE);
  Serial.println(F("Basketball Shot Trainer Initialization..."));
  Serial.println(F("---------------------------------------"));

  configure_bluetooth();

  _buffer[3] = '\n';

  wait_for_connection();
  last_time = millis();
}

void loop(void)
{
  if (!ble.isConnected()) {
      Serial.println("Lost Bluetooth Connection.");
      wait_for_connection();
  }

  if (millis() >= (last_time + WAIT_TIME)) {
      send_data(364, GYRO_Y);
      last_time = millis();
  }
  
  //print_data_if_available();
}

void send_data(uint16_t data, uint8_t data_type)
{  
  ble.print(TX_COMMAND);

  uint8_t _byte = (HEADER_BYTE_MASK | ((uint8_t)(data & DATA_MASK)) | data_type);
  _buffer[0] = (char)_byte;

  uint8_t __byte = (((uint8_t)(data >> NUM_SHIFTED_BITS)) & DATA_BYTE_MASK);
  /*ble.println((char) _byte);*/
  _buffer[1] = (char)__byte;

  ble.println(_buffer);

  // check response stastus
  if (! ble.waitForOK() ) {
    Serial.println(F("Failed to send?"));
  }
}

void print_data_if_available()
{
  // Check for incoming characters from Bluefruit
  ble.println(RX_COMMAND);
  ble.readline();
  if (strcmp(ble.buffer, "OK") == 0) {
    // no data
    return;
  }
  // Some data was found, its in the buffer
  Serial.print(F("[Recv] ")); Serial.println(ble.buffer);
  ble.waitForOK();
}

void configure_bluetooth(void)
{
  /* Initialise the module */
  Serial.print(F("Initialising the Bluefruit LE module: "));

  if ( !ble.begin(VERBOSE_MODE) )
  {
    error(F("Couldn't find Bluefruit, make sure it's in CommanD mode & check wiring?"));
  }
  Serial.println( F("OK!") );

  if ( FACTORYRESET_ENABLE )
  {
    /* Perform a factory reset to make sure everything is in a known state */
    Serial.println(F("Performing a factory reset: "));
    if ( ! ble.factoryReset() ){
      error(F("Couldn't factory reset"));
    }
  }

  /* Disable command echo from Bluefruit */
  ble.echo(false);

  Serial.println("Requesting Bluefruit info:");
  /* Print Bluefruit information */
  ble.info();

  ble.verbose(false);  // debug info is a little annoying after this point!

  // Set Device Name
  ble.println(DEVICE_NAME_COMMAND);
}

void wait_for_connection(void)
{
    Serial.println("\n\rWaiting for connection...");

  /* Wait for connection */
  while (! ble.isConnected()) {
      delay(500);
  }
  
  Serial.println("Connected!\n\r");
}
