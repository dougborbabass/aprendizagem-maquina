clear all; close all; clc
% dados do sinal
f = 10000;%Freq entrada Hz

%%
% gerar sinal
tempo = 0:1/(100*f):1/f;
sinal1 = 1*sin(2*pi*f*tempo);
sinal2 = 2*sin(2*pi*f*tempo);
sinal3 = 4*sin(2*pi*f*tempo);
sinal4 = 8*sin(2*pi*f*tempo);
sinal5 = 10*sin(2*pi*f*tempo);
% plotar sinal
plot(tempo,sinal1)
hold;

%%
% Gera o header

for i = 1:length(sinal1)
    if i == length(sinal1)
        names(i+1) = "Forma de onda";
    end
    names(i) = "Amostra " + i;
end

header_string = names{1};
for i = 2:length(names)
    header_string = [header_string,',',names{i}];
end

%% adiciona a classe do sinal
sinal1(length(sinal1)+1) = 1;
sinal2(length(sinal2)+1) = 1;
sinal3(length(sinal3)+1) = 1;
sinal4(length(sinal4)+1) = 1;
sinal5(length(sinal5)+1) = 1;

%%
%write the string to a file
fid = fopen('test.csv','w');
fprintf(fid,'%s\r\n',header_string);
fclose(fid);

dlmwrite('test.csv', sinal1, 'precision', '%.3f', '-append')
dlmwrite('test.csv', sinal2, 'precision', '%.3f', '-append');
dlmwrite('test.csv', sinal3, 'precision', '%.3f', '-append');
dlmwrite('test.csv', sinal4, 'precision', '%.3f', '-append');
dlmwrite('test.csv', sinal5, 'precision', '%.3f', '-append');

