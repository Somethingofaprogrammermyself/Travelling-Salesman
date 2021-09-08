
load ('travel_sale122.mat');
M = ones(40,40);

for x = 1:40
    for y = 1:40
        M(x,y) = sqrt((p(y)-p(x))^2 + (q(y)- q(x))^2)
    end
end
    



T = 100;
x = [1:40];
J = 0; for k = 1:39, J = J + M(x(k),x(k+1)); end

count = 1;
clear JJ
JJ(count) = J;

while T > 1e-7,
    mov = randi(40,2,1);
    if mov(1) ~= mov(2),
        if mov(1) > mov(2),
            mov = mov(2:-1:1);
        end
        ind = [[0:mov(1)-1],[mov(2):-1:mov(1)],[mov(2)+1:41]];
        xnew = x(ind(2:41));
        Jnew = 0; for k = 1:39, Jnew = Jnew + M(xnew(k),xnew(k+1)); end
        if Jnew < J
            x = xnew;
            J = Jnew;
            count = count+1;
            JJ(count) = J;
        else
            R = rand;
            if R < exp(-(Jnew-J)/T),
                x = xnew;
                J = Jnew;
                count = count+1;
                JJ(count) = J;
            
            end
        end
        T = T * 0.999;
    end
end
clc
n = 10;


disp(' ')



disp(' ')

plot([-20 20],[0 0],'k')
hold on
plot([0 0],[-20 20],'k')




pl= plot(p,q,'x');
set(pl,'linewidth',3);
set(pl,'markersize',15);

for k = 1:39,
    plot([p(xnew(k)) p(xnew(k+1))],[q(xnew(k)) q(xnew(k+1))]);
end

hold off

t = xlabel('p');
set(t,'fontsize',24);
t = ylabel('q');
set(t,'fontsize',24);


disp (' ')