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
                    return;
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
                         return; 
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
                return;
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
                    return;
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
                         return; 
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
               shockless.arg_2check(spec_heat_ratio,mach_number, property);
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
                            return; 
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
                            return;
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
                            return;
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
                            return;
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
                            return;
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
                         return; 
                end 
         end 

         function computedValue = fanno_mach(spec_heat_ratio,duct_diameter, ...
                 friction_factor,quantity,varargin)
            [g, D, fr, option,selection] = ...
                                shockless.arg_3check(spec_heat_ratio,...
                                 duct_diameter,friction_factor,quantity,...
                                  varargin);
            
            return; 
         end 

         function computedValue = rayleigh_mach(spec_heat_ratio,duct_diameter, ...
                 friction_factor,quantity,varargin)
            computedValue = 0; 
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
                    return;
                case 1
                    if (isa(spec_heat_ratio,'double') && ...
                        all(spec_heat_ratio(:) >= 1) && ...
                        isreal(spec_heat_ratio) && ... 
                        isequal(size(spec_heat_ratio),[1 1]))
                        valid_g = spec_heat_ratio; 
                    else 
                        error("Invalid specific heat ratio");
                        return; 
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
                        return; 
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
                        return;
                    end 
                    if (isa(mach_range,'double') && ...
                        all(mach_range(:) >= 0) && ...
                        isreal(mach_range) && ... 
                        isequal(size(mach_range),[1 2]))
                        valid_range = mach_range; 
                    else 
                        error("Invalid mach range");
                        return; 
                    end
                    baseProp = {'p','d','T','tp','tT','A'};
                    valid_prop = cell(1,length(varargin));
                    for val = 1:length(varargin{1})
                        temp = varargin{1}(val); 
                        if ((isa(temp{1},'char') || ...
                            isa(temp{1},'string')) && ...
                          (all(ismember(temp,baseProp) == 1) > 0))
                            valid_prop{val} = temp;
                        else 
                            error('Property abbreviations do not exist');
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
                    arg_2check(spec_heat_ratio,mach_number,property)
            if (isa(spec_heat_ratio,'double') && ...
                all(spec_heat_ratio(:) >= 1) && ...
                isreal(spec_heat_ratio) && ... 
                isequal(size(spec_heat_ratio),[1 1]))
                valid_g = spec_heat_ratio; 
            else 
                error("Invalid specific heat ratio");
                return; 
            end 
            if (isa(mach_number,'double') && ...
                all(mach_number(:) >= 0) && ...
                isreal(mach_number) && ... 
                isequal(size(mach_number),[1 1]))
                valid_mach = mach_number;  
            else 
                error("Invalid mach number");
                return; 
            end 
            baseProp = {'p','d','T','tp','tT','A'};
            if ((isa(property,'char') || ...
                isa(property,'string')) && ...
                (ismember({property},baseProp) == 1))
                valid_prop = property;
            else 
                error('Property abbreviation does not exist');
                return;
            end 
         end
         % Checks for valid specific heat ratio, duct diameter, 
         % friction factor, and option requested to 
         % shockless.fanno_mach(). If inputs are valid, nothing 
         % occurs, if invalid, an error is returned. 
         function [valid_g, valid_D, valid_fr,valid_option,valid_selection]...
                    = arg_3check(spec_heat_ratio,duct_diameter,...
                                friction_factor,option,varargin)
            if (isa(spec_heat_ratio,'double') && ...
                all(spec_heat_ratio(:) >= 1) && ...
                isreal(spec_heat_ratio) && ... 
                isequal(size(spec_heat_ratio),[1 1]))
                valid_g = spec_heat_ratio; 
            else 
                error("Invalid specific heat ratio");
                return; 
            end
            if (isa(duct_diameter,'double') && ...
                all(duct_diameter(:) > 0) && ...
                isreal(duct_diameter) && ... 
                isequal(size(duct_diameter),[1 1]))
                valid_D = duct_diameter; 
            else 
                error("Invalid duct diameter");
                return; 
            end
            if (isa(friction_factor,'double') && ...
                all(friction_factor(:) > 0) && ...
                isreal(friction_factor) && ... 
                isequal(size(friction_factor),[1 1]))
                valid_fr = friction_factor; 
            else 
                error("Invalid friction factor");
                return; 
            end
            baseOptions = {'plot','calc'};
            if ((isa(option,'char') || ...
                isa(option,'string')) && ...
                (ismember({option},baseOptions) == 1))
                valid_option = option;
            else 
                error('Option does not exist');
                return;
            end 
            if (option == 'plot')
                baseSelections = {'sl'}; 
                % TODO: Add ismember function 
                valid_selection = {}; 
            end 
            if (option == 'calc')
                baseSelections = {'gl','sl'}; 
                % TODO: Add ismember function
                valid_selection = {};
            end 

         end 
    end 
end 
 
 