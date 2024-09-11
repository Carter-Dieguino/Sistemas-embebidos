clc
clear all
tiempo=input('Deme el primer tiempo de encendido y apagado del led: ')
tiempo2=input('Deme el segundo tiempo de encendido y apagado del led: ')
tiempo3=input('Deme el tercero tiempo de encendido y apagado del led: ')
warndlg('La placa esta en proceso de conexion');
a=arduino('COM4');
warndlg('Placa conectada');
a.pinMode(3,'OUTPUT');
a.pinMode(4,'OUTPUT');
a.pinMode(2,'OUTPUT');

a.digitalWrite(3,1);
pause(tiempo)
a.digitalWrite(3,0);
pause(tiempo);

a.digitalWrite(2,1);
pause(tiempo2)
a.digitalWrite(2,0);
pause(tiempo2);

a.digitalWrite(4,1);
pause(tiempo3)
a.digitalWrite(4,0);
pause(tiempo3);
delete(a);
errordlg('Proceso terminado y placa desconectada');

