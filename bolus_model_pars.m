function pars = bolus_model_pars

global dataB

% % ------------------------------ PARAMETERS ----------------------------------

% Scaling factors

sT = 0.71; %0.45;
s6 = 1;  % NOT USED
s8 = 0.71; %1.1;
s10 = 1.12; %0.99;

%%%% E parameters
kE = 1.01;

%%%% MR & MA parameters
kMR = 0.006;  
kMA = 2.51;   
kMTNF = 8.6497; %9; %4.14e-06;
kM =0.0414;

xME = 3.3; %2;%3.3;       
xM10 = 4.35/s10;  
xMTNF = 100/sT;

hME = 1;         
hM10 = 0.3;   
hMTNF = 3.16;   
     
Mmax = 30000;


%%%% TNF parameters
kTNF = 1; %0.6;%1;
kTNFM = 0.6/sT;

xTNF10 = 17.4/s10; 
xTNF6 = 560/s6;

hTNF10 = 3;      
hTNF6 = 2;     
wTNF = dataB.TNF(1)/sT;
 
%%%% IL6 parameters
k6 = 0.66;  
k6M = 0.81/s6;
k6TNF = 0.81/s6;

x610 = 34.8/s10;
x66 = 560/s6;
x6TNF = 185/sT;

h610 = 4; %1;%4;
h66 = 1;
h6TNF = 2;
w6 = dataB.IL6(1)/s6;

%%%% IL8 parameters
k8 = 0.66;    
k8M = 0.56/s8; 
k8TNF = 0.56/s8;

x810 = 17.4/s10;
x8TNF = 185/sT;

h810 = 1.5;
h8TNF = 3;
w8 = dataB.IL8(1)/s8;

%%%% IL10 parameters
k10 = 0.8; %0.4; %0.8;
k10M = 0.0191/s10;
k106 = 0.0191/s10;

x106 = 560;   

h106 = 3.68;      
w10 = dataB.IL10(1)/s10;


% ALL PARAMETERS -------------

pars = [kE kMR kMA kMTNF kM xME xM10 xMTNF hME hM10 hMTNF Mmax...   %(1-12)   E, MR, MA pars
        kTNF kTNFM xTNF10 xTNF6 hTNF10 hTNF6 wTNF...                %(13-19)  TNF pars
        k6 k6M k6TNF x610 x66 x6TNF h610 h66 h6TNF w6...            %(20-29)  IL6 pars
        k8 k8M k8TNF x810 x8TNF h810 h8TNF w8...                    %(30-37)  IL-8 pars
        k10 k10M k106 x106 h106 w10]';                              %(38-43)  IL10 pars                                                %(103-107)  Resistance pars

pars = log(pars);
    
end
