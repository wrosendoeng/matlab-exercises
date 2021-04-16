function T = euler_mpmethod(n,h,x0,y0)
    %Initial values of x,y.
    x(1) = x0; 
    y(1) = y0;
    iter(1) = 1;
    
    %For-loop to calculate n, x, y and printing them on screen.
    for i = 1:n-1        
        k1 = model(x(i),y(i));
        k2 = model(x(i)+h/2,y(i)+k1*h/2);
        y(i+1) = k2*h + y(i); % Euler's Middle Point method
        x(i+1) = x(i) + h; % Step of variable
        iter(i+1) = iter(i)+1;
    end
    
    iter = transpose(iter);
    x = transpose(x);
    y = transpose(y);
    
    xytable = horzcat(x,y);
    itercell = num2cell(iter);
    xycell = num2cell(xytable);
    
    fun = @(t) sprintf('%1.10f',t);
    xytable = cellfun(fun,xycell,'UniformOutput',0);
    
    new_table = horzcat(itercell,xytable);
     
    T = cell2table(new_table,'VariableNames',{'n','xn','yn'});
    writetable(T,'eulermp.txt','Delimiter','tab');  
end
function fun = model(x,y)
    fun = y + exp(-x.^2) + 1;
end 
 