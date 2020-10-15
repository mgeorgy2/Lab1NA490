function [] = plotS(data,figurenum,starts)
figure(figurenum);

hold on
title('Smooth Data')

SData = smooth(data(:,2));
subplot(3,2,1)
plot(data(:,1),SData);
title('Wave Height at 5.81m')
rectangle('Position', [starts(1) -45 (80-starts(1)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,2)
SData = smooth(data(:,3));
plot(data(:,1),SData)
title('Wave Height at 8.25m')
rectangle('Position', [starts(2) -45 (80-starts(2)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,3)
SData = smooth(data(:,4));
plot(data(:,1),SData)
rectangle('Position', [starts(3) -45 (80-starts(3)) 100], 'EdgeColor','r', 'LineStyle','--');
title('Wave Height at 10.71m')
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,4)
SData = smooth(data(:,5));
plot(data(:,1),SData)
rectangle('Position', [starts(4) -45 (80-starts(4)) 100], 'EdgeColor','r', 'LineStyle','--');
title('Wave Height at 14.36m')
xlabel('Time (s)')
ylabel('Height (mm)')

subplot(3,2,5)
SData = smooth(data(:,6));
plot(data(:,1),SData)
title('Wave Height at 17.66m')
rectangle('Position', [starts(5) -45 (80-starts(5)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')

subplot(3,2,6)
SData = smooth(data(:,7));
plot(data(:,1),SData)
title('Wave Height at 20.08m')
rectangle('Position', [starts(6) -45 (80-starts(6)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')
end



