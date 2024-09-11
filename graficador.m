classdef graficador < handle
    properties
        x = []
        y = []
    end

    methods
        function obj = graficador(vcx, vcy) % Constructor con parámetros opcionales
            if nargin > 0 % Verifica si se proporcionaron argumentos
                obj.x = vcx;
                obj.y = vcy;
            end
        end

        function SetX(obj, vcx)
            obj.x = vcx;
        end

        function SetY(obj, vcy)
            obj.y = vcy;
        end

        function ashowgrafica(obj)
            figure(1)
            plot(obj.x, obj.y)
            xlabel('Variable independiente');
            ylabel('Variable dependiente');
            grid on
        end
    end
end
