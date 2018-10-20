import os
import ycm_core

flags = [
    '-Wall',
    '-std=c99',
    '-xc',

    '-I', '.', # current directory
    '-I', 'vendor',

    # update this accordingly:
    '-I', '/usr/local/Cellar/avr-gcc/8.2.0/avr/include',

    '-I', '/usr/local/include/simavr/',
    '-I', '/usr/local/include/simavr/avr',

    '-D', 'F_CPU=16000000',
    '-D', 'MCU=\"atmega328p\"',
    # -mmcu does not work with clang so we have to set these by hand:
    '-D', '__AVR_ATmega328__',
    '-D', '__AVR__',
    # AVR are not i386 but clang does not support ARV.
    # neccesary for simavr macros (they compile with i386 but not the default mach-o)
    '-target', 'i386',

]

SOURCE_EXTENSIONS = [  '.h', '.c', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': False
  }
