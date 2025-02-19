function meandataplots(i)

    global dataC

    load 'CTSmeanNOOutlierdata.mat'
    
    dataC.TNF  = TNFm;
    dataC.IL6  = IL6m;
    dataC.IL8  = IL8m;
    dataC.IL10 = IL10m;
    dataC.time = [0 1 2 3 4 6];
    
    height = 1000;
    width = 2000;
    lw = 10;
    mw = 5;
    time = [0 1 2 3 4 6];

    figure(i)
    subplot(2,4,5)
    hold on
    errorbar(time,TNFm,TNFse,'ko','linewidth',mw)
    ylabel('TNF-a (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,6)
    hold on
    errorbar(time,IL6m,IL6se,'ko','linewidth',mw)
    ylabel('IL-6 (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,7)
    hold on
    errorbar(time,IL8m,IL8se,'ko','linewidth',mw)
    xlabel ('Time (hours)')
    ylabel('IL-8 (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,8)
    hold on
    errorbar(time,IL10m,IL10se,'ko','linewidth',mw)
    xlabel('Time (hours)')
    ylabel('IL-10 (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];

end