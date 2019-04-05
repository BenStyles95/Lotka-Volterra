A = 1; B = 0.1; C = 1; D = 0.1;
xstart = 10; ystart = 10;
n = 1000; h = 0.01;

xans = double.empty; yans = double.empty;  t = double.empty;
xcurr = xstart; ycurr = ystart;
xans(1) = xstart; yans(1) = ystart; t(1) = 0;

% % Euler's Method
% for i = 2:n
%    xnext = xcurr + h * (A * xcurr - B * xcurr * ycurr);
%    ynext = ycurr + h * (- C * ycurr + D * xcurr * ycurr);
%    xans(i) = xnext; yans(i) = ynext;
%    xcurr = xnext; ycurr = ynext;
% end

% RK4 Method
for i = 2:n
  k1x = h * (A * xcurr - B * xcurr * ycurr);
  k1y = h * (-C * ycurr + D * xcurr * ycurr);
  k2x = h*(A*(xcurr+1/2*h) - B*(xcurr+1/2*h)*(ycurr+1/2*k1x));
  k2y = h*(-C*(ycurr+1/2*k1y) + D*(xcurr+1/2*h)*(ycurr+1/2*k1y));
  k3x = h*(A*(xcurr+1/2*h) - B*(xcurr+1/2*h)*(ycurr+1/2*k2x));
  k3y = h*(-C*(ycurr+1/2*k2y) + D*(xcurr+1/2*h)*(ycurr+1/2*k2y));
  k4x = h*(A*(xcurr+h)-B*(xcurr+h)*(ycurr+k3x));
  k4y = h*(-C*(ycurr+k3y)+D*(xcurr+h)*(ycurr+k3y));
  
  xnext = xcurr + 1/6*k1x + 1/3*k2x + 1/3*k3x + 1/6*k4x;
  ynext = ycurr + 1/6*k1y + 1/3*k2y + 1/3*k3y + 1/6*k4y;
  
  xans(i) = xnext; yans(i) = ynext;
  xcurr = xnext; ycurr = ynext;
end

% Plot independent variables against t
for i = 2:n
   j = i - 1;
   t(i) = t(j) + h;
end
figure;
plot(t,xans)
hold on
plot(t,yans)

% Phase-Space Plot
figure;
plot(xans,yans,'linewidth',3)
title("Phase-Space Plot of Prey vs Predators where A = 1, B = 0.1, C = 1, D = 0.1")
xlabel("Prey")
ylabel("Predators")

% Quiver Plot
figure;
[X,Y]=meshgrid(0:0.2:2,0:0.2:2);
U = (A * X - B * X * Y);
V = (- C * Y + D * X * Y);
quiver(X,Y,U,V);
hold on;
a = double.empty;
for i = 1:11
    a(i) = 1.5;
end
axis tight;
plot(a,Y);
plot(Y,a);