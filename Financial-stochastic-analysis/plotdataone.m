filename = 'binplotdata.txt';
[N,V,Time]=textread(filename,'%n%n%n',19);
plot(N,V,'k*','LineWidth',1.5);
hold on
plot(N,V,'r','LineWidth',1.5);
xlabel('N');
ylabel('V');
title('Option price V under different N');
hold off
