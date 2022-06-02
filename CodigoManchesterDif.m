clear all
close all
tic
ts=1/100;
fs=1/ts;

bits=[1 1 0 0 0 1 1 1 0 1 0 1];
%bits=randi([0,1],1, 15)
N=length(bits);
tb=0:ts:N-ts;
bit=[];
codigo=[];
a=1;
n=1;

while n<=N
    if bits(n)==0
       datos(n,:)=[zeros(1,100)];
       if n==1
           cod(n,:)=[-ones(1,50) ones(1,50)]; 
       else
           cod(n,:)=cod(n-1,:);
       end
    else
        datos(n,:)=[ones(1,100)];
        if n==1
            cod(n,:)=[ones(1,50) -ones(1,(50))];
        else
            cod(n,:)=-1*cod(n-1,:);
        end
    end

%     bit=cat(2,bit,datos(n,:));
    codigo=cat(2,codigo,cod(n,:));
    n=n+1;
end

figure(1)
% subplot(2,1,1)
% plot(tb, a*bit, 'r', LineWidth=3);
% axis([0 N -0.5 1.5*a]);
% 
% subplot(2,1,2)
plot(tb, a*codigo, 'm', LineWidth=3);
title('Código de línea Manchester Diferencial');
axis([0 length(bits) -1.5 1.5]);
grid

COD=fftshift(fft(codigo, 100000))*ts;
w=linspace(-fs/2, fs/2, length(COD))*2*pi;
figure(2)
plot(w/(2*pi),abs(COD), 'r');
title('Espectro del Código de línea Manchester');
xlabel('Frecuencia[Hz]');
ylabel('Magnitud');

toc



