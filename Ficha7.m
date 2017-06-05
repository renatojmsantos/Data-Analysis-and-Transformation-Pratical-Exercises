% Ex : 1

A = 2;
a = 0.7;
syms t
xt = A*exp(-a*t) * sin(4*pi*t)*(heaviside(t) - heaviside(t-6));
Xw = fourier(xt);
pretty(Xw)
w = -15*pi:pi/8:15*pi-pi/8;
X = double(subs(Xw));

figure(1);
subplot(211);
plot(w,abs(X));
ylabel('|X|');
subplot(212);
plot(w,unwrap(angle(X)));
xlabel('w[rad/s]');
ylabel('<X');
title('TF de x(t)');



% Ex: 1.2
xt1 = ifourier(Xw,t);
pretty(xt1);
t = 0:6/500: 6-6/500;
x = double(subs(xt));
x1 = double(subs(xt1));

figure(2);
plot(t,x,t,x1,'-.r');
xlabel('t[s]');
ylabel('x(t)');


% Ex: 1.3.
syms m t
T0 = 6;
w0 = 2*pi/T0;
cmm = 1/T0*int(xt*exp(-j*m*w0*t),0,T0);
pretty(cmm);
m_max = 40;
m = -m_max: m_max;
cm = double(subs(cmm));

figure(3);
subplot(211);
plot(w,abs(X),m*w0,T0*abs(cm),'ob');
xlabel('w[rad/s]');
ylabel('|X| e |cm|');
subplot(212);
plot(w,unwrap(angle(X)),m*w0,unwrap(angle(cm)),'ob');
xlabel('w[rad/s]');
ylabel('<X e <cm')



% Ex 1.4.
ind = find(abs(abs(cm) - max(abs(cm))) < 0.001)  % cm ou X
m(ind(2))
m(ind(2))*w0   % alternativa: w(ind(2))
4*pi


