Compressible-Flow Relations 
==========

.. raw:: html

   <dl class="py class">
   <dt class="sig sig-object py" id="shockless">
   <em class="property"><span class="pre">class</span><span class="w"> </span></em><span class="sig-name descname"><span class="pre">shockless</span>          </span>
   <a class="reference internal" href="https://cflo.readthedocs.io/en/latest/doc_code/source_shockless.html">
   <span class="viewcode-link">[source]</span></a>
   <a class="headerlink" href="#shockless" title="Permalink to this definition">
    </a></dt>
   <dd></dd></dl>

**Sonic Pressure Ratios**

.. raw:: html 

      <table style="border: 1px solid #dedede; text-align: center; margin: auto;">
         <tr style="border: 1px solid #dedede; width: 100px; height: 70px; background-color: #e9e9e9;">
            <td style="padding: 24px;">Isentropic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{p}{p^{*}}%20=%20\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{\frac{-\gamma}{\gamma%20-%201}}"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0.05);">
            <td style="padding: 24px;">Adiabatic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{p}{p^{*}}%20=%20\frac{1}{M}\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{-\frac{1}{2}}}" style="height: 48px;"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0);">
            <td style="padding: 24px;">Frictionless-Reversible Heat Transfer</td>
            <td style="padding: 16px;"><img src="https://latex.codecogs.com/svg.image?\small%20\boldsymbol{\frac{p}{p^{*}}%20=%20\frac{1+\gamma}{1%20+%20\gamma%20M^{2}}}" style="height: 44px;"></td>
         </tr> 
      </table><br>
      
===========================================================================================================================================

**Sonic Density Ratios**

.. raw:: html 

      <table style="border: 1px solid #dedede; text-align: center; margin: auto;">
         <tr style="border: 1px solid #dedede; width: 100px; height: 70px; background-color: #e9e9e9;">
            <td style="padding: 24px;">Isentropic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{\rho}{\rho^{*}}%20=%20\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-1}{2}M^{2}\right)\right]^{\frac{-1}{\gamma%20-%201}}}"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0.05);">
            <td style="padding: 24px;">Adiabatic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{\rho}{\rho^{*}}%20=%20\frac{1}{M}\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{1/2}}" style="height: 48px;"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0);">
            <td style="padding: 24px;">Frictionless-Reversible Heat Transfer</td>
            <td style="padding: 16px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{\rho}{\rho^{*}}%20=%20\frac{1}{M^{2}}\left(\frac{1%20+%20\gamma%20M^{2}}{1%20+%20\gamma}\right)}" style="height: 44px;"></td>
         </tr> 
      </table><br>
      
===========================================================================================================================================

**Sonic Temperature Ratios**

.. raw:: html 

      <table style="border: 1px solid #dedede; text-align: center; margin: auto;">
         <tr style="border: 1px solid #dedede; width: 100px; height: 70px; background-color: #e9e9e9;">
            <td style="padding: 24px;">Isentropic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{T}{T^{*}}%20=%20\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{-1}}"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0.05);">
            <td style="padding: 24px;">Adiabatic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{T}{T^{*}}%20=%20\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{-1}}" style="height: 48px;"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0);">
            <td style="padding: 24px;">Frictionless-Reversible Heat Transfer</td>
            <td style="padding: 16px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{T}{T^{*}}%20=%20\left[\frac{M(1+\gamma)}{1%20+%20\gamma%20M^{2}}\right]^{2}}" style="height: 44px;"></td>
         </tr> 
      </table><br>
      
===========================================================================================================================================

**Sonic Total-Pressure Ratios**

.. raw:: html 

      <table style="border: 1px solid #dedede; text-align: center; margin: auto;">
         <tr style="border: 1px solid #dedede; width: 100px; height: 70px; background-color: #e9e9e9;">
            <td style="padding: 24px;">Isentropic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{p_{o}}{p_{o}^{*}}=1}"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0.05);">
            <td style="padding: 24px;">Adiabatic</td>
            <td style="padding: 10px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{p_{o}}{p_{o}^{*}}=\frac{1}{M}\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{\frac{\gamma%20+%201}{2(\gamma%20-%201)}}}" style="height: 48px;"></td>
         </tr>
         <tr style="border: 1px solid #dedede; width: 450px; height: 70px; background-color: rgba(0,0,0,0);">
            <td style="padding: 24px;">Frictionless-Reversible Heat Transfer</td>
            <td style="padding: 16px;"><img src="https://latex.codecogs.com/svg.image?\boldsymbol{\frac{p_{o}}{p_{o}^{*}}=\frac{1%20+%20\gamma}{1%20+%20\gamma%20M^{2}}\left[\left(\frac{2}{\gamma%20+%201}\right)\left(1%20+%20\frac{\gamma%20-%201}{2}M^{2}\right)\right]^{\frac{\gamma}{\gamma%20-%201}}}" style="height: 44px;"></td>
         </tr> 
      </table><br><br>
      
.. raw:: html 

   <dl class="py class">
   <dt class="sig sig-object py" id="normal_shock">
   <em class="property"><span class="pre">class</span><span class="w"> </span></em><span class="sig-name descname"><span class="pre">normal_shock</span> </span>
   <a class="reference internal" href="https://cflo.readthedocs.io/en/latest/doc_code/source_normal_shock.html">
   <span class="viewcode-link">[source]</span></a>
   <a class="headerlink" href="#normal_shock" title="Permalink to this definition"></a></dt>
   <dd></dd></dl>
   

