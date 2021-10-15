/**
 * P21014 Wearable Bluetooth Module Driver
 * Uses Feather M0 Bluefruit BLE, Adafruit BNO055, and Custom PCB/Mounting
 * Author: Adam Seidman
 */

#include "ShotTrainer.h"
#include "LEDs.h"

// Bluetooth/Sensor Objects
Adafruit_BluefruitLE_SPI ble(BLUEFRUIT_SPI_CS, BLUEFRUIT_SPI_IRQ, BLUEFRUIT_SPI_RST);
Adafruit_BNO055 bno = Adafruit_BNO055(I2C_PORT);

// Global Variables
char _buffer[3];
long last_time = 0;
sensors_event_t event;
bool is_sending = false;

void setup(void)
{
  configure_leds();

  Serial.begin(BAUD_RATE);
  Serial.println( F("Basketball Shot Trainer- Arm Module: Serial Output") );
  Serial.println( F("--------------------------------------------------\n\r") );

  configure_imu();
  configure_bluetooth();

  wait_for_connection();
  last_time = millis();
}

void loop(void)
{
  if ( !ble.isConnected() )
  {
    Serial.println( F("Lost Bluetooth Connection.") );
    wait_for_connection();
  }

  if ( is_sending && millis() >= (last_time + WAIT_TIME) )
  {
    bno.getEvent(&event);

    send_data(event.orientation.x, GYRO_X);
    send_data(event.orientation.y, GYRO_Y);
    send_data(event.orientation.z, GYRO_Z);

    last_time = millis();
  }

  handle_incoming();
}

void send_data(float raw_data, uint8_t data_type)
{  
  ble.print(TX_COMMAND);

  uint16_t data = (uint16_t)(raw_data * DATA_FACTOR);

  _buffer[0] = (char)(data_type);
  _buffer[1] = (char)~(((uint8_t)(data >> NUM_SHIFTED_BITS)) & DATA_BYTE_MASK);
  _buffer[2] = (char)~(((uint8_t)(data & DATA_MASK)) & DATA_BYTE_MASK);

  ble.println(_buffer);

  // check response stastus
  if ( !ble.waitForOK() ) Serial.println( F("Failed to send a packet.\n\r") );
}

void handle_incoming(void)
{
  // Check for incoming characters from Bluefruit
  ble.println(RX_COMMAND);
  ble.readline();
  
  if ( strcmp(ble.buffer, "OK" ) == 0 )  return; // no data: leave function

  blink_led();

  switch( ble.buffer[0] )
  {
    case START_CMD:
      is_sending = true;
      Serial.println( F("Start Data Requested") );
      break;
    case STOP_CMD:
      is_sending = false;
      Serial.println( F("Stop Data Requested") );
      break;
    default:
      break;
  }

  ble.waitForOK();
}

void configure_leds(void)
{
  pinMode(RED_PIN, OUTPUT);
  pinMode(GREEN_PIN, OUTPUT);
  pinMode(BLUE_PIN, OUTPUT);

  setLedColor(INIT);
}

void configure_imu(void)
{
  Serial.print( F("Initializing the BNO055 IMU module: ") );

  if ( !bno.begin() ) error( F("Oops, no BNO055 detected ... Check your wiring or I2C ADDR!"), NO_IMU );
  
  delay(1000);

  bno.setExtCrystalUse(true);
  Serial.println( F("OK!") );
}

void configure_bluetooth(void)
{
  /* Initialise the module */
  Serial.print( F("Initializing the Bluefruit LE module: ") );

  if ( !ble.begin(false) )   error( F("Couldn't find Bluefruit, make sure it's in Command mode & check wiring?"), NO_BLE );
  Serial.println( F("OK!") );

  /* Disable command echo from Bluefruit */
  ble.echo(false);

  if ( FACTORYRESET_ENABLE )
  {
    /* Perform a factory reset to make sure everything is in a known state */
    Serial.print( F("Performing a factory reset: ") );
    if ( !ble.factoryReset() )
    {
      error( F("Couldn't factory reset"), BAD_FS );
    }
    else
    {
      Serial.println( F("OK!") );
    }
  }

  ble.println(DEVICE_NAME_COMMAND);   // Set Device Name
}

void setLedColor(uint8_t color)
{  
  digitalWrite(RED_PIN, (color >> RED_BIT) & COLOR_MSK);
  digitalWrite(GREEN_PIN, (color >> GREEN_BIT) & COLOR_MSK);
  digitalWrite(BLUE_PIN, (color >> BLUE_BIT) & COLOR_MSK);
}

void blink_led()
{
  setLedColor(BLINK);
  delay(250);
  setLedColor(NORMAL);
}

void wait_for_connection(void)
{
  setLedColor(AWAIT_CONN);
  Serial.println( F("\n\rWaiting for connection...") );
  is_sending = false;
  while ( !ble.isConnected() )  delay(500);
  Serial.println( F("Connected!\n\r") );
  setLedColor(NORMAL);
}

void error(const __FlashStringHelper*err, uint8_t error_type)
{
  Serial.println("");
  Serial.println(err);
  setLedColor(error_type);
  while (1);
}
