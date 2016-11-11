#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 10 10:51:33 2016

@author: Pari
"""

#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 10 10:44:13 2016

@author: Pari
"""

""" 
function calculate the vanilla option price(VOP) based on passed parameter: 
    for call:
        pass 'VC'
    for put:
        pass 'VP'
    default option value set to VOP = VC
other parameters: 
    S = stock price
    K = strike
"""
function =  getCallOrPut(S, K, VOP = 'VC')
    if VOP == 'VC'
       val = (S-K);
    if VOP == 'VP'
       val = (K-S);
    else
       disp('Error');
    end
        
        
funtion = getOptionPrice(S0, K, r, v, n, T, VOP = 'VC'):
    op = VOP;
    u = exp(volatility*sqrt(t));
    p=(exp(r*t/n)-d)/(u-d);
    q=(1+r-d)/(u-d);
    d=1/u;

    stock=zeros(n+1,n+1);
    stock(1,1)=s1;
    call=zeros(n+1,n+1);
    put=zeros(n+1,n+1);

    syms i j
    x = 1:1:n+1;
    if (1+r <= d | 1+r >= u);
       disp('This model has arbitrage')
    else
        for i = 2:n+1;
            for j = 1:i;
                p = s1*(u^(i-j))*(d^(j-1));
                stock(i,j) = p;
            end
        end 
    for j=1:n+1;
        optionVal(n+1,j) = function(S, K, op);
        if optionVal(n+1,j) > 0;
           optionVal(n+1,j) = optionVal(n+1,j);
        else
           optionVal(n+1,j) = 0;
        end
    end
    for i=n:-1:1;
        for j=1:i;
            optionVal(i,j) = (1/(1+r))*(q* optionVal(i+1,j)+(1-q)*optionVal(i+1,j+1));
        end
    end

    
            
            
                
                
                
                    
                    
            
            
                

            
          
            
                
            
            