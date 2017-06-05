function sig= x( n )
ix = inion((find(n<-40)),find(n>40)); %obter indices onde u(n+40) -u
sig = 1.5*sin(0.025*pi*n);
sig(ix)=0; % impor que o sinal deve ser zero quando u(n+40) -u (n-

end