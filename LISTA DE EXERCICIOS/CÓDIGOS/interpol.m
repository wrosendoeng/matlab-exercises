function result = interpol(n,x0,x1,dx)

    x = (x0:dx:x1)'; %Column-vector of elements   
    y = f(x);
    pol = polyfit(x,y,n); %Polynomial fitting (5-th order)
    p = polyval(pol,x); %Polynomial value    
    
    t1 = table(x,y,p,abs(p-y),'VariableNames',{'x','y(x)','p_n(x)','FitError'}); 
    t2 = sortrows(t1,{'FitError'},{'ascend'});
    result = t2(1:6,:);
    writetable(result,'interpolation.txt','Delimiter',',')
end
function y = f(x)
    y = cos(x.^2) + x.^2 + exp(-x.^4); %Respective function
end 