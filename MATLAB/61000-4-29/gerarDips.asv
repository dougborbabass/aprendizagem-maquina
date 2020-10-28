function dips = gerarDips(ampl, queda, tempo, amostras)

t=0.001:0.01:amostras;

queda = ampl * (queda/100);
segundos = 1 + tempo;

dips=ampl*(heaviside(t))-queda*(heaviside(t-1))+queda*(heaviside(t-segundos));

% adiciona a classe do sinal
dips(length(dips)+1) = 1;

% figure()
% plot(t,dips)

end