clear all; close all; clc

amostras = 1000; % no tempo
n_ondas = 1000;

senoides = cell(1,n_ondas);
quadradas = cell(1,n_ondas);
dentes = cell(1,n_ondas);

%% Gerar as ondas
for i = 1:n_ondas
   senoides{i} = gerarSenoides(10,10,10,amostras);
   quadradas{i} = gerarQuadradas(10,10,85,amostras);
   dentes{i} = gerarDentesSerra(10,10,amostras);
end


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
fid = fopen('test.csv','w');
fprintf(fid,'%s\r\n',header_string);
fclose(fid);

for j = 1:n_ondas
    dlmwrite('test.csv', senoides{j}, 'precision', '%.3f', '-append')
end

for k = 1:n_ondas
    dlmwrite('test.csv', quadradas{k}, 'precision', '%.3f', '-append')
end

for l = 1:n_ondas
    dlmwrite('test.csv', dentes{l}, 'precision', '%.3f', '-append')
end

