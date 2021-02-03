clc;
clear;

amostras = 191;
% Número de parametros na tabela
nQuedas = 18;
nShorts = 12;
nVariations = 18;
nTransients = 8;

voltageDips = cell(1,nQuedas);
shortInterruption = cell(1,nShorts);
voltageVariation = cell(1,nVariations);
transientes = cell(1,nTransients);

% IEC 61000-4-29
%% Gerar voltage dips
voltageDips{1} = gerarDips(3.3,40,0.1,2);
voltageDips{2} = gerarDips(3.3,40,0.3,2);
voltageDips{3} = gerarDips(3.3,40,1,2);

voltageDips{4} = gerarDips(3.3,70,0.1,2);
voltageDips{5} = gerarDips(3.3,70,0.3,2);
voltageDips{6} = gerarDips(3.3,70,1,2);

voltageDips{7} = gerarDips(3.3,40,0.1,2);
voltageDips{8} = gerarDips(3.3,40,0.3,2);
voltageDips{9} = gerarDips(3.3,40,1,2);

voltageDips{10} = gerarDips(3.3,70,0.1,2);
voltageDips{11} = gerarDips(3.3,70,0.3,2);
voltageDips{12} = gerarDips(3.3,70,1,2);

voltageDips{13} = gerarDips(3.33,40,0.1,2);
voltageDips{14} = gerarDips(3.33,40,0.3,2);
voltageDips{15} = gerarDips(3.33,40,1,2);

voltageDips{16} = gerarDips(3.33,70,0.1,2);
voltageDips{17} = gerarDips(3.33,70,0.3,2);
voltageDips{18} = gerarDips(3.33,70,1,2);


%% Gerar Short interruption 
shortInterruption{1} = gerarDips(3.3,100,0.1,2);
shortInterruption{2} = gerarDips(3.3,100,0.3,2);
shortInterruption{3} = gerarDips(3.3,100,1,2);

shortInterruption{4} = gerarDips(3.3,100,0.1,2);
shortInterruption{5} = gerarDips(3.3,100,0.3,2);
shortInterruption{6} = gerarDips(3.3,100,1,2);

shortInterruption{7} = gerarDips(3.33,100,0.1,2);
shortInterruption{8} = gerarDips(3.33,100,0.3,2);
shortInterruption{9} = gerarDips(3.33,100,1,2);

shortInterruption{10} = gerarDips(3.33,100,0.1,2);
shortInterruption{11} = gerarDips(3.33,100,0.3,2);
shortInterruption{12} = gerarDips(3.33,100,1,2);

% %% Gerar Voltage Variation 
voltageVariation{1} = gerarDips(3.3,80,0.1,2);
voltageVariation{2} = gerarDips(3.3,80,0.3,2);
voltageVariation{3} = gerarDips(3.3,80,1,2);

voltageVariation{4} = gerarDips(3.3,120,0.1,2);
voltageVariation{5} = gerarDips(3.3,120,0.3,2);
voltageVariation{6} = gerarDips(3.3,120,1,2);

voltageVariation{7} = gerarDips(3.3,80,0.1,2);
voltageVariation{8} = gerarDips(3.3,80,0.3,2);
voltageVariation{9} = gerarDips(3.3,80,1,2);

voltageVariation{10} = gerarDips(3.3,120,0.1,2);
voltageVariation{11} = gerarDips(3.3,120,0.3,2);
voltageVariation{12} = gerarDips(3.3,120,1,2);

voltageVariation{13} = gerarDips(3.33,80,0.1,2);
voltageVariation{14} = gerarDips(3.33,80,0.3,2);
voltageVariation{15} = gerarDips(3.33,80,1,2);

voltageVariation{16} = gerarDips(3.33,120,0.1,2);
voltageVariation{17} = gerarDips(3.33,120,0.3,2);
voltageVariation{18} = gerarDips(3.33,120,1,2);


%% Gerar Transientes IEC 61000-4-4 fast transients/bursts.

transientes{1} = gerarTransient(250);
transientes{2} = gerarTransient(500);
transientes{3} = gerarTransient(1e3);
transientes{4} = gerarTransient(2e3);

transientes{5} = gerarTransient(250);
transientes{6} = gerarTransient(500);
transientes{7} = gerarTransient(1e3);
transientes{8} = gerarTransient(2e3);

%% Gerar o header
for i = 1:amostras
    if i == amostras
        names(i+1) = "Forma de onda";
    end
    names(i) = "Amostra " + i;
end

header_string = names{1};
for i = 2:length(names)
    header_string = [header_string,',',names{i}];
end


%
% write the string to a file
fid = fopen('iec6100429.csv','w');
fprintf(fid,'%s\r\n',header_string);
fclose(fid);

for j = 1:nQuedas
    dlmwrite('iec6100429.csv', voltageDips{j}, 'precision', '%.3f', '-append')
end

for x = 1:nShorts
    dlmwrite('iec6100429.csv', shortInterruption{x}, 'precision', '%.3f', '-append')
end

for x = 1:nVariations
    dlmwrite('iec6100429.csv', voltageVariation{x}, 'precision', '%.3f', '-append')
end

for x = 1:nTransients
    dlmwrite('iec6100429.csv', transientes{x}, 'precision', '%.3f', '-append')
end
