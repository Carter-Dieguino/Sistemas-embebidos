#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug  7 10:51:43 2019

@author: JCOR
"""

# PROGRAMA LEE UN SENSOR ANALÓGICO y Convierte de 0 a 5 Volts

# importar todas las funciones de pylab

try: 
    
    from pyfirmata import Arduino, util 
except:
    import pip
    pip.main(['install','pyfirmata'])
    from pyfirmata import Arduino, util
    

import time
# Para Arduino ('COMx')
board=Arduino('/dev/cu.usbmodem14101') # Modificamos el puerto COM de acuerdo a cada PC

# si usamos más Pines necesitamos crear un ITERADOR de lo contrario
# la Placa puede serguir enviando Datos por el Serial
util.Iterator(board).start() 

# Declaracion de pines
#
inA0 = board.get_pin('a:0:i') # Entrada Analógica
inA0.enable_reporting()
val = inA0.read()




while (1):
  
    print("Lectura Sensor:")
    print(inA0.read())
    time.sleep(1.0)
    print("Lectura Sensor Convertido:")
    print(inA0.read() * 5.0)

#    
#
print("Fin de programa")
board.exit()