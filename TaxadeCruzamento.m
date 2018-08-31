close all; clear all; clc;

bit=100000;     % Nº bits 
SNR=20;         % SNR
Tx_Trans = 500; % Taxa de transmissão
tb=1/Tx_Trans;  % Tempo de bits
upSample=40; % Taxa de simbolos
ts=tb/upSample; % Tempo de simbolos
fd = 200;


%% Cria  a informação
info = randint(1,bit,2); % Informação

%% Realiza a modulação MPSK
BPSK = pskmod(info,2,pi);    % Mapeando os inteiros em complexo

%% Rayleight - Cria o canal Rayleight
% filter(chan,s) = r

canal_Ray = rayleighchan(ts,fd);  % Não possui linha de visada
canal_Ray.StoreHistory=1;         % Armazenar os ganhos de multipercurso
sinal_rec_Ray = filter(canal_Ray,BPSK);

%% Demodulação - Resulta em uma informação estimada - Utiliza Biterr para verificar o erro entre a informação estimada e a informação original

for SNR = 0:SNR                       %Verifica o erro de simbolo e SNR
    info_r = awgn(sinal_rec_Ray,SNR); % Cria o canal AWGN
    ganho_Ray = transpose(canal_Ray.PathGains);
    info_f = info_r./ganho_Ray;       % Equalizador - Compensação de fase inserida pelo canal
    PSK_demod = pskdemod(info_f,2,pi);
    [n2(SNR+1),t2(SNR+1)]=biterr(info,PSK_demod>0);
end

semilogy([0:SNR],t2);title('Relação erro de bit');ylabel('Relação Sinal Ruido - SNR');xlabel('SNR - dB');
