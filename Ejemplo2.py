#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Aug  5 15:22:42 2019

@author: JCOR
"""
# PROGRAMA LEE DOS BOTONES Y ENCIENDE UN LED'S
# EL PROGRAMA SE DETIENE CUANDO LOS DOS BOTONES SE PRESIONAN

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
                                # a = analogico  i=Entrada


## Pines 2, 3 SALIDAS
p1 = board.get_pin('d:2:o')
p2 = board.get_pin('d:3:o')
#
#
l = board.get_pin('d:8:i') # Entrada 
l.enable_reporting()
val = l.read()
#
#
l2 = board.get_pin('d:9:i') # Entrada 
l2.enable_reporting()
val = l2.read()

while (1):
    p1.write(0)
    p2.write(0)
    print(l.read())
    print(l2.read())
#    
    if l.read() == True:
        p1.write(1)
        
    if l2.read() == True:
        p2.write(1)  
        
    if l.read() == True and l2.read() == True :
        break 
#
print("Fin de programa")
board.exit()