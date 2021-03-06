function [] = timeHistory(data,figurenum,starts)
%This function takes in a matrix and returns the time series for the wave
%elevation at each probe.


figure(figurenum);
subplot(3,2,1)
plot(data(:,1),data(:,2))
title('Wave Height at 5.81m')
rectangle('Position', [starts(1) -45 (80-starts(1)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,2)
plot(data(:,1),data(:,3))
title('Wave Height at 8.25m')
rectangle('Position', [starts(2) -45 (80-starts(2)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,3)
plot(data(:,1),data(:,4))
rectangle('Position', [starts(3) -45 (80-starts(3)) 100], 'EdgeColor','r', 'LineStyle','--');
title('Wave Height at 10.71m')
xlabel('Time (s)')
ylabel('Height (mm)')


subplot(3,2,4)
plot(data(:,1),data(:,5))
rectangle('Position', [starts(4) -45 (80-starts(4)) 100], 'EdgeColor','r', 'LineStyle','--');
title('Wave Height at 14.36m')
xlabel('Time (s)')
ylabel('Height (mm)')

subplot(3,2,5)
plot(data(:,1),data(:,6))
title('Wave Height at 17.66m')
rectangle('Position', [starts(5) -45 (80-starts(5)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')

subplot(3,2,6)
plot(data(:,1),data(:,7))
title('Wave Height at 20.08m')
rectangle('Position', [starts(6) -45 (80-starts(6)) 100], 'EdgeColor','r', 'LineStyle','--');
xlabel('Time (s)')
ylabel('Height (mm)')
end

