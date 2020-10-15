function [PKSv, LOCSv,SteadyStateM] = getsteadysttatte(starts,Matrix,probe_nums)

%Calibrate MinPeakDistance
SteadyStateM = zeros(9000,7);
SteadyStateM(:,1) = Matrix(:,1);
    for l =1:length(starts)
        SteadyStateM(starts(l):end, 1+l) = Matrix(starts(l):end, 1+l);
    end
    PKSv = {};
    LOCSv = {};
    figure;
   for ind = 2:7
       [PKS,LOCS] = findpeaks(SteadyStateM(1:8000,ind),'MinPeakDistance',55);
       
       subplot(6,1,ind-1)
       findpeaks(SteadyStateM(starts(ind-1):8000,ind),'MinPeakDistance',55);
       tit = "Wave Height at " + probe_nums(ind-1) + "m";
       title(tit)
       xlabel('Time (s*100)')
       ylabel('Height (mm)')
       PKSv = [PKSv PKS];
       LOCSv = [LOCSv LOCS];
       
   end
   
    
end

