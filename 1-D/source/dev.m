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
%shockless.arg_2check(-1.2,2,'p');
%shockless.arg_2check(1.2i,2,'p');
%shockless.arg_2check([-1.2 -1.2],2,'p');
%shockless.arg_2check([1.2 1.2],2,'p');
%shockless.arg_2check([1.2 ; 1.2],2,'p');
%shockless.arg_2check([0.2 ; 0.2],2,'p');
%shockless.arg_2check([0.2 ; 0.2 ; 0.2],2,'p');
%shockless.arg_2check(1.2i,2,'p');
%shockless.arg_2check(1.00000,2,'p');
%shockless.arg_2check(1.1,-0.00000000001,'p');
%shockless.arg_2check(1.2,[-0.00001 0.0001],'p');
%shockless.arg_2check(1.2,[0.00001 -0.0001],'p');
%shockless.arg_2check(1.2,[2 2],'p');
a.a.a = 'a'; 
mach = {[0.0000001 0.000001],[0.00001 ; 0.00001],[0.00001 0.00001...
    ; 0.000001 0.00001],-0.00001,0.00001i,2+i, [2 + 2i 2 + 2i],...
    @(x) x, {0.0001}, 0:0.1:1,'a',"a",'ababab',"abababa",['a' 'a'],...
    ['b' 1],[Inf 0],-Inf,a.a.a,0.999};
specHeatRatio = {[0.0000001 0.000001],[0.00001 ; 0.00001],[0.00001 0.00001...
    ; 0.000001 0.00001],-0.00001,0.00001i,2+2i, [2 + 2i 2 + 2i],...
    @(x) x, {0.0001}, 0:0.1:1,'a',"a",'ababab',"abababa",['a' 'a'],...
    ['b' 1],[Inf 0],-Inf,a.a.a,0.999};
abbreviation = {'p','d','T','tp','asda','asdas','juEU',1212,2+2i,2}; 
disp(length(mach))
for i = 1:length(mach) 
    try shockless.arg_2check(1.2,mach{i},'p');
    catch 
        disp(i)
    end 
end 
disp(" ")
machRange = {[2 3],[0.00001 ; 0.00001],[0.00001 0.00001...
    ; 0.000001 0.00001],-0.00001,0.00001i,2+i, [2 + 2i 2 + 2i],...
    @(x) x, {0.0001}, 0:0.1:1,'a',"a",'ababab',"abababa",['a' 'a'],...
    ['b' 1],[Inf 0],-Inf,a.a.a,[0.999 0.899]};
for i = 1:length(machRange) 
    try shockless.arg_check(1.2,machRange{i},'p');
    catch 
        %disp(i)
    end 
end 



