A = 1; B = 1; C = 1; D = 1; E = 1; F = 1; G = 1;
xstart = 4; ystart = 2; zstart = 1;
n = 1000000; h = 0.00001;

xans = double.empty; yans = double.empty; zans = double.empty;  t = double.empty;
xcurr = xstart; ycurr = ystart; zcurr = zstart;
xans(1) = xstart; yans(1) = ystart; zans(1) = zstart; t(1) = 0;

% Euler's Method
for i = 2:n
   xnext = xcurr + h * (A * xcurr - B * xcurr * ycurr);
   ynext = ycurr + h * (- C * ycurr + D * xcurr * ycurr - E * ycurr * zcurr);
   znext = zcurr + h * (- F * zcurr + G * ycurr * zcurr);
   xans(i) = xnext; yans(i) = ynext; zans(i) = znext;
   xcurr = xnext; ycurr = ynext; zcurr = znext;
end

% Plot x against t and y against t
for i = 2:n
   j = i - 1;
   t(i) = t(j) + h;
end
figure;
plot(t,xans,'linewidth',1.5);
hold on;
plot(t,yans,'linewidth',1.5);
hold on;
plot(t,zans,'linewidth',1.5);
xlabel("Time (t)");
ylabel("Amount (x, y, z)");
legend('show');
legend("Prey","Sub-Predator","Predator")

% Phase-Space plot
figure;
plot3(xans,yans,zans,'linewidth',2);
grid on
xlabel("Prey (x)");
ylabel("Sub-Predator (y)");
zlabel("Predator (z)");
hold on;
plot(xans,yans,'linewidth',2);
legend('show');
legend("3 species", "2 species")