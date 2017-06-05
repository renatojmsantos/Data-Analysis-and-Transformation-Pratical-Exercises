% 1.1
close all;
clear all;
w0 = 10*pi;
fs = 100;
Ts = 1/fs;

syms t n
xtt = -1 + 3*sin(50*pi*t) + 4*cos(20*pi*t+pi/4)*sin(40*pi*t)
xnn = subs(xtt,t,n*Ts)

% Ex 1.2
w0
w= [0,20*pi,50*pi,60*pi]
Omega = w*Ts
Omega = Ts*w0
T0 = 2*pi/w0
fo = 1/T0
Ts = 1/fs;
N = T0/Ts

% Ex: 1.3.
t = 0:0.001:T0;
xt = double(subs(xtt));
n = 0: N-1;
xn = double(subs(xtt));
n = 0:N-1;
xn = double(subs(xnn));
figure(1)
plot(t,xt,n*Ts,xn,'+');
legend('Sinal Contínuo, x(t)','Sinal Amostrado x[n]')
xlabel('t [s]');

% Ex: 1.4.
x = fftshift(fft(xn));
abs_X = abs(x);
ang_X = angle(x);

if(mod(N,2) == 0)
    Omega = -pi:2*pi/N:pi-2*pi/N;
else
    Omega = -pi+pi/N: 2*pi/N:pi-pi/N;
end

figure(2);
subplot(211)
plot(Omega,abs_X,'o');
title('Transformada de Fourier Discreta');
ylabel('Magnitude')
xlabel('OMega[rad]')
subplot(212)
plot(Omega,ang_X,'o');
ylabel('Fase')
xlabel('Omega [rad]')

% Ex 1.5.
cm= X/N;
ind = find(abs(cm) < 0.0001);
cm(ind) = 0;
figure(3);
subplot(211)
plot(Omega/Omega0,abs(cm),'o');
title('Coeficientes da Série de Fourier complexa');
ylabel('|cm|')
xlabel('m')
subplot(212)
plot(Omega/Omega',unwrap(angle(cm)),'o');
ylabel('<cm')
xlabel('m')

% Ex 1.6
ind = find(Omega>=0);
Cm = [abs(cm(ind(1))) 2*abs(cm(ind(2:end)))];
tetam = angle(cm(ind));

figure(4);
subplot(211)
plot(Omega(ind)/Omega,Cm,'o');
title('Coeficinetes da Série de Fourier trigonométrica');
ylabel('Cm')
xlabel('m')
subpot(212)
plot(Omega(ind/Omega0,tetam,'o'))
ylabel(tetam');
xlabel('m')

% ex 1.7.
xtr = zeros(size(t));
m_max = Omega(ind(end))/Omega0;
for m=0:m_max
    xtr = xtr + Cm(m+1) + cos(m*w0*t + tetam(m+1));
end

figure(5)
plot(t,xt,t,xtr,'--');
title('sinal x(t) e sinal reconstruido xr(t)');
xlabel('t [s]')

% 2.1
close all
clear all
fich = 'escala.wav';

%fich = 'sax-phrase-short.wav';
%fich = 'piano-phrase.wav';
[x,fs] = audioread(fich);
soud(x,fs);

%2.2
disp('frequencia de amostragem, f, [Hz]:')
fs
Ts = 1/fs;
disp('periodo fundamental de x[n], N:')
N = length(x)
disp('frequencia fundamental de x[n] Omega0 [rad]:')
Omega0 = 2*pi/N
disp('resolucao em frequencia [Hz]:')
deltaf = fs/N


% ex 2.5
f_notas = [262;277;294;311;330;349;370;392;315;440] %.... (ver mais no enunciado)
notas = ['Dó' ; 'Dó s'; 'Ré ' ; 'Ré s' ; 'Mi '; 'Fá '] % ....
ind_n = [];
for k=1: length(indp)
    ind_n = [ind_n; find(abs(f_notas- f(indp(k))) <5)];
end
notas_x = notas(ind_n,:)


