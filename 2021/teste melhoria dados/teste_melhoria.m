clc;
clear;

% Número de parametros na tabela
nQuedas = 1;
nShorts = 1;
nVariations = 1;

voltageDips = cell(1,nQuedas);
shortInterruption = cell(1,nShorts);
voltageVariation = cell(1,nVariations);


%% Gerar voltage dips
voltageDips{1} = gerarDips(3.3,40,0.01,2);

%% Gerar Short interruption 
shortInterruption{1} = gerarDips(3.3,100,0.001,2);

%% Gerar Voltage Variation 
voltageVariation{1} = gerarDips(3.3,80,0.1,2);