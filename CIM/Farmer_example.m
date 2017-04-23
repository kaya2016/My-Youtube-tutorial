%% Farmer Example: 
% A farmer has 2400 ft of fencing and wants to fence o? a rectangular ?eld 
% that borders a straight river. He needs no fence along the river.
% What are the dimensions of the ?eld that has the largest area?

%% the Constrained Optimization: 
%   xs = fminbnd(fun,x1,x2);

% fun: Function handle
fun = @(x)2400*x-2*x^2;

x1= 0;
x2= 1200;

xs = fminbnd(@(x) -fun(x),x1,x2);

fprintf('x* = %4.2f is a maximum\n',xs);

%% plot the function and the derivatives 
syms x f
f = 2400*x-2*x^2;
% The first derivative
d1f = diff(f);
figure()
subplot(2,1,1)
h1 = ezplot(f,[0 1200]); % plot f between 0 and 12
hold on
% plot the tagent y-y1 = m(x-x1)
title('Function f')

subplot(2,1,2)
h2 = ezplot(d1f,[0 1200]);
hold on 

% draw a line at value of 0 for reference
line([0 1200],[0 0],'Color','g','LineWidth',1)
hold off
title('The first derivative of function f')