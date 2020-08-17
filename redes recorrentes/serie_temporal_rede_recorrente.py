import pandas as pd
base = pd.read_csv('petr4.csv')
base = base.dropna() # apaga registro nulos

base = base.iloc[:,1].values

import matplotlib.pyplot as plt

plt.plot(base)

periodos = 30
previsao_futura = 1 # horizonte das previsões

x = base[0:(len(base) - (len(base) % periodos))] ## 0 ate 1139 serão os atributos previsores (divisao da base para teste)
x_batches = x.reshape(-1, periodos, 1) # (batch_size, n_periodos, atributos)

y= base [1:(len(base) - (len(base) % periodos)) + previsao_futura]
y_batches = y.reshape(-1, 30, 1)

x_teste = base[-(periodos + previsao_futura):]
x_teste = x_teste[:periodos]
x_teste = x_teste.reshape(-1, periodos, 1)

y_teste = base[-(periodos):]
y_teste = y_teste.reshape(-1, periodos, 1)

import tensorflow as tf
tf.reset_default_graph()

entradas = 1
neuronios_oculta = 100 # valor deve ser testado até obter resultados interessantes
neuronios_saida = 1

xph = tf.placeholder(tf.float32, [None, periodos, entradas])
yph = tf.placeholder(tf.float32, [None, periodos, neuronios_saida])


# o conceito de célula é a passagem do valor para ele mesmo
# Cada uma das células basicamente define as camadas ocultas
#celula = tf.contrib.rnn.BasicRNNCell(num_units = neuronios_oculta, activation= tf.nn.relu)

# o resultado da LSTM foi pior que o resultado da BasicRNN
#celula = tf.contrib.rnn.LSTMCell(num_units = neuronios_oculta, activation= tf.nn.relu)

# mapeamento para camada de saida (transforma os 100 neuronios em 1 saida) 100 -> 1
#celula = tf.contrib.rnn.OutputProjectionWrapper(celula, output_size = 1)


def cria_uma_celula():
    return tf.contrib.rnn.BasicRNNCell(num_units = neuronios_oculta, activation=tf.nn.relu)

def cria_varias_celulas():
    return tf.nn.rnn_cell.MultiRNNCell([cria_uma_celula() for i in range(4)])


# o resultado da LSTM foi pior que o resultado da BasicRNN
celula = cria_varias_celulas()

# mapeamento para camada de saida (transforma os 100 neuronios em 1 saida) 100 -> 1
celula = tf.contrib.rnn.OutputProjectionWrapper(celula, output_size = 1)

# dynamic rede neural recorrente
saida_rnn, _ = tf.nn.dynamic_rnn(celula, xph, dtype = tf.float32)
erro = tf.losses.mean_squared_error(labels = yph, predictions = saida_rnn)
otimizador = tf.train.AdamOptimizer(learning_rate = 0.001)
treinamento = otimizador.minimize(erro)

with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    
    for epoca in range(1000):
        _, custo = sess.run([treinamento, erro], feed_dict={xph: x_batches, yph: y_batches})
        if epoca % 100 == 0:
            print(epoca + 1, ' erro: ', custo)
        
    previsoes = sess.run(saida_rnn, feed_dict = {xph: x_teste})

        
import numpy as np

# redimensionamento 'ravel' deixa somente os 30 valores ao inves de (1,30,1)
y_teste2 = np.ravel(y_teste)
previsoes2 = np.ravel(previsoes)


from sklearn.metrics import mean_absolute_error

mae = mean_absolute_error(y_teste2, previsoes2)        

        
plt.plot(y_teste2, label = 'valor real')  
plt.plot(previsoes2, label = 'Previsões')
plt.legend() 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        