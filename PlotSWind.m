function [FilteredData] = PlotSWind(data,figurenum,N,starts)

FilteredData = Zeros(9000,7);
FilteredData(:,1) = data(:,1);

figure(figurenum);

hold on
title('Smooth Data')

SData = medfilt1(data(:,2),N);
subplot(3,2,1)
FilteredData(:,2) = SData;
plot(data(:,1),SData);
title('Wave Height at 5.81m')
rectangle('Position', [starts(1) -45 (80-starts(1)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,2)
SData = medfilt1(data(:,3),N);
FilteredData(:,3) = SData;
plot(data(:,1),SData)
title('Wave Height at 8.25m')
rectangle('Position', [starts(2) -45 (80-starts(2)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,3)
SData = medfilt1(data(:,4),N);
FilteredData(:,4) = SData;
plot(data(:,1),SData)
rectangle('Position', [starts(3) -45 (80-starts(3)) 100], 'EdgeColor','r', 'LineStyle','--');
title('Wave Height at 10.71m')
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,4)
SData = medfilt1(data(:,5),N);
FilteredData(:,5) = SData;
plot(data(:,1),SData)
rectangle('Position', [starts(4) -45 (80-starts(4)) 100], 'EdgeColor','r', 'LineStyle','--');
title('Wave Height at 14.36m')
xlabel('Time (s)')
ylabel('Height (mm)')

subplot(3,2,5)
SData = medfilt1(data(:,6),N);
FilteredData(:,6) = SData;
plot(data(:,1),SData)
title('Wave Height at 17.66m')
rectangle('Position', [starts(5) -45 (80-starts(5)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')

subplot(3,2,6)
SData = medfilt1(data(:,7),N);
FilteredData(:,7) = SData;
plot(data(:,1),SData)
title('Wave Height at 20.08m')
rectangle('Position', [starts(6) -45 (80-starts(6)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')

end




