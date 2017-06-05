close all
clear all


% ------ noise
r = (rand(1,numel(xn).*0.4) - 0.2; % gerar ruido
xnr = xn + r;
ynr = b0*atrasa(xnr,0) + b1*atrasa(xnr,1) + b2*atrasa(xnr,2) + b3*atr


% ---- ex 1.2
%================= Resposta do sistema com base em h1 ======
yln = conv(cn,hn,'same');
stem(n,yln);
title('yl[n]')
xlabel('n')