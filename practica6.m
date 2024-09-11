clc
warndlg=('Espere un momento!')
Smoker='audio2.mp3';
warndlg=('archivo cargado');
vel=input('Dame la velocidad del audio:_');
vol=input('Deme el volumen del audio:_');
f=equalizador(Smoker,vel,vol);
alpha=f.setLoadplay;

opc=questdlg('Desea reproducir el audio:_',...
    'Play','Play','No','No')
if strcmp(opc,'Play')
    play(alpha)
    opc=questdlg('Desea pausar el audio:_',...
        'Pause','Pause','No','No')
    if strcmp(opc,'Pause')
    pause(alpha)

    opc=questdlg('Desea retomar el audio:_',...
        'Resume','Resume','No','No')
    if strcmp(opc,'Resume')
        resume(alpha)
    end
    end
end
if strcmp(opc,'No')
    stop(alpha)
end