close all
clear all
load sinal.mat
x = sumsin_freqbrk;
N = lenght(x);
fs = 2000;
Ts = 1/fs;
% t = 0: Ts:(N-1)*Ts;
n=0:N-1;

figure(1)
plot(n,x);
xlabel('n');
ylabel('x[n]');

% 1.2
% waveinfo -> 'haar' : Haar wavelet-

[CA,CD] = dwt(x,'haar');

figure(2);
subplot(311);
plot(n,x);
xlabel('n');
ylabel('x[n]');
% ...

plot(n1,CD);
xlabel('n');
ylabel('CD');
title('Coeficientes de detalhe');

% Ex: 1.3.
xrac = idwt(CA, CD, 'haar');

figure(3);
plot(n,x,n,xrec,'--');
xlabel('n');
ylabel('x[n] e xrec[n]');

% Ex: 1.4.

[C,L] = wavedec(x,4,'db9');

CA4 = appcoef(C,L,'db9',4);
[CD1,CD2,CD3,CD4] = detcoef(C,L,[1 2 3 4]);

figure(4)
subplot(611);
plot(n,x);
ylabel('x[n]');
title('Sinal e Coeficientes');
subplot(612);

% 1.5



