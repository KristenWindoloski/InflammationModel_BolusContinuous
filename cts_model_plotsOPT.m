function [ctsR2,ctsCurve] = cts_model_plotsOPT(fignumber,t,y,sol,xlimits,col,opts)
    
    global dataC
    
    height = 1000;
    width  = 3000;
    fs     = 30;
    
    % -------- Calculate R^2 value

    ydata = deval(sol,dataC.time);
    TNFdata = ydata(4,:);  
    IL6data = ydata(5,:); 
    IL8data  = ydata(6,:);
    IL10data = ydata(7,:);
    
    mdl = fitlm(TNFdata,dataC.TNF);
    RTn2 = mdl.Rsquared.Ordinary;

    mdl = fitlm(IL6data,dataC.IL6);
    R6n2 = mdl.Rsquared.Ordinary;

    mdl = fitlm(IL8data,dataC.IL8);
    R8n2 = mdl.Rsquared.Ordinary;

    mdl = fitlm(IL10data,dataC.IL10);
    R10n2 = mdl.Rsquared.Ordinary;

    %Plot model and R^2 value
    
    E   = y(1,:);     MR  = y(2,:);       MA = y(3,:); 
    TNF = y(4,:);     IL6 = y(5,:);      IL8 = y(6,:);      IL10 = y(7,:);
    
    
    figure(fignumber)
    
    subplot(2,4,1)
    hold on
    plot(t,E,'color',col,opts)
    ylabel('E (ng/kg)')
    xlim(xlimits);
    fig=gcf;
    fig.Position(3:4)=[width,height];

    subplot(2,4,2)
    hold on
    plot(t,MR,'color',col,opts)
    ylabel('MR (noc)')
    xlim(xlimits);
    fig=gcf;
    fig.Position(3:4)=[width,height];

    subplot(2,4,3)
    hold on
    plot(t,MA,'color',col,opts)
    ylabel('MA (noc)')
    xlim(xlimits);
    fig=gcf;
    fig.Position(3:4)=[width,height];

    subplot(2,4,5)
    hold on
    T = plot(t,TNF,'DisplayName',['R^2 = ' num2str(RTn2,'%.2f')],'color',col,opts)
    xlabel('Time (hours)')
    ylabel('TNF-\alpha (pg/mL)')
    xlim(xlimits);
    legend('Location','northeast')
    fig=gcf;
    fig.Position(3:4)=[width,height];

    subplot(2,4,6)
    hold on
    I6 = plot(t,IL6,'DisplayName',['R^2 = ' num2str(R6n2,'%.2f')],'color',col,opts)
    xlabel('Time (hours)')
    ylabel('IL-6 (pg/mL)')
    xlim(xlimits);
    legend('Location','northeast')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,7)
    hold on
    I8 = plot(t,IL8,'DisplayName',['R^2 = ' num2str(R8n2,'%.2f')],'color',col,opts)
    xlabel('Time (hours)')
    ylabel('IL-8 (pg/mL)')
    xlim(xlimits);
    legend('Location','northeast')
    fig=gcf;
    fig.Position(3:4)=[width,height];

    subplot(2,4,8)
    hold on
    I10 = plot(t,IL10,'DisplayName',['R^2 = ' num2str(R10n2,'%.2f')],'color',col,opts)
    xlabel('Time (hours)')
    ylabel('IL-10 (pg/mL)')
    xlim(xlimits);
    legend('Location','northeast')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    set(findall(gcf,'-property','FontSize'),'FontSize',fs)
    set(gcf,'renderer','Painters')
    
    ctsR2 = [RTn2; R6n2; R8n2; R10n2];
    ctsCurve = [T; I6; I8; I10];
    
    
end