clc;
Rb=10e3;
fd4=4;fd40=40;

chan4 = rayleighchan(1/Rb,fd4);
chan40 = rayleighchan(1/Rb,fd40);

chan4.StoreHistory=1;
chan40.StoreHistory=1;

info= randint(1,5000,2);
info_mod= pskmod(info,2);

sinal_rx_4=filter(chan4,info_mod);
sinal_rx_40=filter(chan40,info_mod);

canal_dopler_4 = abs(chan4.PathGains);
canal_dopler_40 = abs(chan40.PathGains);

subplot(211)
plot(20*log10(canal_dopler_4))
subplot(212)
plot(20*log10(canal_dopler_40))
