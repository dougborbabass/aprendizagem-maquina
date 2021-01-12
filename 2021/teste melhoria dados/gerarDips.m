function dips = gerarDips(ampl, queda, tempo, amostras)

t=0.1:0.0001:amostras;

% adiciona a classe do sinal
if queda == 100
    classe = 2;
elseif queda <= 70
    classe = 1;
else
    classe = 3;
end

queda = ampl * (queda/100);
segundos = 0.5 + tempo;

dips=ampl*(heaviside(t))-queda*(heaviside(t-0.5))+queda*(heaviside(t-segundos));

% adiciona a classe do sinal
if classe == 2
    dips(length(dips)+1) = 2;
elseif classe == 1
    dips(length(dips)+1) = 1;
else
    dips(length(dips)+1) = 3;
end

% figure()
% plot(t,dips)

end