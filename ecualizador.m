classdef ecualizador <handle   %handle opera otras clases de Matlab

    properties
        audio=[]
        velocidad = []
        y = []
        Fs= []
        volumen = []
    end

    methods

        function setVel (obj,vel)  %Emcapsulamiento de datos
            obj.velocidad = vel;
        end
        function setVolumen (obj,vol)  %Emcapsulamiento de datos
            obj.volumen = vol;
        end

        function setAudioread(obj,naudio)
            obj.audio = naudio;
           
        end
        function player=setLoadplay (obj)  %Emcapsulamiento de datos.player es variable de retorno
            [obj.y,obj.Fs] = audioread(obj.audio);  %audioread regresa amplitud y frecuencia
            player = audioplayer(obj.y*obj.volumen,obj.Fs*obj.volumen); %Regresa audionriginal porque eta multiplicado por uno
        end

        function obj = ecualizador(nnombre,nvel,nvol)
            obj.setVolumen(nvol)
            obj.setVel(nvel)
            obj.setAudioread(nnombre)
        end
    end
end