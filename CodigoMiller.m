clear all
close all
tic
ts=1/100;
fs=1/ts;

%bits=[1 1 0 0 0 1 1 1 0 1 0 1];
bits=randi([0,1],1, 15)
N=length(bits);
tb=0:ts:N-ts;
codigo=[];
est_inicial=1;
con=est_inicial;
ac=[]
bits(N+1)=0;

a=1;
n=1;


while n<=N
    if bits(n)==1
        codigo = [con*ones(1,50) -con*ones(1,50)];
        con = con*-1;
    else
        %if bits(n)==0
        codigo = [con*ones(1,100)];
            if bits(n+1)==0
                %codigo = [con*ones(1,100)];
                con = con*-1;
%             elseif bits(n+2)==0
%                 codigo = [-con*ones(1,100)];
        end
    
    end
    ac=[ac codigo];
    n=n+1;%Incremento del contador del loop

    s=[];
end

plot(tb, ac, 'm', LineWidth=3);
title('Código de línea Miller');
axis([0 N -1.5 1.5]);
grid

COD=fftshift(fft(ac, 10000))*ts;
w=linspace(-fs/2, fs/2, length(COD))*2*pi;
figure(2)
plot(w/(2*pi),abs(COD), 'r');
title('Espectro del Código de línea Miller');
xlabel('Frecuencia[Hz]');
ylabel('Magnitud');

