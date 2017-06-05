s = [0.1 0 0.4 0.9 -0.3];
m = -50:49;
x = entrada(m);
[m1,y] = transf_lin(x,m,2,4);
y2 = 0.6*y;
plot(n,x,m1,y2);