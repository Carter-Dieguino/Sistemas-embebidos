clc
clear all

t=input('Tiempo de encendido y apagado del leds: ');

fprintf('1. Recorrido a la derecha\n');
fprintf('2. Recorrido a la izquierda\n');
fprintf('3. Recorrido manual\n');
fprintf('Seleccione la accion a realizar: ');
seleccion = input(' ');

if (seleccion == 1)
    x=[2 3 4 5 6];
elseif (seleccion == 2)
    x=[6 5 4 3 2];
elseif (seleccion == 3)
    fprintf('4. Recorrido manual a la izquierda\n');
    fprintf('5. Recorrido manual a la derecha\n');
    fprintf('Seleccione la accion a realizar: ');
    subseleccion = input(' ');
    if (subseleccion == 4)
        x=[2 3 4 5 6];
    elseif (subseleccion == 5)
          x=[6 5 4 3 2];
    else
         fprintf ('Seleccion no valida')
    end
else 
    fprintf ('Numero incorrecto')
end

warndlg('La placa esta en proceso de conexion');
a=arduino('COM4');
warndlg('Placa conectada');

for i=1:5
a.pinMode(x(i),'OUTPUT');
a.digitalWrite(x(i),1);
pause(t)
a.digitalWrite(x(i),0);
pause(t);
end
delete(a);
errordlg('Proceso terminado y placa desconectada');
