Source code for normal_shock

.. code:: matlab 

  %% Normal Shock Mach Number & Fluid Property Ratios
  classdef normal_shock
      methods(Static)
          % Plots speicified normal shock relations for a given specific 
          % heat ratio and range of Mach numbers
          function upstream_ref_plot(specHeatRatio,machRange,varargin)
              syms x
              figNumber = length(findobj('type','figure')) + 1;
              [g, range, prop] = ...
                  normal_shock.arg_check(specHeatRatio,machRange,varargin);
              for num = 1:length(prop{1})
                  switch prop{1}{num}
                      case 'p'
                          figure(figNumber)
                          f = 1 + (2*g)/(g+1)*(x^2-1); 
                          fplot(f,range,'linewidth',1,'color','#D95319');
                           xlabel('Upstream Mach Number ( M_{1} )');
                           ylabel('p_{2} / p_{1}');
                           title('Pressure Ratio'); 
                       case 'T'
                          figure(figNumber)
                          f = (1 + (2*g)/(g+1)*(x^2-1))*...
                                  ((2 + (g-1)*x^2)/((g+1)*x^2));
                          fplot(f,range,'linewidth',1,'color','red');
                          xlabel('Upstream Mach Number ( M_{1} )');
                          ylabel('T_{2} / T_{1}'); 
                          title('Temperature Ratio');
                       case 'd' 
                          figure(figNumber)
                          f = ((g+1)*x^2)/(2 + (g-1)*x^2); 
                          fplot(f,range,'linewidth',1,'color','blue');
                          xlabel('Upstream Mach Number ( M_{1} )');
                          ylabel('\rho_{2} / \rho_{1}'); 
                          title('Density Ratio');
                       case 'M' 
                          figure(figNumber)
                          f = (1 + (g-1)/2*x^2)^(1/2)/(g*x^2-(g-1)/2)^(1/2); 
                          fplot(f,range,'linewidth',1,'color','red');
                          ylim([0 1.5]);
                          xlabel('Upstream Mach Number ( M_{1} )');
                          ylabel('Downstream Mach Number ( M_{2} )');
                          title('Mach Number across a Normal Shock');
                       case 'tp'
                          figure(figNumber)
                          f = ((g + 1)*x^2/(2 + (g-1)*x^2))^(g/(g-1))...
                                  *((g + 1)/(2*g*x^2 - (g-1)))^(1/(g-1));
                          fplot(f,range,'linewidth',1,'color','#77AC30');
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
           % Returns normal shock propery ratios for a given specific heat 
           % ratio and upstream Mach number
          function computedValue = upstream_ref_calc(specHeatRatio, ...
                  machNumber,property) 
              syms x
              [g, mach] = normal_shock.arg_2check(specHeatRatio,machNumber); 
              prop = property; 
                  switch prop
                      case 'p'
                          f = 1 + (2*g)/(g+1)*(x^2-1); 
                          computedValue = eval(subs(f,x,mach));
                      case 'T'
                          f = (1 + (2*g)/(g+1)*(x^2-1))*...
                                  ((2 + (g-1)*x^2)/((g+1)*x^2));
                          computedValue = eval(subs(f,x,mach));
                      case 'd' 
                          f = ((g+1)*x^2)/(2 + (g-1)*x^2); 
                          computedValue = eval(subs(f,x,mach));
                      case 'M'
                          f = (1 + (g-1)/2*x^2)^(1/2)/(g*x^2-(g-1)/2)^(1/2);
                          computedValue = eval(subs(f,x,mach));
                      case 'tp'
                          f = ((g + 1)*x^2/(2 + (g-1)*x^2))^(g/(g-1))...
                                  *((g + 1)/(2*g*x^2 - (g-1)))^(1/(g-1));
                          computedValue = eval(subs(f,x,mach));
                      otherwise
                          error('Plot abbreviation does not exist'); 
                          return; 
                  end 
          end 
      end
      methods(Static,Access = private)
          % Checks for valid specific heat ratio, range of mach numbers, 
          % and plots requested to normal_shock.plot(). If values are 
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
                          valid_prop = {'p'};
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
                          all(machRange(:) >= 1) && ...
                          isreal(machRange) && ... 
                          isequal(size(machRange),[1 1]))
                          valid_range = machRange; 
                      else 
                          error("Invalid mach range");
                          return; 
                      end
                      valid_prop = {'p'};
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
                          all(machRange(:) >= 1) && ...
                          isreal(machRange) && ... 
                          isequal(size(machRange),[1 2]))
                          valid_range = machRange; 
                      else 
                          error("Invalid mach range");
                          return; 
                      end
                      baseProp = {'p','d','T','tp','M'};
                      valid_prop = cell(1,length(varargin));
                      for val = 1:length(varargin)
                          if ((isa(varargin{val}{1},'char') || ...
                              isa(varargin{val}{1},'string')) && ...
                            (all(ismember(varargin{val},baseProp) == 1) > 0))
                              valid_prop{val} = varargin{val};
                          else 
                              error('Property abbreviations do not exist');
                              return;
                          end 
                      end
              end 
          end
          % Checks for valid specific heat ratio and mach number 
          % requested to normal_shock.upstream_ref_calc(). If values 
          % are valid, nothing occurs. If values are invalid, an error 
          % is returned.
          function [valid_g, valid_mach] ...
                   = arg_2check(specHeatRatio,machNumber) 
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
                  all(machNumber(:) >= 1) && ...
                  isreal(machNumber) && ... 
                  isequal(size(machNumber),[1 1]))
                  valid_mach = machNumber;  
              else 
                  error("Invalid mach number");
                  return; 
              end 
          end 
      end
  end 
 
 
