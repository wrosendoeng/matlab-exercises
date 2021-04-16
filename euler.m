function euler_method(n,h,x0,y0)
    %Initial values of x,y.
    x(1) = x0; 
    y(1) = y0;
    iter(1) = 1;
    
    %For-loop to calculate n, x, y and printing them on screen.
    for i = 1:n        
        y(i+1) = model(x(i),y(i))*h + y(i); % Euler's method
        x(i+1) = x(i) + h; % Step of variable
        iter(i+1) = iter(i) + i;
    end
    
    T = table(iter,x,y);
    writetable(T,'euler.txt','Delimiter',' ')
end 