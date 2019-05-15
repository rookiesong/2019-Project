filename = 'binplotdata.txt';
[N,V,Time]=textread(filename,'%n%n%n',19);
plot(N,Time,'k*','LineWidth',1.5);
hold on
plot(N,Time,'r','LineWidth',1.5);
xlabel('N');
ylabel('Time');
title('Total time under different N');
hold off