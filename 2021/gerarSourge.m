function sourge = gerarSourge(type,ampl)

% https://www.pscad.com/webhelp/Master_Library_Models/CSMF/Surge_Generators/Wavelet_Transformation_(WT).htm
% https://teses.usp.br/teses/disponiveis/3/3143/tde-27022018-082038/publico/SadSandriniBorsoiCorr18.pdf
% https://www.unit3compliance.co.uk/iec-surge-eft-generators-for-iso-7637-2-automotive-pre-compliance/


t = 0:0.4:76;
a1 = 0.0145;
b1 = 2.8353;
k1 = 1.037;

a2 = 0.1732;
b2 = 0.0866;
k2 = 4;

if type == 1
    sourge = ampl*k1*(exp(-a1*t)-exp(-b1*t));
    % adiciona a classe do sinal
    sourge(length(sourge)+1) = 5;
else
    sourge = -1*ampl*k2*(exp(-a2*t)-exp(-b2*t));% adiciona a classe do sinal
    sourge(length(sourge)+1) = 6;
end


end