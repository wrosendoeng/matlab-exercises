function ml_test(x)
    a = sqrt(400-x.^2);
    b = sqrt(900-x.^2);
    
    y1 = a.*b;
    y2 = 8*(a+b);
    plot(x,y1-y2,'r')
    grid on
end 