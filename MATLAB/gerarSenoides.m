function senoide = gerarSenoides(freq, Ampl, fase, amostras)
t = linspace(0,1,amostras);

freq = randi([1, freq]);
Ampl = randi([1, Ampl]);
fase = randi([1, fase]);

senoide = Ampl * sin(2*pi*freq*t + fase);
% adiciona a classe do sinal
senoide(length(senoide)+1) = 1;

% figure()
% plot(t, senoide); 

end