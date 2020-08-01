close all;
I = imread('nino.jpg');
img = Tarea2(I);
img.filtroBilateral(5/3,20);
figure, subplot(1,2,1), imagesc(img.obtenerImagenOriginal), subplot(1,2,2), imagesc(img.obtenerImagenProcesada)