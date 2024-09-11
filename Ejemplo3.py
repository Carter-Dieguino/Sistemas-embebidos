#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Aug  6 08:26:31 2019

@author: JCOR
"""

# PROGRAMA LEE UN SENSOR ANALÓGICO 

# importar todas las funciones de pylab
# from pylab import *

# importar el módulo pyplot
# import matplotlib.pyplot as plt

try: 
    
    from pyfirmata import Arduino, util 
except:
    import pip
    pip.main(['install','pyfirmata'])
    from pyfirmata import Arduino, util
    

# import time
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
  

#
print("Fin de programa")
board.exit()