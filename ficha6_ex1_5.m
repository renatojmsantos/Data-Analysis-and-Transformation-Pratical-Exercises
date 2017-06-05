% calculo simbolico

syms m t

cms = (1/T0)*int(xt*exp(-1j*m*(2*pi/T0)*t),t,0,T0);

cms_v= [];
for mm= -m_max:m_max;
    cms_v = [cms_v,double(limit(cms,mm))];
end

mm=-m_max:m_max;
figure(4)
subplot(2,1,1);stem(mm,abs(cm));
hold on
stem(mm,abs(cms_v),'+')
