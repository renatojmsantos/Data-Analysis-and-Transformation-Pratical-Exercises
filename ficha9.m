disp('resolucao em freq [hz]:')
deltaf = fs/N

X = fftshift(fft(x));

if mod(N,2) == 0
    f = -fs/2: fs/N : fs/2-fs/N;
else
    f = -fs/2 + fs/N/2:fs/N: fs/2-fs/N/2;
end

figure(1)
plot(f,abs(X));
title('|DFT| do sinal');
xlabel('f[Hz]');
ylabel('|X|');

%Ex:1.2
indp = find(f>300 & f<400);
indn = find(f>-400 & f<-300);
Xabs_max = max(abs(X));
Xr = X;
Xr(indp) = (abs(Xr(indp)) + 0.5 + Xabs_max*rand(size(Xr(indp))))... 
    .*exp(j*angle(Xr(indp)));
Xr(indn) = conj(Xr(indp(end:-1,1)));

figure(2)
plot(f,abs(X),f,abs(Xr),'r-.');
title('|DTF| do sinal com ruído');
xlabel('f[hz]');
ylabel('|Xr|');

% ex: 1.3.
xr = real(ifft(ifftshitf(Xr)));
sound(xr)
pause

% Ex: 1.4.
w1 = 290/(fs/2);
w2 = 410/(fs/2);

[b,a] = butter(6,[w1 w2],'stop');

y = filter(b,a,xr);

figure(3)
zplane(b,a)

figure(4)
H_filtro = freqz(b,a,N/2);
plot(f(f>=0),20*log10(abs(H_filtro)));
xlabel('f [Hz]');
ylabel('|H_filtro| em dB')

y = fftshift(fft(y));

figure(5)
plot(f,abs(Y),f,abs(X),'r');
title('|DFT| do sinal filtrado');
xlabel('f [Hz]');
ylabel('|Y|');




