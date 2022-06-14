%% Normal Shock Mach Number & Fluid Property Ratios
% Functions f1_1 and f1_2 make up the piecewise solution to the Mach 
% number downstream of any point in a steady 1-D flow. 
% Functions f2, f3, f4, and f5 correspond to the Static Temperature,
% Static Density, Static Pressure, and Total Pressure Ratio across a 
% a normal shock. 
% The constant g is the speicifc heat ratio. 
classdef normal_shock
    methods(Static)

         function plot(specHeatRatio,machRange,varargin)
            syms x
            figNumber = 1;
            [g, range, property] = ...
                normal_shock.argCheck(specHeatRatio,machRange,varargin);
            for num = 1:length(property{1})
                switch property{1}{num}
                    case 'p'
                        figure(figNumber)
                        f4 = 1 + (2*g)/(g+1)*(x^2-1); 
                        fplot(f4,range,'linewidth',1,'color','#D95319');
                         xlabel('Upstream Mach Number ( M_{1} )');
                         ylabel('p_{2} / p_{1}');
                         title('Pressure Ratio'); 
                     case 'T'
                        figure(figNumber)
                        f2 = (1 + (2*g)/(g+1)*(x^2-1))*...
                                ((2 + (g-1)*x^2)/((g+1)*x^2));
                        fplot(f2,range,'linewidth',1,'color','red');
                        xlabel('Upstream Mach Number ( M_{1} )');
                        ylabel('T_{2} / T_{1}'); 
                        title('Temperature Ratio');
                     case 'd' 
                        figure(figNumber)
                        f3 = ((g+1)*x^2)/(2 + (g-1)*x^2); 
                        fplot(f3,range,'linewidth',1,'color','blue');
                        xlabel('Upstream Mach Number ( M_{1} )');
                        ylabel('\rho_{2} / \rho_{1}'); 
                        title('Density Ratio');
                     case 'M' 
                        figure(figNumber)
                        f1_1 = x; 
                        f1_2 = (1 + (g-1)/2*x^2)^(1/2)/(g*x^2-(g-1)/2)^(1/2); 
                        fplot(f1_1,[0 1],'linewidth',1,'color','red');
                        hold on 
                        fplot(f1_2,range,'linewidth',1,'color','red'); 
                        ylim([0 1.5]);
                        xlabel('Upstream Mach Number ( M_{1} )');
                        ylabel('Downstream Mach Number ( M_{2} )');
                        title('Mach Number across a Normal Shock');
                     case 'tp'
                        figure(figNumber)
                        f5 = ((g + 1)*x^2/(2 + (g-1)*x^2))^(g/(g-1))...
                                *((g + 1)/(2*g*x^2 - (g-1)))^(1/(g-1));
                        fplot(f5,range,'linewidth',1,'color','#77AC30');
                        xlabel('Upstream Mach Number ( M_{1} )');
                        ylabel('p_{o_{2}} / p_{o_{1}}');
                        title('Total Pressure Ratio');
                      otherwise
                         error('Plot abbreviation does not exist'); 
                         return; 
                end 
                figNumber = figNumber + 1; 
            end 
         end

         function [g, range, property] = argCheck(specHeatRatio,machRange,varargin)
            switch nargin
                case 0
                    disp('Case One');
                    error('Specific heat ratio not defined');
                    return;
                case 1
                    disp('Case Two');
                    if (isa(specHeatRatio,'double') && ...
                        all(specHeatRatio > 0) && ...
                        isreal(specHeatRatio) && ... 
                        isequal(size(specHeatRatio),[1 1]))
                        g = specHeatRatio; 
                    else 
                        error("Invalid specific heat ratio");
                        return; 
                    end 
                        range = [1 10]; 
                        property = {'p'};
                 case 2 
                    disp('Case Three');
                    if (isa(specHeatRatio,'double') && ...
                        all(specHeatRatio > 0) && ...
                        isreal(specHeatRatio) && ... 
                        isequal(size(specHeatRatio),[1 1])) 
                        g = specHeatRatio; 
                    else 
                        error("Invalid specific heat ratio");
                        return; 
                    end 
                    if (isa(machRange,'double') && ...
                        all(machRange >= 1) && ...
                        isreal(machRange) && ... 
                        isequal(size(machRange),[1 1]))
                        range = machRange; 
                    else 
                        error("Invalid mach range");
                        return; 
                    end
                    property = {'p'};
                otherwise 
                    disp('Case Four');
                    if (isa(specHeatRatio,'double') && ...
                        all(specHeatRatio > 0) && ...
                        isreal(specHeatRatio) && ... 
                        isequal(size(specHeatRatio),[1 1])) 
                        g = specHeatRatio; 
                    else 
                        error("Invalid specific heat ratio");
                        return; 
                    end 
                    if (isa(machRange,'double') && ...
                        all(machRange >= 1) && ...
                        isreal(machRange) && ... 
                        isequal(size(machRange),[1 2]))
                        range = machRange; 
                    else 
                        error("Invalid mach range");
                        return; 
                    end
                    baseProp = {'p','d','T','tp'};
                    property = cell(1,length(varargin));
                    for val = 1:length(varargin)
                        if ((isa(varargin{val}{val},'char') || ...
                            isa(varargin{val}{val},'string')) && ...
                            (ismember(varargin{val}(val),baseProp) == 1))
                            property{val} = varargin{val};
                        else 
                            error('Property abbreviations do not exist');
                            return;
                        end 
                    end
                end 
         end

    end
end 
 
 