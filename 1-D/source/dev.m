%shockless.plot(-1.2,[1 5],'d');
%shockless.plot(0,[1 5],'d');
%shockless.plot(0.00000000000001,[1 5],'d');
%shockless.plot(-0.00000000000000001,[1 5],'d');
%shockless.plot(Inf,[1 5],'d');
%shockless.plot(-Inf,[1 5],'d');
%shockless.plot([1 2],[1 5],'d');
%shockless.plot([-1 -2],[1 5],'d');
%shockless.plot([1 ; 2],[1 5],'d');
%shockless.plot([-1 ; -2],[1 5],'d');
%shockless.plot([1 1 1 ; 1 1 1],[1 5],'d');
%shockless.plot([1 ;1 ; 1],[1 5],'d');
%shockless.plot(1i,[1 5],'d');
%shockless.plot([1i 2i],[1 5],'d');
%shockless.plot([-1i -2i],[1 5],'d');
%shockless.plot([1i ;2i],[1 5],'d');
%shockless.plot([-1i ; -2i],[1 5],'d');
%shockless.plot([1i 2],[1 5],'d');
%shockless.plot([-1i -2],[1 5],'d');
%shockless.plot('a',[1 5],'d');
%shockless.plot("a",[1 5],'d');
%shockless.plot('ababab',[1 5],'d');
%shockless.plot(["a" "b"],[1 5],'d');
%shockless.plot({1.2},[1 5],'d');
%shockless.plot(@(x) x.^2,[1 5],'d');
X = 1:0.01:5;
Y = []; 
for i = 1:0.01:5
    Y = [Y shockless.sonic_ref_calc(1.4,i,'p','ad')]; 
end 
plot(X,Y,'Linewidth',1,'color','red');

