function [fitresult, gof, T] = linearcomb(x, y)
[xData, yData] = prepareCurveData( x, y );
format long
% Set up fittype and options.
ft = fittype( 'a + b*x + c*sin(x) + d*cos(x) + e*(x.^2+1) + f*(x.^3-x)', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares','MaxIter',128);
opts.Display = 'notify';
opts.StartPoint = [0.850264065252952 0.355906132942169 0.799303494796835 0.957166948242946 0.141886338627215 0.421761282626275];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'fit teste0' );
h = plot(fitresult, xData, yData );
legend( h, 'y vs. x', 'fit teste0', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'y', 'Interpreter', 'none' );
grid on

vector = coeffvalues(fitresult)';
T = table(vector,'RowNames',{'a1','a2','a3','a4','a5','a6'});
end 


