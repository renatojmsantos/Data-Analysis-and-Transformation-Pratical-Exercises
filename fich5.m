b3 = 0.5;
b4 = -0.34 - 0.04 * mod(1 + 4, 2);
a1 = -1.5 + 0.1 * mod(4, 2);
a2 = 0.48 + 0.08 * mod(1 + 4, 2);

syms z

%1.1
Gz = ()
pretty(Gz)

%1.2
b = [ 0 0 0 b3 b4 ];
a = [ 1 a1 a2 0 0 ];

numGz = b;
denGZ = a;
disp('Zeros');
zGz=roots(numGz);
disp('Polos');
pGz=roots(denGz);

zplane(b,a);

%1.3
if(all(abs(pGz)<1))
    disp('O sistema e estavel');
else
    disp('O sistema e instavel');
end

%1.4
Ganho=subs(Gz,1);
Ganho2=ddcgain(numGz,denGz);

%1.5
Hz=Gz;
hn=iztrans(Hz);
pretty(hn)

%1.6
n = 0:50;
stem(n,subs(hn,n));

%alternativa
h1=dimpulse(numGz, numGz,denGz,length(n));
stem(n,h1,'+');
title('resposta a impulso do sistema via iztrans (o) e dim');
xlabel('n');
ylable('h[n]');

% 1.7
S2 = sum(h1);
disp('O sitstema é estavel pq sum(h2) é finita');

% 1.8.
syms n
sympref('HeavisideAtOrigin',1);
Xz = ztrans(heaviside(n))
disp('Transformada de z de x[n]:')
pretty(Xz)

Yz = Hz*Xz;
yn = iztrans(Yz);
disp('Expressao de y[n]:')
pretty(yn)

% ====== 1.9. =======
n = [0:50]
figure;
stairs(n,subs(yn,n),'o')

% ====== 1.10 =======
vf1 = limit()
vf2 = limit(yn,inf)

% ===== 1.11 ========
syms n
xn = 3*(heaviside(n-2)-heaviside(n-10));


%====== 1.12 ========


% ====== 1.13 =======
subs o
H0 = double(subs(Ho,0))
Ganho

