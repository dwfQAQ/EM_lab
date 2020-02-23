Forcen = figure();

%----Without Air-gap Fringging----%
Force1 = ones(5,1);
x = [0 -3 -4 -4.5 -4.7];  %x:displacement, air-gap = [5 2 1 0.5 0.3 0.1]

Force1(1) = (Eelec1(2)-Eelec1(1))./(3*(10^(-3)));
Force1(2) = (Eelec1(3)-Eelec1(2))./(1*(10^(-3)));
Force1(3) = (Eelec1(4)-Eelec1(3))./(0.5*(10^(-3)));
Force1(4) = (Eelec1(5)-Eelec1(4))./(0.2*(10^(-3)));
Force1(5) = (Eelec1(6)-Eelec1(5))./(0.2*(10^(-3)));
plot(x, Force1,'--o');
hold on;

%----With Air-gap Fringging----%
Force2 = ones(5,1);

x = [0 -3 -4 -4.5 -4.7];  %x:displacement, air-gap = [5 2 1 0.5 0.3]
Force2(1) = (Eelec2(2)-Eelec2(1))./(3*(10^(-3)));
Force2(2) = (Eelec2(3)-Eelec2(2))./(1*(10^(-3)));
Force2(3) = (Eelec2(4)-Eelec2(3))./(0.5*(10^(-3)));
Force2(4) = (Eelec2(5)-Eelec2(4))./(0.2*(10^(-3)));
Force2(5) = (Eelec2(6)-Eelec2(5))./(0.2*(10^(-3)));
plot(x, Force2,'--o');
hold on;

%----Core Linear----%
Force3 = ones(5,1);

x = [0 -3 -4 -4.5 -4.7];  %x:displacement, air-gap = [5 2 1 0.5 0.3]
Force3(1) = (Eelec31(5)-Eelec31(6))./(3*(10^(-3)));
Force3(2) = (Eelec31(4)-Eelec31(5))./(1*(10^(-3)));
Force3(3) = (Eelec31(3)-Eelec31(4))./(0.5*(10^(-3)));
Force3(4) = (Eelec31(2)-Eelec31(3))./(0.2*(10^(-3)));
Force3(5) = (Eelec31(1)-Eelec31(2))./(0.2*(10^(-3)));
plot(x, Force3,'--o');
hold on;

%----Core NonLinear----%
Force4 = ones(5,1);

x = [0 -3 -4 -4.5 -4.7];  %x:displacement, air-gap = [5 2 1 0.5 0.3]
Force4(1) = (Eelec41(5)-Eelec41(6))./(3*(10^(-3)));
Force4(2) = (Eelec41(4)-Eelec41(5))./(1*(10^(-3)));
Force4(3) = (Eelec41(3)-Eelec41(4))./(0.5*(10^(-3)));
Force4(4) = (Eelec41(2)-Eelec41(3))./(0.2*(10^(-3)));
Force4(5) = (Eelec41(1)-Eelec41(2))./(0.2*(10^(-3)));
plot(x, Force4,'--o');
hold on;

legend({'Without Air-gap Fringing','With Air-gap Fringing','Core Linear','Core Nonlinear'},'location','northeast');    
legend('boxoff');
xlabel('Displacement [mm]');
ylabel('Force [Newton]');
