filename1 = 'binplotdata.txt';
[N1,V1,Time1]=textread(filename1,'%n%n%n',19);
plot(N1,Time1,'ko','LineWidth',1.5);
hold on
filename2 = 'Marplotdata.txt';
[N2,V2,Time2]=textread(filename2,'%n%n%n',19);
plot(N2,Time2,'k*','LineWidth',1.5);
plot(N1,Time1,'m','LineWidth',1.5);
plot(N2,Time2,'r','LineWidth',1.5);
xlabel('N');
ylabel('Time');
title('Total time under different N');
legend('Recursion','Markov') 
hold off