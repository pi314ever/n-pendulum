function [] = nLinkEnergy(x,time,P)
%nLinkEnergy 
%   Plots PE/KE/Total Energy vs time in a new figure
g = P.g;
l = P.l;
m = P.m;
n = length(m);
theta = x(1:n,:);
w = x(n+1:2*n,:);

PE = zeros(n,length(time));
KE = zeros(n,length(time));
for ii = 1:n
    for jj = 1:ii
        PE(ii,:) = PE(ii,:)-m(ii)*g*l(jj)*cos(theta(jj,:));
    end
end

for k = 1:n
    for ii = 1:k
        for jj = 1:k
            KE(k,:) = KE(k,:) + 1/2*m(k)*l(ii)*l(jj)*...
                w(ii,:).*w(jj,:).*cos(theta(ii,:)-theta(jj,:));
        end
    end
end
PEt = sum(PE,1);
PEt = PEt - min(PEt); % Normalize PE
KEt = sum(KE,1);
TE = PEt + KEt;
TEmargin = sum(TE(abs((TE-TE(1))/TE(1))>0.1));
if TEmargin
    fprintf('Total energy error threshold exceeded.\n')
end

figure
plot(time,PEt,time,KEt,time,TE)
title('System Total Energies')
legend('PE','KE','Total','location','bestoutside')
xlabel('Time [s]')
ylabel('Energy [J]')

figure
for ii = 1:n
    PElabel = sprintf('PE_{%i}',ii);
    plot(time,PE(ii,:),'--','DisplayName',PElabel)
    hold on
end
title('Potential Energy per Particle')
xlabel('Time [s]')
ylabel('Energy [J]')
legend('location','bestoutside')

figure
for ii = 1:n
    KElabel = sprintf('KE_{%i}',ii);
    plot(time,KE(ii,:),'-.','DisplayName',KElabel)
    hold on
end
title('Kinetic Energy per Particle')
xlabel('Time [s]')
ylabel('Energy [J]')
legend('location','bestoutside')

end

