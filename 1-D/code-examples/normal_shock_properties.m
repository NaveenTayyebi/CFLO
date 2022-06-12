%% Normal Shock Mach Number & Fluid Property Ratios
% Functions f1_1 and f1_2 make up the piecewise solution to the Mach 
% number downstream of any point in a steady 1-D flow. 
% Functions f2, f3, f4, and f5 correspond to the Static Temperature,
% Static Density, Static Pressure, and Total Pressure Ratio across a 
% a normal shock. 
% The constant g is the speicifc heat ratio. 
function normal_shock_properties(specHeatRatio,machRange,varargin)
    syms x 
    figNumber = 1; 
    firstIter = 1;

    switch nargin
        case 0
            g = 1.4; 
            range = [1 10]; 
            property = ['p'];
        case 1
            if (isa(specHeatRatio,'double'))
                g = specHeatRatio; 
            else 
                error('Specific Heat ratio must be of type "double"'); 
            end 
            range = [1 10]; 
            property = ['p'];
        case 2 
            g = specHeatRatio; 
            range = machRange;
            property = ['p'];
        otherwise 
            g = specHeatRatio;
            range = machRange; 
            property = varargin(1,:); 
    end 
    disp(property{1})
    for num = firstIter:length(property)
        switch property{num}
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
                error('Make sure plot abbreviation is correct'); 
        end 
        figNumber = figNumber + 1; 
    end 
end 
 
 