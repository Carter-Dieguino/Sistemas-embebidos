clc
clear all
warndlg('Espere un momento por favor');
a=arduino('COM4');
warndlg('Placa conectada');
Stop=1;
figure(1)
RGB=imread('imagen1.jpg');
imshow(RGB);
uicontrol('Style','pushbutton','String','PARAR','Callback','Stop=0') %Callback retroLIMENTA la accion del boton
pause(3)
Voltaje=0;
Tiempo=0;
k=1;
v=0;
t=0;
tic
g=graficador
while Stop
v=(a.analogRead(0))*(10/1023);
t=(a.analogRead(1))*(10/1023);
Voltaje(k)=v;
Tiempo(k)=t;
%t=toc;
k=k+1;
g.SetX(Tiempo)
g.SetY(Voltaje)
g.ashowgrafica
uicontrol('Style','pushbutton','String','PARAR','Callback','Stop=0')
pause(0.05);
end