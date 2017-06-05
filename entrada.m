function x = entrada(n)

x = zeros(size(n));
ind  = find((n>=-40)&(n<40));
x(ind) = 1.5*sin(0.025*pi*n(ind));

end

