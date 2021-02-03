clc;
clear;

t = 0:0.4:76;
a1 = 0.0145;
b1 = 2.8353;
k1 = 1.037;

a2 = 0.1732;
b2 = 0.0866;
k2 = 4;

openCircuitVoltage = 1000*k1*(exp(-a1*t)-exp(-b1*t));
shortCircuitCurrent = -1*1000*k2*(exp(-a2*t)-exp(-b2*t));


subplot(2,1,1)
plot(t,openCircuitVoltage);
axis([-10 110 -10 1200]);
grid
subplot(2,1,2)
plot(t,shortCircuitCurrent);
axis([-10 110 -10 1200]);
grid