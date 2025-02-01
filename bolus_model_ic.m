function ic = bolus_model_ic

global dataB

pars = exp(dataB.pars);

wTNF = pars(19);
w6   = pars(29);
w8   = pars(37);
w10  = pars(43);

%Inflammation ICs
TNF0  = wTNF;   
IL60  = w6; 
IL80  = w8;
IL100 = w10;           
MA0   = 0.0;
MR0   = 28200;   
E0    = 2;

% Parameter vector of ICs
ic = [E0   MR0   MA0   TNF0   IL60  IL80  IL100];    %(1-7) Inflammation ICs
end