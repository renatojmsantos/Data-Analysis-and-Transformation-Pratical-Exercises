close all
clear all

% ================ 1.1.1.===============
T0 = input('introduz o periodo fundamental: ');
duracao=3; %XT0
% ================= 1.1.2. =============
t = linspace(0,duracao*T0-T0/500,500);
%================== 1.1.3. =============
op = menu('Qual a forma de onda?','Quadrada','Dente de Serra','Outra');

if op == 1
    syms t
    xt = heaviside(t)-2*heaviside(t-T0/2); % representacao simbolica
    t = linspace(0,duracao*T0-T0/500,500);
    x = square(2*pi*t/T0);
elseif op==2
    syms t
    xt = (2/T0)*t-1; % representao simbolica durante 1 periodo
    t = linspace(0,duracao*T0-T0/500,500);
    x = sawtooth(2*pi*t/T0);
else
    syms t
    xt = input('x(t)=');
    t = linspace(0,duracao*T0-T0/500,500);
    x = subs(xt,t);
end

figure(1);
plot(t,x,'linewidth',3)
set(gca,'fontsize',14)
title('Sinal periodico de tempo continuo x(t)')
xlabel('t[s]')
ylabel('Amplitude');

% ================= 1.1.4 ============================
m_max = input('Valor de m_max (default=50)=');
if isempty(m_max)
    m_max=50;
end

[Cm,tetam] = SerieFourier(t',x',T0,m_max);
m=0:m_max;

figure(2)
subplot(2,1,1)
stem(m,Cm,'bo');
title('Coeficientes da Série de Fourier trigonométrica')
ylabel('Cm');
xlabel('m');
subplot(2,1,2);
stem(m,tetam,'bo');
ylabel('tetam (rad)');
xlabel('m');


% 1.1.5 
% ....
if isempty(mt)
    mt = [0 1 3 5 10 50];
end
labels = cell(1,numel(mt)+1);
labels{1,1} = 'Real';
for k=1:length(mt)
    x1=zeros(size(t));
    for m=0:mt(k)
        x1 = x1+Cm(m+1)*cos(m*2*pi/T0*t+tetam(m+1));
    end
    labels{1,k+1}=sprintf('m=%d',mt(k));
    plot(t,x1,'--');
end
set(gca,'fontsize',14)
legend(labels)
title('Sinal periódico de tempo continuo x(t) e suas aproximidades')
    
%================ 1.1.6. ===================
cm= zeros(1,2*m_max+1)
k=1;
for mm=-m_max:m_max
    if mm~=0
        cm(k)=(Cm(abs(mm)+1)/2)*exp(sign(mm)*lj*tetam(abs(mm)))
    else
        cm(k)=Cm(1)*cos(tetam(1))
    end
    
    k=k+1;
end

% Calculo simbólico de cm

syms m t

cms = (1/T0)*int(xt*exp(-1j*m*(2*pi/T0)*t),t,0,T0);

cms_v=[];
for mm=-m_max:m_max;
    cms_v = [cms_v,double(limit(cms,mm))];
end


subplot(2,1,1);stem(mm,abs(cm));
hold on
stem(mm,abs(cms_v),'+')
xlabel('m')
ylabel('|cm|')
legend('Calc. Numérico','Calc. Simbólico')
subplot(2,1,2);stem(mm,angle(cm));
hold on
stem(mm,angle(cms_v),'+')
xlabel('m')
ylabel('<cm')
legend('Calc. Numérico','Calc. Simbólico')







    
    
    