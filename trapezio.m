function [ It ] = trapezio( f,t1,tn )
t = t1;
It = eval (f); %f(t1)

t = tn;
It = It + eval(f); %f(t1) + f(tn)
It = It/2
for t = t1+h:h:tn-h
    It = It + eval(f);
end
It = It * h
