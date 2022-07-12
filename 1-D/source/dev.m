%shockless.sonic_ref_calc(1.4,4,'tp','ray')
%shockless.sonic_ref_plot(1.4,[0.2 2],'p');
X = [0.1:0.01:2];
Y = []; 
for i = 0.1:0.01:2
    Y = [Y shockless.fanno_mach(1.4,'calc','dim',i,2,0.02)];
end
figure(1)
plot(X,Y,'Linewidth',1,'color','green');
xlim([0.1 2]);
ylim([0 Y(1)]);

shockless.fanno_mach(1.4,'plot','dim',[0.1 2],2,0.02);


%shockless.sonic_ref_plot(1.4,[1 3],'p')

