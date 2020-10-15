% PLots for NA492 Lab 1
%Input all data

offset_mat = csvread('Offsets_DataRun0.csv', 2,0);
WedgeOnly12 = csvread('WedgeOnly_f1.2Hz_a20mm_DataRun1.csv', 2,0);
WedgeOnly15 = csvread('WedgeOnly_f1.5Hz_a20mm_DataRun2.csv', 2,0);
Wind_Wedge3 = csvread('Wind&Wedge_P50%_f1.5Hz_a20mm_DataRun3.csv',2,0);
Wind_Wedge5 = csvread('Wind&Wedge_P50%_f1.5Hz_a20mm_DataRun5.csv',2,0);
Wind4 = csvread('WindOnly_P50%_DataRun4.csv',2,0);
Wind6 = csvread('WindOnly_P50%_DataRun6.csv',2,0);
Wind7 = csvread('WindOnly_P75%_DataRun7.csv',2,0);




% For Wedge Determine deep or transitional water

%plot(WedgeOnly12(:,1),WedgeOnly12(:,2))
%hold on
%plot(WedgeOnly12(:,1),WedgeOnly12(:,3))
% Going to need wave height, 

%start of steady states in t from 5.81 m to 20.8 m
probe_nums = [5.81 8.25 10.71 14.36 17.66 20.08];
starts = [40 43 47 50 57 60];




% Raw Time Historys

i = 1;
actualStart = [0 0 0 0 0 0];
%Acttual sttart is ttimes 100 plus 2
for s = 1:length(starts)
    s;
    starts(s);
 while WedgeOnly12(i,1) <= starts(s)
     WedgeOnly12(i,1);
     i = i+1;
 end
 actualStart(s) = i;
 i = 1;

end


%Find Max of each column
[maxVec,maxTimeVec] = max(WedgeOnly12);
maxTimeVec(1) = [];
maxVec(1) = [];

% 3-2, 4-3, 5-4, 6-5
velDiff = zeros(1,4);
for i = 2:5
    velDiff(i-1) = maxTimeVec(i+1) - maxTimeVec(i);
end

%Find L/T for each vel diff in m/s
WaveVelVec = zeros(1,4);

for i =1:length(velDiff)
    newVelDiff = (velDiff(i)-1)/100;
    WaveVelVec(i) = (newVelDiff)/(probe_nums(i+1) - probe_nums(i));    
end

WaveVelocity = mean(WaveVelVec);




%Plots Time History based on observed beginings of steady state
%timeHistory(WedgeOnly12,1,starts);
timeHistory(WedgeOnly15,2,starts);
plotS(WedgeOnly15,3,30,starts,'moving');
% timeHistory(Wind4,3):
timeHistory(Wind4,4,starts);
PlotSWind(Wind4,5,3,starts);
% timeHistory(Wind6,4);
% timeHistory(Wind7,5);
% timeHistory(Wind_Wedge3,6);
% timeHistory(Wind_Wedge5,7);

%plotsteadystate(actualStart,WedgeOnly12,1);

[PKCSv,LOCSv,Steady] = getsteadysttatte(actualStart,WedgeOnly12, probe_nums);
Average_peak_heightvec = [];


%Average Wave Height
for i = 1:length(PKCSv)
    Average_peak_heightvec = [Average_peak_heightvec, mean(PKCSv{i})];
end

%Average Length Between Peaks (Wave_Period)
all_wave_periods = cell(1,6);
av_wave_periods = zeros(1,6);
for l = 1:length(LOCSv)
    for i = 1:floor(length(LOCSv{l})/2)
        all_wave_periods{1,l} = [all_wave_periods{1,l} ((LOCSv{1,l}(i+1) - LOCSv{1,l}(i)))];
    end
    av_wave_periods(l) = mean(all_wave_periods{1,l})/100;
end
omegav = zeros(1,6);
freqv = zeros(1,6);

for i = 1:length(av_wave_periods)
    omegav(i) = (2*pi)/av_wave_periods(i);
    freqv(i) = omegav(i)/(2*pi);
end

WavePeriod = mean(av_wave_periods);
Omega = mean(omegav);
Frequency = mean(freqv);
%Mean Water depth in meters (h) COULD BE WRONG
MeanWaterdepth = 1.2;
waveLength_Lambda = WaveVelocity/Frequency;
k = (2*pi)/waveLength_Lambda;


% The Red box is determined by VP is dettermined by 
Vp = Omega/k;
Vg = Vp*(1/2 + (k*MeanWaterdepth)/sinh(2*k*MeanWaterdepth));

%Filter
c = smooth(WedgeOnly12(actualStart(1):8000,2));
figure;
hold on
plot(WedgeOnly12(actualStart(1):8000,1),c);


