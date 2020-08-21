clear all; close all; clc

% dados da senoide
f = 10000;%Freq entrada Hz
tempo = 0:1/(99*f):1/f;

% dados dente de serra
sigfreq = 10;
sampfreq = 100;
Tf = 10;
T = Tf*(1/sigfreq);
dt = 1/sampfreq;
t = 0:dt:T-dt;

%% gerar senoide
sinal1 = 1.2*sin(2.65*pi*f*tempo);
sinal2 = 2.3*sin(2.8*pi*f*tempo);
sinal3 = 4.22*sin(2.3*pi*f*tempo);
sinal4 = 8.125*sin(20*pi*f*tempo);
sinal5 = 10.3*sin(10*pi*f*tempo);
sinal6 = 12.3*sin(2.65*pi*f*tempo);
sinal7 = 14.87*sin(12*pi*f*tempo);
sinal8 = 18.34*sin(32*pi*f*tempo);
sinal9 = 20.14*sin(2*pi*f*tempo);
sinal10 = 22.7*sin(2*pi*f*tempo);

%% gerar dente de serra
x1 = sawtooth(2.7*pi*sigfreq*t);
x2 = (x1 + 1)*2.33;
x3 = (x1 + 1)*3.5;
x4 = (x1 + 1)*44;
x5 = (x1 + 1)*5+3;
x6 = (x1 + 1)*6.156;
x7 = (x1 + 1)*17;
x8 = (x1 + 1)*18;
x9 = (x1 + 1)*9.5;
x10 = (x1 + 1)*10.5;

%% dados onda quadrada
squad1 = 1.35*square(2*pi*8*t);
squad2 = 2.8*square(2*pi*2*t);
squad3 = 3.5*square(2*pi*3*t);
squad4 = 4.9*square(2*pi*7*t);
squad5 = 5.7*square(2*pi*10*t);
squad6 = 6.5*square(2*pi*4*t);
squad7 = 7.2*square(2*pi*3.36*t);
squad8 = 8.33*square(2.98*pi*4*t);
squad9 = 9.54*square(2.7*pi*4*t);
squad10 = 10.54*square(2.65*pi*4.2*t);


%% plotar sinal
figure(1)
subplot(2,5,1)
plot(tempo,sinal1)
subplot(2,5,2)
plot(tempo,sinal2)
subplot(2,5,3)
plot(tempo,sinal3)
subplot(2,5,4)
plot(tempo,sinal4)
subplot(2,5,5)
plot(tempo,sinal5)
subplot(2,5,6)
plot(tempo,sinal6)
subplot(2,5,7)
plot(tempo,sinal7)
subplot(2,5,8)
plot(tempo,sinal8)
subplot(2,5,9)
plot(tempo,sinal9)
subplot(2,5,10)
plot(tempo,sinal10)

figure(2)
subplot(2,5,1)
plot(t,x1)
subplot(2,5,2)
plot(t,x2)
subplot(2,5,3)
plot(t,x3)
subplot(2,5,4)
plot(t,x4)
subplot(2,5,5)
plot(t,x5)
subplot(2,5,6)
plot(t,x6)
subplot(2,5,7)
plot(t,x7)
subplot(2,5,8)
plot(t,x8)
subplot(2,5,9)
plot(t,x9)
subplot(2,5,10)
plot(t,x10)

figure(3)
subplot(2,5,1)
plot(t,squad1)
subplot(2,5,2)
plot(t,squad2)
subplot(2,5,3)
plot(t,squad3)
subplot(2,5,4)
plot(t,squad4)
subplot(2,5,5)
plot(t,squad5)
subplot(2,5,6)
plot(t,squad6)
subplot(2,5,7)
plot(t,squad7)
subplot(2,5,8)
plot(t,squad8)
subplot(2,5,9)
plot(t,squad9)
subplot(2,5,10)
plot(t,squad10)

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
sinal6(length(sinal6)+1) = 1;
sinal7(length(sinal7)+1) = 1;
sinal8(length(sinal8)+1) = 1;
sinal9(length(sinal9)+1) = 1;
sinal10(length(sinal10)+1) = 1;

x1(length(x1)+1) = 2;
x2(length(x2)+1) = 2;
x3(length(x3)+1) = 2;
x4(length(x4)+1) = 2;
x5(length(x5)+1) = 2;
x6(length(x6)+1) = 2;
x7(length(x7)+1) = 2;
x8(length(x8)+1) = 2;
x9(length(x9)+1) = 2;
x10(length(x10)+1) = 2;

squad1(length(squad1)+1) = 3;
squad2(length(squad2)+1) = 3;
squad3(length(squad3)+1) = 3;
squad4(length(squad4)+1) = 3;
squad5(length(squad5)+1) = 3;
squad6(length(squad6)+1) = 3;
squad7(length(squad7)+1) = 3;
squad8(length(squad8)+1) = 3;
squad9(length(squad9)+1) = 3;
squad10(length(squad10)+1) = 3;

%%
%write the string to a file
fid = fopen('test2.csv','w');
fprintf(fid,'%s\r\n',header_string);
fclose(fid);

dlmwrite('test2.csv', sinal1, 'precision', '%.3f', '-append')
dlmwrite('test2.csv', sinal2, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal3, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal4, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal5, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal6, 'precision', '%.3f', '-append')
dlmwrite('test2.csv', sinal7, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal8, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal9, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', sinal10, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x1, 'precision', '%.3f', '-append')
dlmwrite('test2.csv', x2, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x3, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x4, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x5, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x6, 'precision', '%.3f', '-append')
dlmwrite('test2.csv', x7, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x8, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x9, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', x10, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad1, 'precision', '%.3f', '-append')
dlmwrite('test2.csv', squad2, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad3, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad4, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad5, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad6, 'precision', '%.3f', '-append')
dlmwrite('test2.csv', squad7, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad8, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad9, 'precision', '%.3f', '-append');
dlmwrite('test2.csv', squad10, 'precision', '%.3f', '-append');
