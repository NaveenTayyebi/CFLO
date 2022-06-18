%% Shockless Fluid Property Ratios
classdef shockless
    methods(Static)
        % Plots speicified fluid property relations for a given specific 
        % heat ratio and range of Mach numbers
         function plot(specHeatRatio,machRange,varargin)
            syms x
            figNumber = 1;
            [g, range, prop] = ...
                shockless.arg_check(specHeatRatio,machRange,varargin);
            for num = 1:length(prop{1})
                switch prop{1}{num}
                    case 'p'
                        figure(figNumber)
                        f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-g/(g-1));
                        f2 = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(-1/2);
                        f3 = (1+g)/(1+g*x^2);
                        fplot(f1,range,'linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,range,'linewidth',1,'color','red');
                        hold on 
                        fplot(f3,range,'linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('p/p*');
                        title('Sonic Pressure Ratios');
                        legend('Isentropic','Adiabatic','Reversible Heat Transfer');
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
                        legend('Isentropic','Adiabatic','Reversible Heat Transfer');
                     case 'd' 
                        figure(figNumber)
                        f1 = (2/(g+1)*(1+(g-1)/2*x^2))^(-1/(g-1));
                        f2 = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(1/2);
                        f3 = 1/x^2*(1+g*x^2)/(1+g);
                        fplot(f1,range,'linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,range,'linewidth',1,'color','red');
                        hold on 
                        fplot(f3,range,'linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('\rho/\rho*');
                        title('Sonic Density Ratios');
                        legend('Isentropic','Adiabatic','Reversible Heat Transfer');
                     case 'tp'
                        figure(figNumber)
                        f1 = 1; 
                        f2 = 1/x*((2/(g+1))*(1 + (g-1)/2*x^2))^((g+1)/(2*g-2));
                        f3 = (1 + g)/(1 + g*x^2)*((2/(g+1))*(1 + (g-1)/2*x^2))^(g/(g-1));
                        fplot(f1,[1 5],'Linewidth',1,'color','#D95319');
                        hold on 
                        fplot(f2,[1 5],'Linewidth',1,'color','red');
                        hold on 
                        fplot(f3,[1 5],'Linewidth',1,'color','magenta');
                        xlabel('Mach Number');
                        ylabel('p_{o} / p_{o}*');
                        title('Sonic Total Pressure Ratios');
                        legend('Isentropic','Adiabatic','Reversible Heat Transfer');
                      otherwise
                         error('Plot abbreviations do not exist'); 
                         return; 
                end 
                figNumber = figNumber + 1; 
            end 
         end
         % Returns sonic propery ratios for a given specific heat ratio,
         % Mach number, and Flow Type (Isentropic, Adiabatic, and 
         % Frictionless Reversible-Heat Transfer)
         function computedValue = sonic_ref_calc(specHeatRatio,...
                 machNumber,property,flowType) 
            syms x
            [g, mach, prop] = ...
               shockless.arg_2check(specHeatRatio,machNumber, property);
                switch prop
                    case 'p'
                        if (isequal(flowType,'is'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-g/(g-1));
                            computedValue = eval(subs(f,x,mach));
                            return;
                        end
                        if (isequal(flowType,'ad'))
                            f = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(-1/2);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'rvht'))
                            f = (1+g)/(1+g*x^2);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                            return; 
                        end   
                     case 'T'
                        if (isequal(flowType,'is'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'ad'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-1);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'rvht'))
                            f = x^2*(1+g)^2/(1+g*x^2)^2;
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                            return;
                        end 
                     case 'd' 
                        if (isequal(flowType,'is'))
                            f = (2/(g+1)*(1+(g-1)/2*x^2))^(-1/(g-1));
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'ad'))
                            f = 1/x*(2/(g+1)*(1+(g-1)/2*x^2))^(1/2);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'rvht'))
                            f = 1/x^2*(1+g*x^2)/(1+g);
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                            return;
                        end 
                     case 'tp'
                        if (isequal(flowType,'is'))
                            f = 1; 
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'ad'))
                            f = 1/x*((2/(g+1))*(1 + (g-1)/2*x^2))^((g+1)/(2*g-2));
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        end 
                        if (isequal(flowType,'rvht'))
                            f = (1 + g)/(1 + g*x^2)*((2/(g+1))*(1 + (g-1)/2*x^2))^(g/(g-1));
                            computedValue =  eval(subs(f,x,mach));
                            return;
                        else 
                            error("Flow-type abbreviation does not exist");
                            return;
                        end 
                      otherwise
                         error('Plot abbreviation does not exist'); 
                         return; 
                end 
         end 
    end
    methods(Access = private)
         % Checks for valid specific heat ratio, range of mach numbers, 
         % and plots requested to shockless.plot(). If values are 
         % valid, nothing occurs. If values are invalid, an error is 
         % returned. 
         function [valid_g, valid_range, valid_prop] = ...
                    arg_check(specHeatRatio,machRange,varargin)
            switch nargin
                case 0
                    error('Specific heat ratio not defined');
                    return;
                case 1
                    if (isa(specHeatRatio,'double') && ...
                        all(specHeatRatio(:) >= 1) && ...
                        isreal(specHeatRatio) && ... 
                        isequal(size(specHeatRatio),[1 1]))
                        valid_g = specHeatRatio; 
                    else 
                        error("Invalid specific heat ratio");
                        return; 
                    end 
                        valid_range = [1 10]; 
                        valid_property = {'p'};
                 case 2 
                    if (isa(specHeatRatio,'double') && ...
                        all(specHeatRatio(:) >= 1) && ...
                        isreal(specHeatRatio) && ... 
                        isequal(size(specHeatRatio),[1 1])) 
                        valid_g = specHeatRatio; 
                    else 
                        error("Invalid specific heat ratio");
                        return; 
                    end 
                    if (isa(machRange,'double') && ...
                        all(machRange(:) > 0) && ...
                        isreal(machRange) && ... 
                        isequal(size(machRange),[1 1]))
                        valid_range = machRange; 
                    else 
                        error("Invalid mach range");
                        return; 
                    end
                    property = {'p'};
                otherwise 
                    if (isa(specHeatRatio,'double') && ...
                        all(specHeatRatio(:) >= 1) && ...
                        isreal(specHeatRatio) && ... 
                        isequal(size(specHeatRatio),[1 1])) 
                        valid_g = specHeatRatio; 
                    else 
                        error("Invalid specific heat ratio");
                        return;
                    end 
                    if (isa(machRange,'double') && ...
                        all(machRange(:) > 0) && ...
                        isreal(machRange) && ... 
                        isequal(size(machRange),[1 2]))
                        valid_range = machRange; 
                    else 
                        error("Invalid mach range");
                        return; 
                    end
                    baseProp = {'p','d','T','tp'};
                    valid_prop = cell(1,length(varargin));
                    for val = 1:length(varargin)
                        if ((isa(varargin{val},'char') || ...
                            isa(varargin{val},'string')) && ...
                            (ismember(varargin{val},baseProp) == 1))
                            valid_prop{val} = varargin{val};
                        else 
                            error('Property abbreviation does not exist');
                            return;
                        end 
                    end
                end 
         end
         % Checks for valid specific heat ratio, mach number, 
         % and fluid property requested to shockless.sonic_ref_calc(). 
         % If values are valid, nothing occurs. If values are invalid, 
         % an error is returned.  
         function [valid_g, valid_mach, valid_prop] = ...
                    arg_2check(specHeatRatio,machNumber,property)
            if (isa(specHeatRatio,'double') && ...
                all(specHeatRatio(:) >= 1) && ...
                isreal(specHeatRatio) && ... 
                isequal(size(specHeatRatio),[1 1]))
                valid_g = specHeatRatio; 
            else 
                error("Invalid specific heat ratio");
                return; 
            end 
            if (isa(machNumber,'double') && ...
                all(machNumber(:) > 0) && ...
                isreal(machNumber) && ... 
                isequal(size(machNumber),[1 1]))
                valid_mach = machNumber;  
            else 
                error("Invalid mach number");
                return; 
            end 
            baseProp = {'p','d','T','tp'};
            if ((isa(property,'char') || ...
                isa(property,'string')) && ...
                (ismember({property},baseProp) == 1))
                valid_prop = property;
            else 
                error('Property abbreviation does not exist');
                return;
            end 
         end 
    end 
end 
 
 