function result = linearcomb01(n,x0,x1,dx)

    x = (x0:dx:x1); %Column-vector of elements   
    y = f(x);
    pol = polyfit(x,y,n); %Polynomial fitting (6-th order)    
    
    A = ["a1","a2","a3","a4","a5","a6"]';
    varNames=cellstr(A);
    result = table(pol','RowNames',varNames);
    result.Properties.VariableNames{'Var1'} = 'Coefficients';
    writetable(result,'linearcomb01.txt','Delimiter',',')
end
function y = f(x)
    y = cos(-x.^2) + 2*sin(x); %Respective function
end 