close all;

sigma_r = [20,25,30,35,40,45,50,55];
sigma_d = [5/3, 7/3, 11/3];
dataSnr = zeros(1,length(sigma_r));


I = imread('rubiks.jpg');
img = Tarea2(I); 

for j = 1:length(sigma_d)
    for i = 1:length(sigma_r)
        img.filtroBilateral(sigma_d(j),sigma_r(i));
        if (i==2 && j==1) || ( i==4 && j==2) || (i==7 && j==3)
            figure, 
            subplot(1,2,1), 
            imagesc(img.obtenerImagenOriginal), 
            title('Imagen Original');
            subplot(1,2,2), 
            imagesc(img.obtenerImagenProcesada),
            title(['Filtro Bilateral con ',num2str(sigma_d(j)),' de sigma d y ',num2str(sigma_r(i)),' sigma r']);
        end
        dataSnr(j,i) = snr(img.obtenerImagenOriginal,img.obtenerImagenProcesada);
    end
end

figure,
plot(sigma_r(:),dataSnr)
title('Valores SNR Rubiks'),
xlabel('Sigma_r'),
ylabel('SNR'),
lgd = legend('5/3','7/3','11/3'),
title(lgd, 'Sigma d'),
