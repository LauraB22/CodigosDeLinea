clear all
close all
%100 muestras en Tb=1s
ts=1/100;
Tb=1;
fs=1/ts;

s1NRZ=ones(1,100);
s2NRZ=zeros(1,100);

%bits=[1 1 0 0 0 1 1 1 0 1 0 1];
bits=randi([0,1],1, 15)
N=length(bits);
codigo=[];

for n=1:N
    if bits(n)==1
        codigo = [codigo s1NRZ];
    else
        codigo = [codigo s2NRZ];
    end
end
t=0:ts:N*Tb-ts;
figure(1)
plot(t,codigo, 'm', LineWidth=3);
title('Código de línea NRZ-L');
axis([0 N*Tb -0.5 1.5]);
grid

COD=fftshift(fft(codigo, 10000))*ts;
w=linspace(-fs/2, fs/2, length(COD))*2*pi;
figure(2)
plot(w/(2*pi),abs(COD), 'r');
title('Espectro del Código de línea NRZ-L');
xlabel('Frecuencia[Hz]');
ylabel('Magnitud');




