function Animation(x,time,P)
% Animates n-particle pendulum
figure
l = P.l;
n = length(l);
theta = x(1:n,:);
len = sum(l);
Px = zeros(n,length(time));
Py = zeros(n,length(time));
for k = 1:n
    for ii= 1:k
        Px(k,:) = Px(k,:) + l(ii)*sin(theta(ii,:));
        Py(k,:) = Py(k,:) - l(ii)*cos(theta(ii,:));
    end
end

axisVec = [-len,len,-len,len];
for ii = 1:length(time)
    %tic
    plot(Px(:,ii),Py(:,ii),'o'); %plot masses
    hold on
    plot([0;Px(:,ii)],[0;Py(:,ii)]); %plot links
    hold off
    title(sprintf('N-pendulum Animation, t=%.3fs',time(ii)));
    xlabel('X [m]')
    ylabel('Y [m]')
    axis equal;axis square
    axis(axisVec)
    drawnow
    %toc
    pause(.01)
end

end


