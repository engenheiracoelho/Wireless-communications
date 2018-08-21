clc;close all;clear all;
Rb=1e6;
fd=200;

tau = [0 1 3 4 5]*1e-6; % Pot. de cada componente
pdb = [0 -20 -10 -30 -30];
chan = rayleighchan(1/Rb,fd,tau,pdb);
chan.StoreHistory=1;

info= randint(1,5000,2);
info_mod= pskmod(info,2);

sinal_rx=filter(chan,info_mod);
canal_dopler = abs(chan.PathGains);

figure(1)
plot(20*log10(canal_dopler));

figure(2)
plot(chan);title('4 Hz');