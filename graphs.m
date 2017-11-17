% Generates graphs using recorded data, for use on poster and ppt

clear variables;close all;clc


%% Read in data sets

data24 = dlmread('data11_24.txt');
data25 = dlmread('data11_25.txt');
data26 = dlmread('data11_26.txt');
data27 = dlmread('data11_27.txt');
data28 = dlmread('data11_28.txt');
data29 = dlmread('data11_29.txt');
data30 = dlmread('data11_30.txt');


%% Plot the increasing speed of pack simulations of over time

newcards = dlmread('data_new.txt');
dataspeed = newcards(:,2);
datanew = newcards(:,3);
figure(1)
yyaxis left
plot(1:length(dataspeed),dataspeed,'b','LineWidth',2)
ylabel('Simulation Time (s)')
yyaxis right
plot(1:length(datanew),datanew,'r','LineWidth',2)
ylabel('Number of New Cards in Pack')
title('Pack Simulation Speed and Number of New Cards Seen as Packs are Simulated (200 packs)')
xlabel('Packs Simulated')
data24timing = data24(:,2);
set(gca,'fontsize',24)

%% Histogram of pack values

data24packs = data24(:,1);
data25packs = data25(:,1);
data26packs = data26(:,1);
data27packs = data27(:,1);
data28packs = data28(:,1);
data29packs = data29(:,1);
data30packs = data30(:,1);

allpacks = [data24packs;data25packs;data26packs;data27packs;data28packs;data29packs;data30packs];

figure(2)
his = histogram(allpacks); hold on
title('Histogram of Pack Values (70000 Packs over 11/24/16 - 11/30/16)')
xlabel('Pack Value ($)')
ylabel('Frequency')
line([3.99 3.99], [0 100000],'Color','r','LineWidth',2)
set(gca,'fontsize',24)
axis([0 45 0 2.5e4])
ax = gca;

% Label the line in red, which represents retail price
tx = text(5, (max(his.Values)/2), 'Retail Price: $3.99', 'Color', 'r');
tx.FontSize = 30;

%% Expected Value Over Time

EVs = [mean(data24packs) mean(data25packs) mean(data26packs) mean(data27packs) mean(data28packs) mean(data29packs) mean(data30packs)];

figure(3)
plot(EVs,'b','LineWidth',2)
title('Expected Values of Eldritch Moon Packs over a 7 day Period (11/24/16 - 11/30/16)')
xlabel('Day')
ylabel('Expected Value ($)')
set(gca,'fontsize',24)

EVm = mean(EVs);
Med = median(allpacks);