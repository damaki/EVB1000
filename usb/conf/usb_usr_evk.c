#include "usb_core.h"
#include "usbd_usr.h"

USBD_Usr_cb_TypeDef USR_cb =
{
  USBD_USR_Init,
  USBD_USR_DeviceReset,
  USBD_USR_DeviceConfigured,   /* Implemented in Ada */
  USBD_USR_DeviceSuspended,    /* Implemented in Ada */
  USBD_USR_DeviceResumed,      /* Implemented in Ada */
  USBD_USR_DeviceConnected,    /* Implemented in Ada */
  USBD_USR_DeviceDisconnected, /* Implemented in Ada */
};

void USBD_USR_Init(void)
{
    /* Nothing to do */
}

void USBD_USR_DeviceReset(uint8_t speed)
{
    /* Nothing to do*/
    (void)speed;
}
