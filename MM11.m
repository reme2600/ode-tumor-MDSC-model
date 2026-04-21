clear
clc

% initial conditions

C0 = 5*10^3;
I0 = 770000;
M0 = 64000;

d1= 1*10^6;

% simulation; solver ode23

[t,y] = ode23s(@MMm2,[0:0.1:100],[C0 ; I0 ; M0]);
% [ts,ys] = ode23s(@MMm2,[0:0.1:20],[Cp0; I0; M0]);
% Cp0= ys(end,1)+d1;
% Cq0= ys(end,2);
% I0= ys(end,3);
% M0= ys(end,4);
% [tm,ym] = ode23s(@MMm2,[20:0.1:100],[Cp0; I0; M0]);
% 
% y=[ys; ym];
% t=[ts; tm];

% plotting

plot(t,y(:,1),'r-',t,y(:,2),'k.-',t,y(:,3),'b.-')
xlabel('Time (days after tumor cells inoculation)');
ylabel('Cells number (×10^7)');
legend('Tumor cell','Immune cell','MDSC')
ylim([0 70000000])


hold on
t = [0 7 13 17 22 27 29];
C = [5*10^4 5*10^4 2*10^6 5.47*10^6 8.44*10^6 1.75*10^7 2.33*10^7];
err = [0 0 1.95*10^5 3.9*10^5 3.2*10^5 1.49*10^6 9.5*10^5];
% errorbar(t,Cp,err,'-o','DisplayName','Proliferative cell-experimental')

t =[0 7 14 30];
I = [770000 1.93*10^6 2.31*10^6 2.62*10^5];
err = [0 5.32*10^5 7.94*10^5 60000];
% errorbar(t,I,err,'-o','DisplayName','Immune cell-experimental')

t =[0 7 14 30];
M = [64000 414000 2670000 11507000];
err = [0 235098 330654 636215];
err = [0 147400 600000 373000];
% errorbar(t,M,err,'DisplayName','MDSC-experimental')



figure(1)
