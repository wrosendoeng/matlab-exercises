function ralston(n,h,x0,y0)
    %Initial values of x,y.
    x(1) = x0; 
    y(1) = y0;
    iter(1) = 1;
    
    %For-loop to calculate n, x, y. (Ralston`s method)
    for i = 1:n
        k1 = h*model(x(i),y(i));
        k2 = h*model(x(i)+2*h/3,y(i)+2*k1/3);
        y(i+1) = y(i) + 0.25*(k1+3*k2);
        x(i+1) = x(i) + h;
        iter(i+1) = iter(i) + 1;
    end
    
    %Transposing line-vectors to column-vectors
    iter = transpose(iter);
    x = transpose(x);
    y = transpose(y);
    
    %Concatenating x and y & transforming everything into cell-array
    xytable = horzcat(x,y);
    itercell = num2cell(iter);
    xycell = num2cell(xytable);
    
    %Defining 10 digits in format of x and y
    fun = @(t) sprintf('%1.10f',t);
    xytable = cellfun(fun,xycell,'UniformOutput',0);
    
    %Concatenating horizontally n, x and y
    new_table = horzcat(itercell,xytable);
     
    %Finishing creating a table and storing it in .txt format
    T = cell2table(new_table,'VariableNames',{'n','xn','yn'});
    writetable(T,'ralston.txt','Delimiter','tab');
end
function fun = model(x,y)
    fun = y + exp(-x.^2) + 2;
end 