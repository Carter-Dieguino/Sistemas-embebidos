clc
clear all
warndlg('La placa esta en proceso de conexion');
a=arduino('COM4');
warndlg('Placa conectada');

x=[6 3 5 4 2];

t1=input('Primer tiempo de encendido y apagado del led: ');
t2=input('Segundo tiempo de encendido y apagado del led: ');
t3=input('Tercer tiempo de encendido y apagado del led: ');
t4=input('Cuarto tiempo de encendido y apagado del led: ');
t5=input('Quinto tiempo de encendido y apagado del led: ');

t=[t1 t2 t3 t4 t5];

for i=1:5
a.pinMode(x(i),'OUTPUT');
a.digitalWrite(x(i),1);
pause(t(i))
a.digitalWrite(x(i),0);
pause(t(i));
end
delete(a);
errordlg('Proceso terminado y placa desconectada');