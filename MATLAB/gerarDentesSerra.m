function ds1 = gerarDentesSerra(freq, ampl, amostras)
t = linspace(0,1,amostras);

freq = randi([1, freq]);
ampl = randi([1, ampl]);
pico = randi([0, 1]);

ds1 = ampl*sawtooth(2*pi*freq*t,pico);
% adiciona a classe do sinal
ds1(length(ds1)+1) = 3;

% figure()
% plot(t,ds1)

end