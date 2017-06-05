b = [0.1 0 0.4 0.9 -0.3];
n = -50:49;
m = -54:49;
x = entrada(m);
y = b(1)*x(5:end) + b(3)*x(3:end-2) + b(4)*x(2:end-3) + b(5)*x(1:end-4);
plot(n,x(5:end),n,y)
