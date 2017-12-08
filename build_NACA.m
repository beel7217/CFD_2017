function [x,y] = build_NACA(m,p,t,c,N)
m = m/100;
p = p/10;
t = t/100;
R = c/2;

%Coordinate transformation to get more panels at the leading and trailing
%edge of the airfoil
num = floor(N/2);
theta = linspace(0,pi,num);
x = c/2 + R*cos(theta);

yt = (t*c/0.2)*(0.2969*sqrt(x/c)-0.126*(x/c)-0.3516*(x/c).^2 +...
    0.2843*(x/c).^3 -0.1036*(x/c).^4);

if p ~= 0
    inds1 = find(x <= p*c);
    inds2 = find(x > p*c);
    x1 = x(inds1);
    x2 = x(inds2);
    yc1 = (m*x1/p^2).*(2*p-(x1/c));
    yc2 = (m*(c-x2)/(1-p)^2).*(1+(x2/c)-2*p);
    yc = [yc2,yc1];
else
    yc = x*0;
end

diff = (yc(2:end)-yc(1:end-1))./(x(2:end)-x(1:end-1));
diff = [0,diff];

squigg = atan(diff);

x_top = x - yt.*sin(squigg);
x_bottom = x + yt.*sin(squigg);
y_top = yc + yt.*cos(squigg);
y_bottom = yc - yt.*cos(squigg);

y = [y_bottom,fliplr(y_top(1:end-1))];
x = [x_bottom,fliplr(x_top(1:end-1))];


end

