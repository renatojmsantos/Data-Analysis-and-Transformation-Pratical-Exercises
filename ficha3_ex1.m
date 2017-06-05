function x = entrada(n)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
x = zeros(size(n));
ind  = find((n>=40)&&(n<40));
x(ind) = 1.5*sin(0.025*pi*n(ind));



end

