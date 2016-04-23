% run the Monte Carlo simulation for Bernoulli trial
clear
p0 = 0.65; % true probability of getting head when tossing the biased conin
n = [100 1000 10000]; % matrix of sample size
rep = 10000; % number of repeated experiments with n-sample
bins = 50;
for i = 1:1:length(n)
    f = rand(n(i),rep); % generate a mantrix of uniform distributed number between 0
                        % and 1, the point is to create a logical matrix y
                        % consist of only 0 and 1 value with the proportion
                        % of 1 roughly aroun p0 (0.65)
    y = (f < p0); % generate matrix y with only logical value
    ybar = mean(y);
    z = sqrt(n(i))*(ybar - p0);
    % display results in histogram
    figure(i)
    hist(z,bins);
    set(gca, 'Fontsize',16)
    xlabel('sample mean')
    ylabel('frequency')
    %ylabel('Fontsize',16)
    title(['p0 = 0.65, n = ',num2str(n(i)),', with ',num2str(rep),' repetion'], ...
          'Fontsize', 16)
end
