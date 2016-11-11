s1=input('price at time 0 = ');
strike=input('strike= '); 
maturity=input('maturity= ');
volatility=input('volatility= ');
%n=input('时间划分总段数= ');
n=maturity;
option=input('1 for call option,2 for put option; input=');
r=input('interest rate= ');
t=maturity/(n*365);
u=exp(volatility*sqrt(t));d=1/u;
p=(exp(r*t/n)-d)/(u-d);q=(1+r-d)/(u-d);
stock=zeros(n+1,n+1);
stock(1,1)=s1;
call=zeros(n+1,n+1);
put=zeros(n+1,n+1);
syms i j
x=1:1:n+1;
if 1+r<=d|1+r>=u;
   disp('arbitrage')
else
    for i=2:n+1;
        for j=1:i;
            p=s1*(u^(i-j))*(d^(j-1));
            stock(i,j)=p;
        end
    end 
    if option==1;
        for j=1:n+1;
            call(n+1,j)=stock(n+1,j)-strike;
            if call(n+1,j)>0;
                call(n+1,j)=call(n+1,j);
            else
                call(n+1,j)=0;
            end
        end
        for i=n:-1:1;
            for j=1:i;
                call(i,j)=(1/(1+r))*(q*call(i+1,j)+(1-q)*call(i+1,j+1));
            end
        end
        call
    else
        if option==2;
            for j=1:n+1;
                put(n+1,j)=strike-stock(n+1,j);
                if put(n+1,j)>0;
                    put(n+1,j)=put(n+1,j);
                else
                    put(n+1,j)=0;
                end
            end
            for i=n:-1:1;
                for j=1:i;
                    put(i,j)=(1/(1+r))*(q*put(i+1,j)+(1-q)*put(i+1,j+1));
                end
            end
            put
        else
            disp('Error')
        end
    end
end


    
            
            
                
                
                
                    
                    
            
            
                

            
          
            
                
            
            