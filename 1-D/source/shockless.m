%% Shockless Fluid Property Ratios
classdef shockless
    methods(Static)
        % Plots speicified fluid property relation for a given specific 
        % heat ratio and range of Mach numbers
        function total_ref_plot(spec_heat_ratio,mach_range,varargin)
            syms x
            figNumber = length(findobj('type','figure')) + 1;
            [g, range, prop] = ...
                shockless.arg_check(spec_heat_ratio,mach_range,varargin);
            baseProp = {'p','d','T'};
            for num = 1:length(prop)
                if (~ismember(prop{num},baseProp) == 1)
                    error('Plot abbreviations do not exist'); 
                end 
            end 
            for num = 1:length(prop)
                temp = prop{num};
                switch temp{1}
                    case 'p'
                        figure(figNumber)
                        f = (1+(g-1)/2*x^2)^(-g/(g-1));
                        fplot(f,range,'linewidth',1,'color','#D95319');
                        xlabel('Mach Number');
                        ylabel('p/p_{o}');
                        title('Total Pressure Ratio');
                        legend('Isentropic');
                     case 'T'
                        figure(figNumber)
                        f = (1+(g-1)/2*x^2)^(-1);
                        fplot(f,range,'linewidth',1,'color','#D95319');
                        xlabel('Mach Number');
                        ylabel('T/T_{o}');
                        title('Total Temperature Ratio');
                        legend('Isentropic');
                     case 'd' 
                        figure(figNumber)
                        f = (1+(g-1)/2*x^2)^(-1/(g-1));
                        fplot(f,range,'linewidth',1,'color','#D95319');
                        xlabel('Mach Number');
                        ylabel('\rho/\rho_{o}');
                        title('Total Density Ratio');
                        legend('Isentropic');
                    otherwise
                         error('Plot abbreviations do not exist'); 
                end 
                figNumber = figNumber + 1; 
            end 
        end 
        % Returns total propery ratio for a given specific heat ratio and 
        % Mach number
        function computedValue = total_ref_calc(spec_heat_ratio,...
                 mach_number,property)
            syms x
            [g, mach, prop] = ...
               shockless.arg_2check(spec_heat_ratio,mach_number, property);
            baseProp = {'p','d','T'};
            if (~ismember({prop},baseProp) == 1)
                error('Plot abbreviations do not exist'); 
            end 
            switch prop 
                case 'p' 
                    f = (1+(g-1)/2*x^2)^(-g/(g-1));
                    computedValue = eval(subs(f,x,mach));
                    return;
                case 'd'
                    f = (1+(g-1)/2*x^2)^(-1/(g-1));
                    computedValue =  eval(subs(f,x,mach));
                    return;
                case 'T'
                    f = (1+(g-1)/2*x^2)^(-1);
                    computedValue =  eval(subs(f,x,mach));
                    return;
                otherwise
                    error('Plot abbreviation does not exist'); 
            end 
        end 
        % Plots speicified fluid property relations for a given specific 
        % heat ratio and range of Mach numbers
        function sonic_ref_plot(spec_heat_ratio,mach_range,varargin)
            syms x
            figNumber = length(findobj('type','figure')) + 1;
            [g, range, prop] = ...
                shockless.arg_check(spec_heat_ratio,mach_range,varargin);
            for num = 1:length(prop)
                temp = prop{num}; 
                switch temp{1}
                    case 'p'
                        if (range(1) == 0)
                            fan_range = [0.0001 range(2)];
                            warning(['Fanno sonic pressure ratio',...
                                    + ' is undefined at 0. Substituting',...
                                    + ' in mach number of 1e-4']);
                        else 
                            fan_range = range; 
                        end
                        figure(figNumber)
                        f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-g/(g-1));
                        f2 = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(-1/2);
                        f3 = (1+g)/(1+g*x^2);
                        fplot(f1,range,'linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,fan_range,'linewidth',1,'color','red');
                        hold on 
                        fplot(f3,range,'linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('p/p*');
                        title('Sonic Pressure Ratios');
                        legend('Isentropic','Fanno','Rayleigh');
                     case 'T'
                        figure(figNumber)
                        f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
                        f2 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
                        f3 = x^2*(1+g)^2/(1+g*x^2)^2;
                        fplot(f1,range,'linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,range,'linewidth',0.8,'color','red','marker','o'); 
                        hold on 
                        fplot(f3,range,'linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('T/T*');
                        title('Sonic Temperature Ratios');
                        legend('Isentropic','Fanno','Rayleigh');
                     case 'd'
                        if (range(1) == 0)
                            fan_range = [0.0001 range(2)];
                            warning(['Fanno sonic density ratio',...
                                    + ' is undefined at 0. Substituting',...
                                    + ' in mach number of 1e-4']);
                        else 
                            fan_range = range;
                        end
                        figure(figNumber)
                        f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1/(g-1));
                        f2 = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(1/2);
                        f3 = 1/x^2*(1+g*x^2)/(1+g);
                        fplot(f1,range,'linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,fan_range,'linewidth',1,'color','red');
                        hold on 
                        fplot(f3,range,'linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('\rho/\rho*');
                        title('Sonic Density Ratios');
                        legend('Isentropic','Fanno','Rayleigh');
                     case 'tp'
                        if (range(1) == 0)
                            fan_range = [0.0001 range(2)];
                            warning(['Fanno sonic total pressure ratio',...
                                    + ' is undefined at 0. Substituting',...
                                    + ' in mach number of 1e-4']);
                        else 
                            fan_range = range;
                        end
                        figure(figNumber)
                        f1 = 1; 
                        f2 = 1/x*((2/(g+1))*(1 + (g-1)/2*x^2))^((g+1)/(2*g-2));
                        f3 = (1 + g)/(1 + g*x^2)*((2/(g+1))*(1 + (g-1)/2*x^2))^(g/(g-1));
                        fplot(f1,range,'Linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,fan_range,'Linewidth',1,'color','red');
                        hold on 
                        fplot(f3,range,'Linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('p_{o} / p_{o}*');
                        title('Sonic Total Pressure Ratios');
                        legend('Isentropic','Fanno','Rayleigh');
                    case 'tT'
                        figure(figNumber)
                        f1 = 1; 
                        f2 = 1; 
                        f3 = (g + 1)*x^2/(1 + g*x^2)^2*(2 + (g - 1)*x^2); 
                        fplot(f1,range,'Linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,range,'Linewidth',1,'color','red');
                        hold on 
                        fplot(f3,range,'Linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('T_{o} / T_{o}*');
                        title('Sonic Total Temperature Ratios');
                        legend('Isentropic','Fanno','Rayleigh');
                    case 'A'
                        if (range(1) == 0)
                            is_range = [0.0001 range(2)];
                            warning(['Isentropic sonic area ratio',...
                                    + ' is undefined at 0. Substituting',...
                                    + ' in mach number of 1e-4']);
                        else 
                            is_range = range; 
                        end 
                        figure(figNumber)
                        f1 = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^((g+1)/(2*g-2));
                        fplot(f1,is_range,'Linewidth',1,'color','#D95319');
                        xlabel('Mach Number');
                        ylabel('A / A*');
                        title('Sonic Area Ratios');
                        legend('Isentropic'); 
                    otherwise
                         error('Plot abbreviations do not exist'); 
                end 
                figNumber = figNumber + 1; 
            end 
         end
         % Returns sonic propery ratios for a given specific heat ratio,
         % Mach number, and Flow Type (Isentropic, Fanno, and 
         % Rayleigh)
         function computedValue = sonic_ref_calc(spec_heat_ratio,...
                 mach_number,property,flow_type) 
            syms x
            [g, mach, prop] = ...
               shockless.arg_2check(spec_heat_ratio,mach_number,property);
                switch prop
                    case 'p'
                        if (isequal(flow_type,'is'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-g/(g-1));
                            computedValue = eval(subs(f,x,mach));
                            return;
                        end
                        if (isequal(flow_type,'fan'))
                            if (mach == 0)
                                mach = 0.0001; 
                                warning(['Fanno sonic pressure ratio',...
                                          + ' is undefined at 0. Substituting',...
                                          + ' in mach number of 1e-4']);
                            end
                            f = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(-1/2);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'ray'))
                            f = (1+g)/(1+g*x^2);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist"); 
                        end   
                    case 'T'
                        if (isequal(flow_type,'is'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'fan'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'ray'))
                            f = x^2*(1+g)^2/(1+g*x^2)^2;
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                        end 
                    case 'd' 
                        if (isequal(flow_type,'is'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-1/(g-1));
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'fan'))
                            if (mach == 0)
                                mach = 0.0001; 
                                warning(['Fanno sonic density ratio',...
                                          + ' is undefined at 0. Substituting',...
                                          + ' in mach number of 1e-4']);
                            end
                            f = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(1/2);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'ray'))
                            f = 1/x^2*(1+g*x^2)/(1+g);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                        end 
                    case 'tp'
                        if (isequal(flow_type,'is'))
                            f = 1; 
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'fan'))
                            if (mach == 0)
                                mach = 0.0001; 
                                warning(['Fanno sonic total pressure ratio',...
                                          + ' is undefined at 0. Substituting',...
                                          + ' in mach number of 1e-4']);
                            end 
                            f = 1/x*((2/(g+1))*(1 + (g-1)/2*x^2))^((g+1)/(2*g-2));
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'ray'))
                            f = (1 + g)/(1 + g*x^2)*((2/(g+1))*(1 + (g-1)/2*x^2))^(g/(g-1));
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                        end 
                    case 'tT'
                        if (isequal(flow_type,'is'))
                            f = 1; 
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'fan'))
                            f = 1;
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'ray'))
                            f = (g + 1)*x^2/(1 + g*x^2)^2*(2 + (g - 1)*x^2); 
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                        end 
                    case 'A'
                        if (isequal(flow_type,'is'))
                            if (mach == 0)
                                mach = 0.0001; 
                                warning(['Isentropic sonic area ratio',...
                                          + ' is undefined at 0. Substituting',...
                                          + ' in mach number of 1e-4']);
                            end
                            f = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^((g+1)/(2*g-2)); 
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flow_type,'fan') || isequal(flow_type,'ray'))
                            warning('Only isentropic sonic area ratio available');
                            return; 
                        end 
                    otherwise
                         error('Plot abbreviation does not exist');  
                end 
         end 
        % Plots or calculates sonic length for a fanno flow given a 
        % specified mach number/range, duct diameter, and friction factor
         function computedValue = fanno_mach(spec_heat_ratio,output,quantity,...
                 varargin)
            syms x
            figNumber = length(findobj('type','figure')) + 1;
            [g, option, selection, variables] = ...
                                shockless.arg_3check(spec_heat_ratio,...
                                output,quantity,varargin);
            if (option == 'plot') 
                if (isequal(selection,'dim'))
                    range = variables{1};
                    figure(figNumber);
                    f1 = -1/(g*x^2) - (g+1)/(2*g)*log(x^2*(1+(g-1)/2*x^2)^(-1));
                    f2 = eval(subs(f1,x,1)) - f1; 
                    fplot(f2,range,'Linewidth',1,'color','blue');
                    xlabel('Upstream Mach Number ( M_{1} )');
                    ylabel('4fL*/D');
                    title('Dimenionless Sonic Length');
                    return; 
                end 
                if (isequal(selection,'sl'))
                    range = variables{1}; 
                    D = variables{2}; 
                    fr = variables{3}; 
                    figure(figNumber);
                    f1 = (D/(4*fr))*(-1/(g*x^2) - (g+1)/(2*g)*log(x^2*(1+(g-1)/2*x^2)^(-1)));
                    f2 = eval(subs(f1,x,1)) - f1; 
                    fplot(f2,range,'Linewidth',1,'color','red');
                    xlabel('Upstream Mach Number ( M_{1} )');
                    ylabel('L*');
                    title('Sonic Length');
                    return; 
                end 
            end 
            if (option == 'calc')
                if (isequal(selection,'dim'))
                    mach = variables{1}; 
                    f1 = -1/(g*x^2) - (g+1)/(2*g)*log(x^2*(1+(g-1)/2*x^2)^(-1));
                    f2 = eval(subs(f1,x,1)) - f1; 
                    computedValue = eval(subs(f2,x,mach)); 
                    return; 
                end 
                if (isequal(selection,'sl'))
                    mach = variables{1}; 
                    D = variables{2}; 
                    fr = variables{3}; 
                    f1 = (D/(4*fr))*(-1/(g*x^2) - (g+1)/(2*g)*log(x^2*(1+(g-1)/2*x^2)^(-1)));
                    f2 = eval(subs(f1,x,1)) - f1; 
                    computedValue = eval(subs(f2,x,mach)); 
                    return; 
                end  
            end 
         end
         % Plots Fanno and/or Rayleigh lines 
         function entropy_plot(spec_heat_ratio,flow_type)
            syms x y 
            figNumber = length(findobj('type','figure')) + 1;
            [g] = shockless.arg_check(spec_heat_ratio);
            points = 1700;
            if (g <= 1.05)
                warning("Small specific heat ratios may cause partial rendering");
            end 
            switch flow_type
                case 'fan'
                    figure(figNumber); 
                    M = ((2/(g-1))*((g+1)/2.*1/y-1)).^(1/2);
                    f1 = -x + (g-1)/g*log(M.*y.^((g+1)/(2*g-2))); 
                    fimplicit(f1,[-2 1.5 0 1.5],'Linewidth',1,'color','blue');
                    xlim([-1.5 0.2]);
                    ylim([0 1.5]);
                    xlabel("\Delta{s}/c_{p}");
                    ylabel("T / T*");
                    title("Fanno Line");
                case 'ray'
                    figure(figNumber);
                    A = y.^(-1/2); 
                    M1 = A*(g+1)/(2*g) - (A.^2*(g+1)^2-4*g).^(1/2)/(2*g);
                    Tt1 = 1./y.*((2/(g+1))*(1+(g-1)/2.*M1.^2)).^(-1);
                    Pt1 = M1.*A*((2/(g+1))*(1+(g-1)/2.*M1.^2)).^(-g/(g-1));
                    f1 = x + log(Tt1) - (g-1)/g*log(Pt1); 
                    M2 = A*(g+1)/(2*g) + (A.^2*(g+1)^2-4*g).^(1/2)/(2*g);
                    Tt2 = 1./y.*((2/(g+1))*(1+(g-1)/2.*M2.^2)).^(-1);
                    Pt2 = M2.*A*((2/(g+1))*(1+(g-1)/2.*M2.^2)).^(-g/(g-1)); 
                    f2 = x + log(Tt2) - (g-1)/g*log(Pt2);
                    fimplicit(f1,[-2 1.5 0 1.5],'Linewidth',1,'color','red','MeshDensity',points);
                    hold on 
                    fimplicit(f2,[-2 1.5 0 1.5],'Linewidth',1,'color','red','MeshDensity',points);
                    xlim([-1.5 0.2]);
                    ylim([0 1.5]);
                    xlabel("\Delta{s}/c_{p}");
                    ylabel("T / T*");
                    title("Rayleigh Line");
                case 'all'
                    figure(figNumber); 
                    M = ((2/(g-1))*((g+1)/2.*1/y-1)).^(1/2);
                    f1 = -x + (g-1)/g*log(M.*y.^((g+1)/(2*g-2))); 
                    fimplicit(f1,[-2 1.5 0 1.5],'Linewidth',1,'color','blue');
                    hold on 
                    A = y.^(-1/2); 
                    M1 = A*(g+1)/(2*g) - (A.^2*(g+1)^2-4*g).^(1/2)/(2*g);
                    Tt1 = 1./y.*((2/(g+1))*(1+(g-1)/2.*M1.^2)).^(-1);
                    Pt1 = M1.*A*((2/(g+1))*(1+(g-1)/2.*M1.^2)).^(-g/(g-1));
                    f1 = x + log(Tt1) - (g-1)/g*log(Pt1); 
                    M2 = A*(g+1)/(2*g) + (A.^2*(g+1)^2-4*g).^(1/2)/(2*g);
                    Tt2 = 1./y.*((2/(g+1))*(1+(g-1)/2.*M2.^2)).^(-1);
                    Pt2 = M2.*A*((2/(g+1))*(1+(g-1)/2.*M2.^2)).^(-g/(g-1)); 
                    f2 = x + log(Tt2) - (g-1)/g*log(Pt2);
                    fimplicit(f1,[-2 1.5 0 1.5],'Linewidth',1,'color','red','MeshDensity',points);
                    hold on 
                    fimplicit(f2,[-2 1.5 0 1.5],'Linewidth',1,'color','red','MeshDensity',points);
                    xlim([-1.5 0.2]);
                    ylim([0 1.5]);
                    xlabel("\Delta{s}/c_{p}");
                    ylabel("T / T*");
                    title("Fanno and Rayleigh Lines");
                    legend("Fanno","Rayleigh","");
                otherwise
                    error('Flow type abbreviation does not exist')
            end 
            return;
         end  
    end
    methods(Static,Access = private)
         % Checks for valid specific heat ratio, range of mach numbers, 
         % and plots requested to shockless.plot(). If values are 
         % valid, nothing occurs. If values are invalid, an error is 
         % returned. 
         function [valid_g, valid_range, valid_prop] = ...
                    arg_check(spec_heat_ratio,mach_range,varargin)
            switch nargin
                case 0
                    error('Specific heat ratio not defined');
                case 1
                    if (isa(spec_heat_ratio,'double') && ...
                        all(spec_heat_ratio(:) >= 1) && ...
                        isreal(spec_heat_ratio) && ... 
                        isequal(size(spec_heat_ratio),[1 1]))
                        valid_g = spec_heat_ratio; 
                    else 
                        error("Invalid specific heat ratio");
                    end 
                        valid_range = [1 10]; 
                        valid_prop = {'p'};
                 case 2 
                    if (isa(spec_heat_ratio,'double') && ...
                        all(spec_heat_ratio(:) >= 1) && ...
                        isreal(spec_heat_ratio) && ... 
                        isequal(size(spec_heat_ratio),[1 1])) 
                        valid_g = spec_heat_ratio; 
                    else 
                        error("Invalid specific heat ratio");
                    end 
                    if (isa(mach_range,'double') && ...
                        all(mach_range(:) >= 0) && ...
                        isreal(mach_range) && ... 
                        isequal(size(mach_range),[1 1]))
                        valid_range = mach_range; 
                    else 
                        error("Invalid mach range");
                        return; 
                    end
                    valid_prop = {'p'};
                otherwise 
                    if (isa(spec_heat_ratio,'double') && ...
                        all(spec_heat_ratio(:) >= 1) && ...
                        isreal(spec_heat_ratio) && ... 
                        isequal(size(spec_heat_ratio),[1 1])) 
                        valid_g = spec_heat_ratio; 
                    else 
                        error("Invalid specific heat ratio");
                    end 
                    if (isa(mach_range,'double') && ...
                        all(mach_range(:) >= 0) && ...
                        isreal(mach_range) && ... 
                        isequal(size(mach_range),[1 2]))
                        valid_range = mach_range; 
                    else 
                        error("Invalid mach range");
                    end
                    baseProp = {'p','d','T','tp','tT','A'};
                    valid_prop = cell(1,length(varargin));
                    for val = 1:length(varargin{1})
                        temp = varargin{1}(val); 
                        if ((isa(temp{1},'char') || ...
                            isa(temp{1},'string')) && ...
                          (all(ismember({num2str(temp{1})},baseProp) == 1) > 0))
                            valid_prop{val} = temp;
                        else 
                            error('Property abbreviations do not exist');
                        end 
                    end
            end 
         end
         % Checks for valid specific heat ratio, mach number, 
         % and fluid property requested to shockless.sonic_ref_calc(). 
         % If values are valid, nothing occurs. If values are invalid, 
         % an error is returned.  
         function [valid_g, valid_mach, valid_prop] = ...
                    arg_2check(spec_heat_ratio,mach_number,property)
            if (isa(spec_heat_ratio,'double') && ...
                all(spec_heat_ratio(:) >= 1) && ...
                isreal(spec_heat_ratio) && ... 
                isequal(size(spec_heat_ratio),[1 1]))
                valid_g = spec_heat_ratio; 
            else 
                error("Invalid specific heat ratio");
            end 
            if (isa(mach_number,'double') && ...
                all(mach_number(:) >= 0) && ...
                isreal(mach_number) && ... 
                isequal(size(mach_number),[1 1]))
                valid_mach = mach_number;  
            else 
                error("Invalid mach number");
            end 
            baseProp = {'p','d','T','tp','tT','A'};
            if ((isa(property,'char') || ...
                isa(property,'string')) && ...
                (ismember({num2str(property)},baseProp) == 1))
                valid_prop = property;
            else 
                error('Property abbreviation does not exist');
            end 
         end
         % Checks for valid specific heat ratio, duct diameter, 
         % friction factor, and option requested to 
         % shockless.fanno_mach(). If inputs are valid, nothing 
         % occurs, if invalid, an error is returned. 
         function [valid_g, valid_option, valid_selection, valid_variables]...
                    = arg_3check(spec_heat_ratio,output,quantity,...
                        varargin)
            if (isa(spec_heat_ratio,'double') && ...
                all(spec_heat_ratio(:) >= 1) && ...
                isreal(spec_heat_ratio) && ... 
                isequal(size(spec_heat_ratio),[1 1]))
                valid_g = spec_heat_ratio; 
            else 
                error("Invalid specific heat ratio");
            end
            baseOptions = {'plot','calc'};
            if ((isa(output,'char') || ...
                isa(output,'string')) && ...
                (ismember({num2str(output)},baseOptions) == 1))
                valid_option = output;
            else 
                error('Option does not exist');
            end 
            baseSelections = {'dim','sl'};
            if ((isa(quantity,'char') || ...
                isa(quantity,'string')) && ...
                (ismember({num2str(quantity)},baseSelections) == 1))
                valid_selection = quantity;
            else 
                error('Selection does not exist');
            end
            valid_variables = cell(1,length(varargin{1}));
            % Verify mach range 
            if (isequal(output,'plot'))
                temp = varargin{1}(1);
                if (isa(temp{1},'double') && ...
                    all(temp{1}(:) >= 0) && ...
                    isreal(temp{1}) && ... 
                    isequal(size(temp{1}),[1 2]))
                    valid_variables{1} = temp{1}; 
                else 
                    error("Invalid mach range");
                end
            end   
            if (isequal(output,'calc'))
                % Verfiy mach number
                temp = varargin{1}(1);
                if (isa(temp{1},'double') && ...
                    all(temp{1} > 0) && ...
                    isreal(temp{1}) && ... 
                    isequal(size(temp{1}),[1 1]))
                    valid_variables{1} = temp{1}; 
                 else
                    error("Invalid mach number"); 
                end  
            end
            if (isequal(quantity,'dim'))
                if (length(varargin{1}) ~= 1)
                    warning("Duct diameter and friction factor ignored");
                end
            end 
            if (isequal(quantity,'sl')) 
                if (length(varargin{1}) ~= 3)
                    error(["Mach number(s), duct diameter, and "] + ...
                            ["friction factor must be specified"]);
                end 
                temp = varargin{1}(2);
                if (isa(temp{1},'double') && ...
                    all(temp{1}(:) > 0) && ...
                    isreal(temp{1}) && ... 
                    isequal(size(temp{1}),[1 1]))
                    valid_variables{2} = temp{1}; 
                else 
                    error("Invalid duct diameter");
                end
                temp = varargin{1}(3);
                if (isa(temp{1},'double') && ...
                    all(temp{1}(:) > 0) && ...
                    isreal(temp{1}) && ... 
                    isequal(size(temp{1}),[1 1]))
                    valid_variables{3} = temp{1}; 
                else 
                    error("Invalid fricton factor");
                end
            end 
            return; 
         end 
    end 
end 
 
 