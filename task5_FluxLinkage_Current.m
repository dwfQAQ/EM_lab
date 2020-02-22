%----Flux Linkage-Current, need to load Flux Linkage.mat----% 
%----Without Air-gap Fringging----%
fh1 = figure();
Eelec1 = ones(6,1);
m = 1;
for x = [-5 -2 -1 -0.5 -0.3 -0.1] 
   L = (1E4)./(1.432*(1E6)-1.99*(1E6).*x);
   i = 0:1:10;
   psi1 = L.*i;
   plot(i, psi1,'--o');  
   Eelec1(m) = trapz(psi1,i);
   hold on;
   m = m+1;
end
legend({'5','2','1','0.5','0.3','0.1'},'location','northwest');    
legend('boxoff');
xlabel('Current [A]');
ylabel('Flux Linkage [wb]');

%----With Air-gap Fringging----%
fh2 = figure();
Eelec2 = ones(6,1);
m = 1;
for x = [-5 -2 -1 -0.5 -0.3 -0.1] 
   R = 4.37*(1E5)+1.99*(1E3).*x+(3.98*(1E8).*(1-2.*x))./((20-2.*x).*(20-2.*x));
   L = (1E4)./R;
   i = 0:1:10;   
   psi2 = L*i; 
   plot(i, psi2,'--o'); 
   Eelec2(m) = trapz(psi2,i);
   hold on;
   m = m+1;
end
legend({'5','2','1','0.5','0.3','0.1'},'location','northwest');      
legend('boxoff');
xlabel('Current [A]');
ylabel('Flux Linkage [wb]');

%----Core Linear----%
fh3 = figure();
Eelec3 = ones(6,1);
i = 1:1:11;
psi300 = plot(CP_10(i,1),CP_10(i,3),'--o');
hold on;
Eelec3(1) = trapz(CP_10(i,3),CP_10(i,1));
psi3003 = plot(CP_103(i,1),CP_103(i,3),'--o');
hold on;
Eelec3(2) = trapz(CP_103(i,3),CP_103(i,1));
psi3005 = plot(CP_105(i,1),CP_105(i,3),'--o');
hold on;
Eelec3(3) = trapz(CP_105(i,3),CP_105(i,1));
psi301 = plot(CP_11(i,1),CP_11(i,3),'--o');
hold on;
Eelec3(4) = trapz(CP_11(i,3),CP_11(i,1));
psi302 = plot(CP_12(i,1),CP_12(i,3),'--o');
hold on;
Eelec3(5) = trapz(CP_12(i,3),CP_12(i,1));
psi305 = plot(CP_15(i,1),CP_15(i,3),'--o');
hold on;
Eelec3(6) = trapz(CP_15(i,3),CP_15(i,1));
legend({'0.1','0.3','0.5','1','2','5'},'location','northwest');    
legend('boxoff');
xlabel('Current [A]');
ylabel('Flux Linkage [wb]');

 %----Core NonLinear----%
fh4 = figure();
Eelec4 = ones(6,1);
i = 1:1:11;
psi400 = plot(CP_00(i,1),CP_00(i,3),'--o');
hold on;
Eelec4(1) = trapz(CP_00(i,3),CP_00(i,1));
psi4003 = plot(CP_003(i,1),CP_003(i,3),'--o'); %not accurate enough
hold on;
Eelec4(2) = trapz(CP_003(i,3),CP_003(i,1));
psi4005 = plot(CP_005(i,1),CP_005(i,3),'--o');
hold on;
Eelec4(3) = trapz(CP_005(i,3),CP_005(i,1));
psi401 = plot(CP_01(i,1),CP_01(i,3),'--o');
hold on;
Eelec4(4) = trapz(CP_01(i,3),CP_01(i,1));
psi402 = plot(CP_02(i,1),CP_02(i,3),'--o');
hold on;
Eelec4(5) = trapz(CP_02(i,3),CP_02(i,1));
psi405 = plot(CP_05(i,1),CP_05(i,3),'--o');
hold on;
Eelec4(6) = trapz(CP_05(i,3),CP_05(i,1));
legend({'0.1','0.3','0.5','1','2','5'},'location','northwest');    
legend('boxoff');
xlabel('Current [A]');
ylabel('Flux Linkage [wb]');

