x = [-10:0.01:10]
y = [-10:0.01:10]

[x,y] = meshgrid(x,y);
f = sin(x*y) + cos(x);

figure(1);mesh(x,y,f);