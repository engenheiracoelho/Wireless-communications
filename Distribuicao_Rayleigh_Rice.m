clear all; close all; clc;

ts = 1/10000;
fd = 200;
k = 1000; % Escala linear

%% Informação
info = randint(1,700000);
% Representa a modulação em fase, onde acontece um
% mapeamento em que 1 = 0° e -1 = 180° 
info_mod = pskmod(info,2);

%% Cria o canal Rayleight
% Não possui linha de visada
canal_Ray = rayleighchan(ts,fd);
% Armazenar os ganhos de multipercurso
canal_Ray.StoreHistory=1;

%% Cria o canal Rice
% Sem linha de visada na maior parte das situações, não sempre. 
% Pelo menos uma componente predominante.
% Mesmo que o ambiente 'se mova' a transmissão continua acontecendo. 
canal_Rice = ricianchan(ts,fd,k); 
canal_Rice.StoreHistory=1;% Armazenar os ganhos de multipercurso

%% Informação passa pelo canal, sinal transmitido.
sinal_rec_Ray = filter(canal_Ray,info_mod);
sinal_rec_Rice = filter(canal_Rice,info_mod);

%% Ganho
ganho_Ray = abs(canal_Ray.PathGains);
ganho_Rice = abs(canal_Rice.PathGains);

%% Observando apenas o canal, considerando o ganho, independente da transmissão.
figure(1)
subplot(211);plot(20*log10(ganho_Ray));
subplot(212);plot(20*log10(ganho_Rice));% Apenas considerando o ganho do canal;

figure(2);hist(ganho_Ray,100);
figure(3);hist(ganho_Rice,100);

% Quando tenho linha de visada a intensidade da variação do canal diminui,
% no entanto a velocidade em que o canal acontece é a mesma. O que muda é a
% intensidade das variações; 



