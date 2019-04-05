xstart = 10;
ystart = 1;

A = 1; B = 0.1; C = 1; D = 0.1;

n = 100000; h = 0.0001;

xans = double.empty; yans = double.empty;

xcurr = xstart; ycurr = ystart;

xans(1) = xstart; yans(1) = ystart;

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

plot(xans, yans)