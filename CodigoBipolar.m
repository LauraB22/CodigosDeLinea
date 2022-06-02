function CodigoBipolar(h)
tic
n=1;
ts=1/100;
fs=1/ts;
l=length(h);
h(l+1)=1;
ami=-1;

while n<=length(h)-1
    t=n-1:0.001:n;
    if h(n) == 0
        if h(n+1)==0 
            y=(t>n);
        else
            if ami==1
                y=-(t==n);
            else
                y=(t==n);
            end
        end

    d=plot(t,y, 'm');
    grid on;
    title('Codigo de linea Bipolar');
    set(d,'LineWidth', 3);
    hold on;
    axis([0 length(h)-1 -1.5 1.5]);

    else
        ami=ami*-1;
        if h(n+1)==0
            if ami==1
                y=(t<n-0.5);
            else
                y=-(t<n-0.5);
            end
        else
            if ami==1
                y=(t<n-0.5)-(t==n);
            else
                y=-(t<n-0.5)+(t==n);
            end
        end

    d=plot(t,y, 'm');
    grid on;
    title('Codigo de linea Bipolar');
    set(d,'LineWidth', 3);
    hold on;
    axis([0 length(h)-1 -1.5 1.5]);

    end
    n=n+1;
end

 COD=fftshift(fft(y, 100000))*ts;
 w=linspace(-fs/2, fs/2, length(COD))*2*pi;
 figure(2)
 plot(w/(2*pi),abs(COD), 'r');
 title('Espectro del Código de línea Bipolar');
 xlabel('Frecuencia[Hz]');
 ylabel('Magnitud');

toc
end
