
clear all; close all; clc;

global dataB dataC

xlim = [0 12];
opts.LineWidth = 4;

% -------- Plot continuous infusion data and model solution

%Load mean data
meanctsdataplots(1)

load 'MeanCtsOptPars.mat'

% Run model for mean data
dataC.pars  = optpars;

dataC.ic    = cts_model_ic;
dataC.tspan = 0:0.01:12;
sol  = cts_model_solver(dataC); 
t    = dataC.tspan;
y    = deval(sol,t); 

t_sol = t;
y_sol = y;

[ctsR2,ctsCurve] = cts_model_plotsOPT(1,t,y,sol,xlim,'r',opts);


% -------- Plot bolus data and model solution

%Load mean data
meanbolusdataplots(1)

load 'MeanBolusOptPars.mat'

% Run model for mean data
dataB.pars  = optpars;

dataB.ic    = bolus_model_ic;
dataB.tspan = 0:0.01:12;
sol  = bolus_model_solver(dataB); 
t    = dataB.tspan;
y    = deval(sol,t); 

t_sol = t;
y_sol = y;

[bolusR2,bolusCurve] = bolus_model_plotsOPT(1,t,y,sol,xlim,'k',opts);

figure(1)
subplot(2,4,5)
legend('',['R^2 = ' num2str(ctsR2(1),'%.2f')],'',['R^2 = ' num2str(bolusR2(1),'%.2f')])
subplot(2,4,6)
legend('',['R^2 = ' num2str(ctsR2(2),'%.2f')],'',['R^2 = ' num2str(bolusR2(2),'%.2f')])
subplot(2,4,7)
legend('',['R^2 = ' num2str(ctsR2(3),'%.2f')],'',['R^2 = ' num2str(bolusR2(3),'%.2f')])
subplot(2,4,8)
legend('',['R^2 = ' num2str(ctsR2(4),'%.2f')],'',['R^2 = ' num2str(bolusR2(4),'%.2f')])
exportgraphics(gcf,'optmeanmodel.eps');

