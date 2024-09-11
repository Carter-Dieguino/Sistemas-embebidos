#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug  5 12:57:11 2019

@author: JCOR
"""
# ENCENDER UN LED CON SALIDA DIGITAL: HOLA MUNDO

try: 
    
    from pyfirmata import Arduino, util 
except:
    import pip
    pip.main(['install','pyfirmata'])
    from pyfirmata import Arduino, util
    

import time

# Para Arduino ('COMx')
board=Arduino('COM6') # Modificamos el puerto COM de acuerdo a cada PC

# si usamos más Pines necesitamos crear un ITERADOR de lo contrario
# la Placa puede serguir enviando Datos por el Serial
util.Iterator(board).start() 

# Declaracion de pines
Led = board.get_pin('d:13:o') # d=digital 13=pin o=Salida
                                # a = analogico 13=pin i=Entrada

# Enciende y apaga un led
while (1):
    Led.write(1) # Encender led Con salida digital
    time.sleep(1)   # Tiempo de espera en segundos.
    Led.write(0) # Apaga Led 
    time.sleep(1)  
    