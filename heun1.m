function heun1(n,h,fun,x0,y0)
    x = x0;
    y = y0;
    
    fun = model(x,y);
    
    disp('   n          x                     y')
    for i = 1:n
        fprintf('   %d          %.10f          %.10f\n',i,x,y);
        y = fun*h/2.0 + y;
        x = x + h;
        fun = model(x,y);
    end 
    
end 