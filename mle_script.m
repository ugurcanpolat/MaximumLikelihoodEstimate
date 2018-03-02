% @Author
% Student Name: Ugurcan Polat
% Student ID : 150140117
% Date: 02.03.2018

fileID = fopen('data.txt','r'); % open file with read perm.
[x, n] = fscanf(fileID,'%f'); % scan floating point data
fclose(fileID); % close the file

mu = 0;
for count = 1:n % use equation for mu estimation
    mu = mu + x(count);
end
mu = mu / n; % mean
fprintf('Mean (mu) = %f\n', mu);

std = 0;
for count = 1:n % use equation for deviation estimation
    std = std + (x(count) - mu)^2;
end
std = std / n; 
std = sqrt(std); % standard deviation
fprintf('Standard Deviation (sigma) = %f\n', std);

MAX = max(x); % maximum value of given data
MIN = min(x); % minimum value of given data
x_e = linspace(MIN,MAX); % create a linear space
y_e = (1/(sqrt(2*pi)*std))*exp(-0.5*((x_e-mu)/std).^2); % MLE using x_e

figure 
plot(x_e,y_e,'LineWidth',1.5) % plot with bold line
hold on
% Plot a histogram with normalization probability density function
histogram(x,'Normalization','pdf') 
xlim([0 18]) % x-axis limit of the plot
ylim([0 0.16]) % y-axis limit of the plot
title(['MLE results: mu = ',num2str(mu), ' std = ' num2str(std)]);
legend('MLE fixed distribution','data')
hold off
