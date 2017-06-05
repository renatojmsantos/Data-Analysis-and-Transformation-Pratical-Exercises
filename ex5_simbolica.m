x = [-10:0.01:10]
y = [-10:0.01:10]

syms x,y
f(x,y) = sin(x*y) + cos(x)

figure(2);fmesh(f)