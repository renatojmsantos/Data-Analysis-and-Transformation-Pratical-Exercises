function [ m,y ] = transf_lin( x,n,a,b )

mt = (n+b)/a;
m1 = mt(mod(mt,1) == 0);
x1 = x(mod(mt,1) == 0);
m = min(m1):max(m1);
y(m1-min(m1)+1) = x1;

end

