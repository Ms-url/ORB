function drawFanXiang(KeyPoints1)


[kr1,~]=size(KeyPoints1);
for i=1:kr1
    xo = KeyPoints1(i,1);
    yo = KeyPoints1(i,2);
    s_sigma = KeyPoints1(i,5);
    siat = KeyPoints1(i,6);
    R = round(3*1.5*s_sigma);
    
    x1 = xo + R*sind(siat);
    y1 = yo + R*cosd(siat);
    
    plot([yo,y1],[xo,x1],'r');
    
%     x2=xo-R:xo+R;
%     y2=(R^2-(x2-xo).^2).^0.5+yo;
%     plot(x2,y2,'r');
    
end


end