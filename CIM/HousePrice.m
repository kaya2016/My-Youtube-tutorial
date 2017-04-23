%% Necessary/Sufficient coonditions for Unconstrained problem 
%  the first and second derivatives  of the function
% ddefining x as a symbolic object
syms x f
f = 0.0076*x^4 - 0.2165* x^3 + 1.8017*x^2-3.5454*x + 18.081;
% The first derivative
d1f = diff(f);
% The second derivative 
d2f = diff(f,2);

[xs] = vpasolve(d1f,x,[1 12]);

for i = 1:length(xs)
    d2f_val =subs(d2f,xs(i));
    if d2f_val>0
            fprintf('The solution (x*): %4.2f is a minmum \n',xs(i));
    elseif d2f_val<0
            fprintf('The solution (x*): %4.2f is a maximum \n',xs(i));
    else
            fprintf('The solution (x*): %4.2f is a saddel point \n',xs(i));
    end
            
end
%% plot the function and the derivatives 
subplot(3,1,1)
h1 = ezplot(f,[1 12]); % plot f between 0 and 12
hold on

% Plot the tangent in three different places
% The first place
xp = 4.0;		    % Choose point at which the derivative will be computed
fp =subs(f,xp);		% function value at xp
m = subs(d1f,xp)    % find the slope at xp
% plot the tagent y-y1 = m(x-x1)
x1 = xp-0.7;
x2 = xp+0.7;
f1 =  fp-m*(xp-x1) 
f2 =  m*(x2-xp) +fp
line([x1 x2],[f1,f2],'Color','k', ...
   'LineStyle','--','LineWidth',2)
text(x2,f2,'tangent')

% The second Tangent
fp1 =subs(f,xs(1));	
line([xs(1)-.7 xs(1)+.7],[fp1,fp1],'Color','k', ...
   'LineStyle','--','LineWidth',2)
% The third Tangent
fp2 = subs(f,xs(2));
line([xs(2)-.7 xs(2)+.7],[fp2,fp2],'Color','k', ...
   'LineStyle','--','LineWidth',2)
title('Function f')

subplot(3,1,2)
h2 = ezplot(d1f,[1 12]);
hold on 

% draw a line at value of 0 for reference
line([1 12],[0 0],'Color','g','LineWidth',1)
hold off
title('The first derivative of function f')
subplot(3,1,3)
h3 = ezplot(d2f,[1 12]);
hold on
d2f1 = subs(d2f,xs(1));
d2f2 = subs(d2f,xs(2));
plot(xs(1),d2f1,'rx','MarkerSize',12)
plot(xs(2),d2f2,'rx','MarkerSize',12)
hold off
title('The second derivative of function f')

%% The Method of close interval
x1 = 1;
x2 =6;
syms x 
fun = @(x)0.0076*x^4 - 0.2165* x^3 + 1.8017*x^2-3.5454*x + 18.081;
xs = fminbnd(@(x)-fun(x),x1,x2);
fprintf('The solution (x*): %4.2f is a maximum \n',xs);
%% plot the function and the derivatives 
subplot(3,1,1)
h1 = ezplot(f,[1 6]); % plot f between 0 and 12
hold on
% plot the tagent y-y1 = m(x-x1)
title('Function f')


subplot(3,1,2)
h2 = ezplot(d1f,[1 6]);
hold on 

% draw a line at value of 0 for reference
line([1 6],[0 0],'Color','g','LineWidth',1)
hold off
title('The first derivative of function f')

