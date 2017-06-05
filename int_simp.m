function int_simp = int_simpson( f1,t1,tn,h )
syms t;
ft0 = double(subs(f,a));
ftn = double(subs(f,b));
tv = a+h;
ssi = 0;

while tv<(b-h)
    ssi = ssi + double(subs(f,tv));
    tv = tv + 2*h;
end
tv = a + 2*h;
ssp = 0;
while tv<(b-h)
    ssp = ssp + double(subs(f,tv));
    tv = tv + 2*h;
end
intsimp = (ft0+ftn+4*ssi+2*ssp)*h/3;
end

