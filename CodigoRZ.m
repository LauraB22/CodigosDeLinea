function RZ(h)
tic
%Example:

%h=[1 0 0 1 1 0 1 0 1 0];

%URZ(h)

clf;

n=1;

ts=1/100;
fs=1/ts;
l=length(h);

h(l+1)=1;

while n<=length(h)-1;

    t=n-1:ts:n;

%Graficación de los CEROS (0)

    if h(n) == 0

        if h(n+1)==0 

            y=(t>n);

        else

            y=(t==n);

        end

    d=plot(t,y, 'm');grid on

    title('Código de línea RZ');

    set(d,'LineWidth',3);

    hold on;

    axis([0 length(h)-1 -0.5 1.5]);

    %disp('zero');

%Graficación de los UNOS (1)

    else

    if h(n+1)==0

        y=(t<n-0.5);

    else

        y=(t<n-0.5)+1*(t==n);

    end

    d=plot(t,y, 'm');grid on;

    title('Código de línea RZ');

    set(d,'LineWidth',3);

    hold on;

    axis([0 length(h)-1 -0.5 1.5]);

    %disp('one');

end

n=n+1;

%pause;

end

COD=fftshift(fft(y))*ts;
w=linspace(-fs/2, fs/2, length(COD))*2*pi;
figure(2)
plot(w/(2*pi),abs(COD), 'r');
title('Espectro del Código de línea RZ');
xlabel('Frecuencia[Hz]');
ylabel('Magnitud');
toc
end

