n = sym('n');

% Distância com relação ao ponto inicial
%d = [100 200 1000 3000];
d = [10 100 700 1000 1010 1020 1100 2000 3000 5000 7000 9000]

% Potência medida - RSSI
%Pot_med = [0 -20 -35 -70];
Pot_med = [-79.85 -125.90 -164.82 -171.95 -172.15 -172.35 -173.86 -185.82 -193.93 -204.14 -210.87 -215.90]

% Perca de percurso - Potencia estimada
Ei = Pot_med(1) - 10*n*log10(d./d(1));

% Somatório dos erros
J(n) = sum((Pot_med - Ei).^2);

% Deriva para encontrar o erro mínimo - MMSE
x = diff(J)

% Verifica as raizes 
n = roots(sym2poly(x))

% Considera números inteiros
pretty(vpa(x,5));