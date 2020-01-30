clear
init_pop=1;
replicates=100; % number of times the system is simulated
% rates of the two poisson processes
birth_rate=1.5; death_rate=0.7;
tmax = 10;
final_states = zeros(replicates,1);

for k=1:replicates
    clear t y
    y(1)=init_pop;
    t(1)= 0;
    j=1;
    while t(j)<tmax
        u=rand(1,2);
        event_rate = birth_rate+death_rate;
        t(j+1)=-log(u(1))/(event_rate*y(j))+t(j);
        if u(2)<birth_rate/event_rate
            y(j+1)=y(j)+1;
        else
            y(j+1)=y(j)-1;
            if y(j+1) == 0
                t(j+2) = tmax;
                y(j+2) = 0;
                break
            end
        end
        j=j+1;
    end
    final_states(k)=y(end);
end

final_states;
mean = mean(final_states)
variance = var(final_states)
extinction_prob = sum(final_states==0)/replicates
