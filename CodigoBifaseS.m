clear all
close all

Tb=1;
ts=Tb/100;
fs=1/ts;
simb1_1=ones(1,50);
simb0_0=-ones(1,50);
transAB=[simb1_1 simb0_0];
transBA=[simb0_0 simb1_1];

simb1=ones(1,100);
simb0=-ones(1,100);

bits=[1 1 0 0 0 1 1 1 0 1 0 1];
%M=10000;
%bits=randi([0,1], 1, 10000);

N=length(bits);
codigo=[];
ultimoEstado=0;

for n=1:N
   if ultimoEstado==0
       if bits(n)==0
           codigo = [codigo transBA];
           ultimoEstado=0;
       else
           codigo = [codigo simb0];
           ultimoEstado=1;
       end
   else
       if bits(n)==0
           codigo = [codigo transAB];
           ultimoEstado=1;
       else
           codigo = [codigo simb1];
           ultimoEstado=0;
       end
   end
end

t=0:ts:N*Tb-ts;
plot(t,codigo, 'm', LineWidth=3)
axis([0 N*Tb -1.5 1.5])
grid
title('Codigo de linea Bifase-S')

COD=fftshift(fft(codigo,100000))*ts;
w=linspace(-fs/2, fs/2, length(COD))*2*pi; %Para que grafique las amplitudes, vector horizontal
figure(2)
plot(w/(2*pi), abs(COD), 'r')
title('Espectro del Código de línea Bifase-S');
xlabel('Frecuencia[Hz]');
ylabel('Magnitud');


%Si queremos graficarlo en Hz, dividimos w / 2*pi