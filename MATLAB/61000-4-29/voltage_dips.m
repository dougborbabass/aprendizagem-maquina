clc;
clear;

t=0.001:0.01:100;

% 3.3V - 40% - 0,01S 
v1=3.3*(heaviside(t))-1.32*(heaviside(t-1))+1.32*(heaviside(t-1.01));

% 3.3V - 70% - 0,01S
v2=3.3*(heaviside(t))-2.31*(heaviside(t-1))+2.31*(heaviside(t-1.01));

% 3.3V - 40% - 0,03S 
v3=3.3*(heaviside(t))-1.32*(heaviside(t-1))+1.32*(heaviside(t-1.03));

% 3.3V - 70% - 0,03S
v4=3.3*(heaviside(t))-2.31*(heaviside(t-1))+2.31*(heaviside(t-1.03));

% 3.3V - 40% - 0,1S 
v5=3.3*(heaviside(t))-1.32*(heaviside(t-1))+1.32*(heaviside(t-1.1));

% 3.3V - 70% - 0,1S
v6=3.3*(heaviside(t))-2.31*(heaviside(t-1))+2.31*(heaviside(t-1.1));

% 3.3V - 40% - 0,3S 
v7=3.3*(heaviside(t))-1.32*(heaviside(t-1))+1.32*(heaviside(t-1.3));

% 3.3V - 70% - 0,3S
v8=3.3*(heaviside(t))-2.31*(heaviside(t-1))+2.31*(heaviside(t-1.3));

% 3.3V - 40% - 0,3S 
v9=3.3*(heaviside(t))-1.32*(heaviside(t-1))+1.32*(heaviside(t-2));

% 3.3V - 70% - 0,3S
v10=3.3*(heaviside(t))-2.31*(heaviside(t-1))+2.31*(heaviside(t-2));

subplot(5,2,1)
plot(t,v1,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,2)
plot(t,v2,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,3)
plot(t,v3,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,4)
plot(t,v4,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,5)
plot(t,v5,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,6)
plot(t,v6,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,7)
plot(t,v7,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,8)
plot(t,v8,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,9)
plot(t,v9,'linewidth',2)
axis([0 100 0 3.5])

subplot(5,2,10)
plot(t,v10,'linewidth',2)
axis([0 100 0 3.5])