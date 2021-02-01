clc;
clear;

n = 0.1:(1/100e3):0.10191;
ampl = 1000;
y = ampl*heaviside(n);
y(length(y)) = 4;

for x = 1:(length(y)-1)
    if mod(x,2) ~= 1
       y(x) = 0;        
    end
end

plot(n, y)
axis([-1 3 0 ampl+1])