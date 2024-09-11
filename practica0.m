clc
clear all
warndlg('La placa esta en proceso de conexion');
a=arduino('COM4');
warndlg('Placa conectada');

a.pinMode(3,'OUTPUT');
a.digitalWrite(3,1);
pause(1)
a.digitalWrite(3,0);

pause(1);
delete(a);
errordlg('Proceso terminado y placa desconectada');

