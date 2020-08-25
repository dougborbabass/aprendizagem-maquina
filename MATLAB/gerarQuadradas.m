function squad1 = gerarQuadradas(freq, ampl, duty, amostras)
t = linspace(0,1,amostras);

freq = randi([1, freq]);
ampl = randi([1, ampl]);
duty = randi([1, duty]);

squad1 = ampl*square(2*pi*freq*t, duty);
% adiciona a classe do sinal
squad1(length(squad1)+1) = 2;

% figure()
% plot(t,squad1)

end

