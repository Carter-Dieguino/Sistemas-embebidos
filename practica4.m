clc
clear all
warndlg('Espere un momento:_')
a=arduino('COM4');
warndlg('Placa conectada')
Stop=1;
figure(1)
RGB=imread('imagen1.jpg');
imshow(RGB)
uicontrol('Style','pushbutton','String','PARAR','Callback','Stop=0')
pause(2)
vp=[2,3,4,5,6]
voltaje=0;
datoa=0;
k=1;
while Stop
    figure(1)
    imshow(RGB)
    %uicontrol('Style','pushbutton','String','PARAR','Callback','Stop=0')
    voltaje=(analogRead(a,0))*(5/1023);
    if voltaje>datoa
        pinMode(a,vp(k),'OUTPUT');
        digitalWrite(a,vp(k),1);
        datoa=datoa+1
        k=k+1;
    end
    if voltaje<datoa
        k=k-1
        pinMode(a,vp(k),'OUTPUT');
        digitalWrite(a,vp(k),0);
        datoa=datoa-1;
    end
pause(0.05)
end

opc=questdlg('Deseas repetir la ejecucion del programa?_',...
    'Si','Si','No','No');
if strcmp(opc,'Si')
    delete(a)
    close(figure(1))
    practica4
end
delete(a)
errordlg('Proceso terminado')
