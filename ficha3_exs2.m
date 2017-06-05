%PL de Seg - 11:00 H

s = [0.1 0 0.4 0.9 -0.3];
n = -50:49;
m = -54:49; 
x = entrada(m);

y3 = 0.5*x(3:end-2).*x(2:end-3);
y4 = m(3:end-2).*x(2:end-3);

figure(2);
subplot(411);plot(n,x(5:end),n,y3);
subplot(412);plot(n,x(5:end),m1,y2);
subplot(413);plot(n,x(5:end),n,y3);
subplot(414);plot(n,x(5:end),n,y4);