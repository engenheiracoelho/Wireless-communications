% RAPPAPORT, Theodore S. - Comunicações Sem Fio Princípios e Práticas; 1a ed. - Exercício 4.25 - PG. 111
% Desenvolvido por Jessica hahn (https://github.com/jessicasilvahahn) e modificado por Leticia Coelho.

close all;clear all;clc;
n = 4;
sigma = 6; % Desvio padrão
d0 = 1;
P0 = 0; % Potência média
D = 1600;
d1 = 1:1:D;
d2 = D - d1;
Ph0 = -112; % dBm
Pr_min = -118; % dBm

% Modelo de propagação em larga escala - Potencia cai até encontrar o limiar
% de Handoff, então inicia a transferência para a próxima Estação Base (Eb).

Pr1 = P0 -10*n*log10(d1./d0); % Potência recebida - Eb1
Pr2 = P0 -10*n*log10(d2./d0); % Potência recebida - Eb2

% Ponto de Handoff é o limiar de troca de Eb.
figure(1)
plot(Pr1);hold on;plot(Pr2);text(810,-116,'Handoff');plot(802,-116,'rs');hold off;legend('Pot - Eb1','Pot - Eb2');title('Potência recebida');

% Probabilidades
Prb1 = qfunc((Pr1 - (Ph0))./sigma); % Pr1 < Ho
Prb2 = qfunc(((Ph0)-Pr2)./sigma); % Pr2 > Min
Ptot = Prb1.*Prb2; % Handoff acontecer

figure(2)
plot(Prb1);hold on;plot(Prb2);plot(Ptot);hold off;legend('Pr[Pt1 < Ho]','Pr[Pt2 > Min]','Pr[Ho]');title('Probabilidades');