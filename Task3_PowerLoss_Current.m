I = 1:10;
P = (I.^2) * 0.1115;

Powerloss = plot(I, P);
set(Powerloss,'marker','x','color','b','linestyle','--');
% add x- and y-axis labels
xlabel('Current [A]');
ylabel('Power loss [W]');