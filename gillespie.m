clear
init_pop=1;
replicates=5; % number of times the system is simulated
% rates of the two poisson processes
birth_rate=1.5; death_rate=0.7;
% birth_rate=1.2; death_rate=0.4;
% birth_rate=0.8; death_rate=0.0;

t=0:.1:5;
% plotting deterministic system as a guideline
deterministic_pop=init_pop*exp((birth_rate-death_rate).*t);
% plotting exponential random variable of combined poisson process
subplot(1,2,1)
hold on
plot(t,deterministic_pop,'k--','Linewidth',2);
axis([0,5,0,50]);
xlabel('Time');
ylabel('Population size');
title('Change in population size with time');
% plotting the log function
subplot(1,2,2)
plot(t,log(deterministic_pop),'k--','Linewidth',2);
axis([0,5,0,5]);
xlabel('Time');
ylabel('log_e(population size)');
title('Change in population size with time');

hold on % retains plots in the current axes

for k=1:replicates
    clear t y
    y(1)=init_pop;
    t(1)= 0;
    j=1;
    while y(j)>0 && y(j)<50
        u=rand(1,2);
        event_rate = birth_rate+death_rate;
        t(j+1)=-log(u(1))/(event_rate*y(j))+t(j);
        if u(2)<birth_rate/event_rate
            y(j+1)=y(j)+1;
        else
            y(j+1)=y(j)-1;
        end
        j=j+1;
    end
    
    plotresult(t,k,y);
end