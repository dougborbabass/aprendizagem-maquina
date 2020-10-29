clc;
clear;

amostras = 29001;
% Número de parametros na tabela
nQuedas = 10;
nShorts = 7;
voltageDips = cell(1,nQuedas);
shortInterruption = cell(1,nShorts);

%% Gerar voltage dips
voltageDips{1} = gerarDips(3.3,40,0.01,3);
voltageDips{2} = gerarDips(3.3,40,0.03,3);
voltageDips{3} = gerarDips(3.3,40,0.1,3);
voltageDips{4} = gerarDips(3.3,40,0.3,3);
voltageDips{5} = gerarDips(3.3,40,1,3);

voltageDips{6} = gerarDips(3.3,70,0.01,3);
voltageDips{7} = gerarDips(3.3,70,0.03,3);
voltageDips{8} = gerarDips(3.3,70,0.1,3);
voltageDips{9} = gerarDips(3.3,70,0.3,3);
voltageDips{10} = gerarDips(3.3,70,1,3);


%% Gerar Short interruption 
shortInterruption{1} = gerarDips(3.3,100,0.001,3);
shortInterruption{2} = gerarDips(3.3,100,0.003,3);
shortInterruption{3} = gerarDips(3.3,100,0.01,3);
shortInterruption{4} = gerarDips(3.3,100,0.03,3);
shortInterruption{5} = gerarDips(3.3,100,0.1,3);
shortInterruption{6} = gerarDips(3.3,100,0.3,3);
shortInterruption{7} = gerarDips(3.3,100,1,3);


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
