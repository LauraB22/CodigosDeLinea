clear all
close all
%100 muestras en Tb=1s
ts=1/100;
Tb=1;
fs=1/ts;
tbm=Tb/2;
tm=0:ts:tbm;

s1NRZ=[-ones(1, length(tm)) ones(1, length(tm))];
s2NRZ=[ones(1, length(tm)) -ones(1, length(tm))];

bits=[1 1 0 0 0 1 1 1 0 1 0 1];
%bits=randi([0,1],1, 15)
N=length(bits);
codigo=[];

for n=1:N
    if bits(n)==1
        codigo = [codigo s2NRZ];
    else
        codigo = [codigo s1NRZ];
    end
end

t=(length(codigo)-1)*ts;
tm2=0:ts:t;
figure(1)
plot(tm2,codigo, 'm', LineWidth=3);
title('Código de línea Manchester');
axis([0 length(bits) -1.5 1.5]);
grid


COD=fftshift(fft( codigo, 10000))*ts;
w=linspace(-fs/2, fs/2, length(COD))*2*pi;
figure(2)
plot(w/(2*pi),abs(COD), 'r');
title('Espectro del Código de línea Manchester');
xlabel('Frecuencia[Hz]');
ylabel('Magnitud');


