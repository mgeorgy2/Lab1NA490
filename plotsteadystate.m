function [] = plotsteadystate(starts,data,figurenum)


figure(figurenum)
subplot(6,1,1)
plot((data(starts(1):8000,1))./100,data(starts(1):8000,2))
title('Wave Height at 5.81m')
xlabel('Time (sx100)')
ylabel('Height (mm)')


subplot(6,1,2)
plot((data(starts(2):8000,1))./100,data(starts(2):8000,3))
title('Wave Height at 8.25m')
xlabel('Time (sx100)')
ylabel('Height (mm)')


subplot(6,1,3)
plot((data(starts(3):8000,1))./100,data(starts(3):8000,4))
title('Wave Height at 10.71m')
xlabel('Time (sx100)')
ylabel('Height (mm)')


subplot(6,1,4)
plot((data(starts(4):8000,1))./100,data(starts(4):8000,5))
title('Wave Height at 14.36m')
xlabel('Time (sx100)')
ylabel('Height (mm)')

subplot(6,1,5)
plot((data(starts(5):8000,1))./100,data(starts(5):8000,6))
title('Wave Height at 17.66m')
xlabel('Time (sx100)')
ylabel('Height (mm)')

subplot(6,1,6)
plot((data(starts(6):8000,1))./100,data(starts(6):8000,7))
title('Wave Height at 20.08m')
xlabel('Time (sx100)')
ylabel('Height (mm)')
end

