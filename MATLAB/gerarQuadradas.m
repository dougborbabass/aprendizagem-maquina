function squad1 = gerarQuadradas(tempo, ampl, duty, amostras)
t = linspace(0,1,amostras);

freq = 1/tempo;


squad1 = ampl*square(2*pi*freq*t, duty);
% adiciona a classe do sinal
squad1(length(squad1)+1) = 2;

% figure()
% plot(t,squad1)

end

