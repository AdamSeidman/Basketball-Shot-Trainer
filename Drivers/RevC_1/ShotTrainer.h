#ifndef  __shot_trainer__
#define  __shot_trainer__

// BLEUART PROPERTIES
#define  FACTORYRESET_ENABLE          1
#define  MINIMUM_FIRMWARE_VERSION     "0.6.6"
#define  MODE_LED_BEHAVIOUR           "MODE"

// BLE COMMANDS
#define  TX_COMMAND                   "AT+BLEUARTTX="
#define  RX_COMMAND                   "AT+BLEUARTRX="

// BYTE HEADER INFORMATION
#define  FULL_BYTE                    (0b11111111)
#define  BYTE_TYPE_POS                (1<<7)
#define  HEADER_BYTE_MASK             (BYTE_TYPE_POS)
#define  DATA_BYTE_MASK               (FULL_BYTE & (~BYTE_TYPE_POS))
#define  DATA_MASK                    (0x0007)

// BYTE TYPE INFORMATION
#define  DATA_TYPE_POS                (3)
#define  ACCEL_X                      (0x1 << DATA_TYPE_POS)
#define  ACCEL_Y                      (0x2 << DATA_TYPE_POS)
#define  ACCEL_Z                      (0x3 << DATA_TYPE_POS)
#define  GYRO_X                       (0x4 << DATA_TYPE_POS)
#define  GYRO_Y                       (0x5 << DATA_TYPE_POS)
#define  GYRO_Z                       (0x6 << DATA_TYPE_POS)

// ASSORTED CONSTANTS
#define  NUM_SHIFTED_BITS             (3)
#define  BAUD_RATE                    (115200)
#define  PERSEC                       (2)
#define  WAIT_TIME                    (1000 / PERSEC)
#define  DEVICE_NAME_COMMAND          "AT+GAPDEVNAME=Shot Trainer-Arm Module 1"

#endif
