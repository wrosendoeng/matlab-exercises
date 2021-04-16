function euler1(n,h,fun,x0,y0)
    %Initial values of x,y.
    x = x0; 
    y = y0;
    %Printing the label of table.
    disp('   n          x                     y')
    %For-loop to calculate n, x, y and printing them on screen.
    for i = 1:n
        fprintf('   %d          %.10f          %.10f\n',i,x,y);
        y = fun*h/1.0 + y;
        x = x + h;
        fun = model(x,y);
    end    
end 