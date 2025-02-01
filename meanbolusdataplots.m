function meanbolusdataplots(i)

    global dataB

    load 'BolusDataCorrectedSD.mat'
    
    TNFm = TNFm_NoOutliers;
    IL6m = IL6m_NoOutliers;
    IL8m = IL8m_NoOutliers;
    IL10m = IL10m_NoOutliers;
    
    dataB.TNF  = TNFm;
    dataB.IL6  = IL6m;
    dataB.IL8  = IL8m;
    dataB.IL10 = IL10m;
    dataB.time = Time;
    
    height = 1000;
    width = 2000;
    lw = 10;
    mw = 5;
    time = Time;

    figure(i)
    subplot(2,4,5)
    hold on
    errorbar(time,TNFm,TNFsd,'k^','linewidth',mw)
    ylabel('TNF-a (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,6)
    hold on
    errorbar(time,IL6m,IL6sd,'k^','linewidth',mw)
    ylabel('IL-6 (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,7)
    hold on
    errorbar(time,IL8m,IL8sd,'k^','linewidth',mw)
    xlabel ('Time (hours)')
    ylabel('IL-8 (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];
    
    subplot(2,4,8)
    hold on
    errorbar(time,IL10m,IL10sd,'k^','linewidth',mw)
    xlabel('Time (hours)')
    ylabel('IL-10 (pg/mL)')
    legend('')
    fig=gcf;
    fig.Position(3:4)=[width,height];

end