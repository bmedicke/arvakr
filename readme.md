# hardware

- __MCU__ [ATmega328p](https://www.microchip.com/wwwproducts/en/ATmega328P)
- __Stepper Motor__ [ 17HS4401 ](http://www.svaltera.ua/catalogs/knowledge-base/brands/motionking/HB_Stepper_Motor_E.pdf)
  - size: [ NEMA17 ](https://en.wikipedia.org/wiki/NEMA_stepper_motor)
- __Stepper Driver__ [ DRV8826 ](http://www.ti.com/lit/ds/symlink/drv8825.pdf)
  - 8.2 - 45V supply
  - interfaces with 3.3 and 5V
- __Stepper Driver__ [ A4988 ](https://www.pololu.com/file/0J450/A4988.pdf)
- __Bluetooth module__ [ HM-10 ](ftp://imall.iteadstudio.com/Modules/IM130614001_Serial_Port_BLE_Module_Master_Slave_HM-10/DS_IM130614001_Serial_Port_BLE_Module_Master_Slave_HM-10.pdf)
  - Blutooth 4 BLE
  - supports Android and iOS
  - [review by Currey](http://www.martyncurrey.com/hm-10-bluetooth-4ble-modules/)
- __Bluetooth module__ [ HC-05 ](ftp://imall.iteadstudio.com/Modules/IM130614001_Serial_Port_BLE_Module_Master_Slave_HM-10/DS_IM130614001_Serial_Port_BLE_Module_Master_Slave_HM-10.pdf)
  - Master/Slave
  - _does not work with iOS_
- __Oscillator__ [ HC49S ](https://www.es.co.th/Schemetic/PDF/HC49S.PDF)
  - 8MHz and 16 MHz

# software

- LightBlue Explorer
- BluTerm (iOS)

# required reading

- [Microchip Site](https://www.microchip.com/wwwproducts/en/ATmega328P)
- [Bluetooth Interfacing with HM-10](http://fab.cba.mit.edu/classes/863.15/doc/tutorials/programming/bluetooth.html)
- [Introduction to BLE Security](https://www.digikey.com/eewiki/display/Wireless/A+Basic+Introduction+to+BLE+Security)

# slider

- [$10 DIY Camera Slider](https://www.youtube.com/watch?v=fR_-R2bS9ag)
- https://learn.adafruit.com/bluetooth-motorized-camera-slider/overview
- [Tripod Head](https://www.aliexpress.com/item/Mini-Tripod-Ball-Head-Ballhead-1-4-Screw-Mount-Stand-360-Swivel-DSLR-DV-Camera-DSLR/32724680390.html?spm=2114.search0104.3.1.13691379tnpeQj&ws_ab_test=searchweb0_0,searchweb201602_5_10065_10068_204_318_10547_319_10059_10884_10548_10887_10696_100031_320_10084_10083_10103_452_10618_10304_10307_10820_532_10821_10302,searchweb201603_60,ppcSwitch_0&algo_expid=30498e82-a04a-432a-b954-65dff7337949-0&algo_pvid=30498e82-a04a-432a-b954-65dff7337949&priceBeautifyAB=0)


# stepper motors

- [A4988 vs DRV8825](https://reprap.org/wiki/A4988_vs_DRV8825_Chinese_Stepper_Driver_Boards) [reddit](https://www.reddit.com/r/3Dprinting/comments/5w0b0v/drv8825_vs_a4988_which_one_is_better_and_why/)
- [timing belt](https://de.aliexpress.com/item/1pc-5m-GT2-Timing-Belt-6mm-Width-Fiber-Reinforced-Rubber-Timing-Belt-For-CNC-3D-Printer/32790795728.html?spm=a2g0x.search0104.3.22.3d547083U1DUwA&ws_ab_test=searchweb0_0,searchweb201602_5_10065_10068_318_10547_319_10548_10696_450_10084_10083_10618_452_535_534_10304_533_10307_10820_532_10821_10302_204_10059_10884_10887_100031_320_10103_448_449,searchweb201603_60,ppcSwitch_0&algo_expid=96adedbb-4f35-4115-b37f-d53983e36a4c-3&algo_pvid=96adedbb-4f35-4115-b37f-d53983e36a4c)
- [GT2 timing belt](https://de.aliexpress.com/wholesale?catId=146904&initiative_id=AS_20181012075453&SearchText=gt2+zahnriemen)


# flashing copycat bluetooth chip

- https://www.reddit.com/r/arduino/comments/43fkjf/hm10_bluetooth/
