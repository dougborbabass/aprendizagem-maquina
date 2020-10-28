clc;
clear;

amostras = 1000;
% Número de parametros na tabela
nQuedas = 20;
voltageDips = cell(1,nQuedas);

%% Gerar voltage dips
voltageDips{1} = gerarDips(3.3,40,0.01,10);
voltageDips{2} = gerarDips(3.3,40,0.03,10);
voltageDips{3} = gerarDips(3.3,40,0.1,10);
voltageDips{4} = gerarDips(3.3,40,0.3,10);
voltageDips{5} = gerarDips(3.3,40,1,10);

voltageDips{6} = gerarDips(3.3,70,0.01,10);
voltageDips{7} = gerarDips(3.3,70,0.03,10);
voltageDips{8} = gerarDips(3.3,70,0.1,10);
voltageDips{9} = gerarDips(3.3,70,0.3,10);
voltageDips{10} = gerarDips(3.3,70,1,10);

% voltageDips{11} = gerarDips(5,40,0.01,10);
% voltageDips{12} = gerarDips(5,40,0.03,10);
% voltageDips{13} = gerarDips(5,40,0.1,10);
% voltageDips{14} = gerarDips(5,40,0.3,10);
% voltageDips{15} = gerarDips(5,40,1,10);
% 
% voltageDips{16} = gerarDips(5,70,0.01,10);
% voltageDips{17} = gerarDips(5,70,0.03,10);
% voltageDips{18} = gerarDips(5,70,0.1,10);
% voltageDips{19} = gerarDips(5,70,0.3,10);
% voltageDips{20} = gerarDips(5,70,1,10);


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


%%
%write the string to a file
fid = fopen('iec6100429.csv','w');
fprintf(fid,'%s\r\n',header_string);
fclose(fid);

for j = 1:nQuedas
    dlmwrite('iec6100429.csv', voltageDips{j}, 'precision', '%.3f', '-append')
end


