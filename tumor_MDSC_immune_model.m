% Defines ODE system and parameters for tumor–MDSC-immune interactions MMm2 version
 
 function dydt = tumor_MDSC_immune_model(t,y)
global t1;
global e;
global ts;

% parameters

a1=0.38*10^-1;
Cmax = 10^9;
tau = 0.16*10^-7;
s= 1.3*10^4;
q= 12*10^-2;
l = 2.02*10^7;
n = 4.12*10^-2;
mue= 4.5*10^-8;
alpha=2.2*10^-1;
beta=0.35;

% equations

a = a1 * y(1) * log(Cmax/(y(1)+1)) - tau * y(1) * y(2); %y1 = C, cancer cell

b = s + y(2) * (q * (y(1)^2)/(l + y(1)^2)) - n * y(2) - mue * y(2) * y(3); %y2 = I, immune cells

c = alpha * y(1) - beta * y(3); %y3 = MDSC



%     if mod (floor(t),2)== 1 && t>ts && t<ts+t1
    if mod (floor(t),2)== 1 && t>21 && t<51   
      c =(-10*y(3)); 

    end
    
dydt = [a; b; c];  
end
