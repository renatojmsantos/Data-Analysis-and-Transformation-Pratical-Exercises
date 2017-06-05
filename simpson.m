function [ Is ] = simpson( f1,t1,tn,h )
t = t1;
Is = eval(f); %f(t1)
t = tn;
Is = Is + eval(f); %f(t1) + f(tn)

for t= t1+h: 2*h: tn-h
    Is = Is + 4* eval(f);
end

for t = t1+2*h: 2*h: tn-2*h
    Is = Is + 2*eval(f);
end
Is = Is * h/3


