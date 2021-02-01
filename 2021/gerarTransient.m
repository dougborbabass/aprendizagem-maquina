function transient = gerarTransient(pico)

n = 0.1:(1/100e3):0.10191;

transient = pico*heaviside(n);

for x = 1:(length(transient)-1)
    if mod(x,2) ~= 1
       transient(x) = 0;        
    end
end

% adiciona a classe do sinal
transient(length(transient)) = 4;

end