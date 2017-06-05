b = [0.1 0 0.4 0.9 -0.3];
n = -50:49;
m = -54:49;
x = entrada(m);
xr = x + 0.4*rand(size(x))-0.2;
yr = b(1)*xr(5:end) + b(3)*xr(3:end-2) + b(4)*xr(2:end-3) + b(5)*xr(1:end-4);
plot(n,x(5:end),n,y,n,xr(5:end),n,yr);
