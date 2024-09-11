clc
clear all
warndlg('Espere un momento:')
a=arduino('COM7');
warndlg('Placa conectada')
Stop=1;
figure (1)
RGB=imread('imagen1.jpg');
imshow(RGB)
uicontrol('Style','pushbutton','String','PARAR','Callback','Stop=0')
pause(2)
t=0;
tic
Vs=0;
Tiempo=0;
Vas=0;
k=1;
tic
while Stop
Volumen=analogRead(a,0)*(10/1023)+1
Velocidad=analogRead(a,1)*(2/1023)
Vas=Volumen*sin(Velocidad*t);
Vs(k)=Vas;
Tiempo(k)=t;
t=toc;
k=k+1;
figure(1)
plot(Tiempo,Vs)
grid on
ylabel('Amplitud')
xlabel('Tiempo')
uicontrol('Style','pushbutton','String','PARAR','Callback','Stop=0')
pause(0.05)
end

opc=questdlg('Deseas repetir la ejecucion del programa?_',...
    'Si','Si','No','No');
if strcmp(opc,'Si')
    delete(a)
    close(figure(1))
    prac5
end
delete(a)
errordlg('Proceso terminado')


