clear variables; clc; close all

%% # of packs to simulate
x = input('Please input the number of packs you wish to simulate: ');

data = get_pack_values('EMN',x);

%% display price data as histogram
figure(1)
his = histogram(data(:,1));
title('Histogram of Pack Values')
xlabel('Pack Value ($)')
ylabel('Frequency')
line([3.99 3.99], [0 max(his.Values)],'Color','r','LineWidth',2)
tx = text(5, (max(his.Values)/2), 'Retail Price: $3.99', 'Color', 'r');
tx.FontSize = 30;
set(gca,'fontsize',24)

%% Plot the increasing speed of pack simulations of over time

dataspeed = data(:,2);
datanew = data(:,3);
figure(2)
yyaxis left
plot(1:length(dataspeed),dataspeed,'b','LineWidth',2)
ylabel('Simulation Time (s)')
yyaxis right
plot(1:length(datanew),datanew,'r','LineWidth',2)
ylabel('# of New Cards in Pack')
title('Pack Simulation Speed over Time')
xlabel('Number of Packs Simulated')
set(gca,'fontsize',24)

%% EV and Median

EV = mean(data(:,1));
median = median(data(:,1));

fprintf('The Expected Value of all packs simulated is: %2.f. The Median Value is %2.f\n',EV,median)

%% write data to file, use dlmread('filename') to read data from that file
dlmwrite('data.txt',data)