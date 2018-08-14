% RAPPAPORT, Theodore S. - Comunicações Sem Fio Princípios e Práticas; 1a ed. - Exercício 4.25 - PG. 111
% Desenvolvido por Jessica hahn (https://github.com/jessicasilvahahn) e modificado por Leticia Coelho.

close all;
clear all;
n = 4
desvio = 6
d0 = 1
P0 = 0
D = 1600
d1 = 1:1:D
d2 = D - d1
Ph0 = -112
Pr_min = -118
Pr1 = P0 -10*n*log10(d1./d0);
Pr2 = P0 -10*n*log10(d2./d0);
figure()
plot(Pr1)
hold on
plot(Pr2)
hold off;

%probabilidades
Prb1 = qfunc((Pr1 - (Ph0))./desvio);
Prb2 = qfunc(((Ph0)-Pr2)./desvio);

figure()
plot(Prb1)
hold on
plot(Prb2)
hold off;

%probabilidade total (seguindo teorema estatistico)
Ptot = Prb1.*Prb2;

figure()
plot(Ptot)
