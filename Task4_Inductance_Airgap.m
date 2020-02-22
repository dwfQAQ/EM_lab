%----Analytical Inductance Trend----%
Inductence = figure();
%----Without Air-gap Fringging----%
L1 = (1E4)./(1.432*(1E6)-1.99*(1E6).*x1);
anf = plot(-x1,L1);
% modify the line styles
set(anf,'marker','o','linestyle','--');   
% add x- and y-axis labels
xlabel('Air-gap [mm]');
ylabel('Half-side Inductance [H]');
hold on;
%----With Air-gap Fringing----%
R2 = 4.37*(1E5)+1.99*(1E3).*x2+(3.98*(1E8).*(1-2.*x2))./((20-2.*x2).*(20-2.*x2));
L2 = (1E4)./R2;
af = plot(-x2,L2);
% modify the line styles
set(af,'marker','o','linestyle','--');
hold on;

%----Numerical Inductance Trend----%

%----Core Linear----%
nl = plot((x3+5),L3/10);
% modify the line styles
set(nl,'marker','o','linestyle','--');
hold on;
%----Core nonLinear----%
nnl = plot((x4+5),L4/10);
% modify the line styles
set(nnl,'marker','o','linestyle','--');

% add a legend
legend({'Without Air-gap Fringing','With Air-gap Fringing','Core Linear','Core Nonlinear'},'location','northeast');    
% remove the legend box
legend('boxoff');





