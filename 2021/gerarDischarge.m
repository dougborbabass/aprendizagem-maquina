function discharge = gerarDischarge(ganho)

%Make IEC 61000-4-2 current waveform

I1 = 16.6; %A
I2 = 9.3; %A
tau1 = 1.1e-9; %ns
tau2 = 2e-9; %ns
tau3 = 12e-9; %ns
tau4 = 37e-9; %ns
n = 1.8;
t=0:0.345e-9:65.6e-9; 

i1 = (I1 / exp(-(tau1/tau2)*(n*tau2/tau1)^(1/n)) * (((t/tau1).^n .* ...
    exp(-t/tau2))./(1+(t/tau1).^n)));

i2 = (I2 / exp(-(tau3/tau4)*(n*tau4/tau3)^(1/n)) * (((t/tau3).^n .* ...
    exp(-t/tau4))./(1+(t/tau3).^n)));

discharge = ganho*(i1 + i2);

% adiciona a classe do sinal
discharge(length(discharge)+1) = 7;
end

% plot(t,i),grid;