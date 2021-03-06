classdef Tarea2 < handle
    properties (Access=private)
        imOriginal;
        imProcesada;
    end
    methods
        function img = Tarea2(im)
            img.imOriginal = im;
            img.imProcesada = zeros(size(im));
        end
        
        function filtroBilateral(img, sigma_d, sigma_r)
            I = double(img.imOriginal);
            g = fspecial('gaussian',[sigma_d*3 sigma_d*3], sigma_d);
            [repx repy] = size(g);
            repx = floor(repx/2);
            repy = floor(repy/2);
            
            Irep = padarray(I,[repx repy], 'replicate');
            
            Ibf = zeros(size(I));
            
            [xDim yDim canales] = size(Irep);
           
            for i=1+repx:xDim-repx
                for j=1+repy:yDim-repy    
                    for z=1:3
                        N = Irep(i-repx:i+repx, j-repy:j+repy,z);
                        wij = g.* exp(- (Irep(i,j,z) - N).^2./(2.*sigma_r.^2));
                        wij = wij./sum(wij(:));
                        Ibf(i-repx,j-repy,z) = sum(wij(:).*N(:));
                    end
                end
            end
            img.imProcesada = uint8(Ibf);
        end
        
        function result = obtenerImagenOriginal(img)
            result = img.imOriginal;
        end
        function result = obtenerImagenProcesada(img)
            result = img.imProcesada;
        end
    end
end

%Para probar el blanco y negro =>filtroBilateralEscalaGrises(I, 5/3, 20);