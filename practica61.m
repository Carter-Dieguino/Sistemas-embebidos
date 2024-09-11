clc;
% Suponiendo que 'a' es tu objeto de conexión de Arduino ya inicializado.
% Si no, necesitas inicializarlo con a = arduino('COM7')%, 'ArduinoUNO');

Smoker = 'audio2.mp3';
warndlg('Archivo cargado');

% Lee los potenciómetros y ajusta volumen y velocidad
% Volumen = analogRead(a, 0) * (10 / 1023) + 1;  % Asegúrate de que estos mapeos son correctos para tu aplicación
% Velocidad = analogRead(a, 1) * (1 / 1023) + 1;

f = equalizador(Smoker, Velocidad, Volumen);
alpha = f.setLoadplay;

opc = ''; % Inicializa la opción como vacía para entrar en el bucle

while ~strcmp(opc, 'Stop')
    opc = questdlg('Seleccione una acción:', ...
                   'Acciones de Audio', ...
                   'Play', 'Pause', 'Stop', 'Stop');
                
    switch opc
        case 'Play'
            if ~isplaying(alpha)
                play(alpha); % Reproduce el audio desde el inicio o desde donde se pausó
            end
        case 'Pause'
            if isplaying(alpha)
                pause(alpha); % Pausa el audio si está reproduciendo
            end
        case 'Stop'
            stop(alpha); % Detiene el audio y resetea la posición de reproducción
        otherwise
            % Puedes manejar cualquier otra acción o entrada no esperada aquí
    end
end
