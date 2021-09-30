period = 16; %period of fringe
u =0*pi/4; v =2*pi/period; A=255;B=0;C=A-B;

fringe1 = (C/255)*sin_wave(u,v,-2*pi/3)+B/255; 
fringe2 = (C/255)*sin_wave(u,v,0)+B/255; 
fringe3 = (C/255)*sin_wave(u,v,pi*2/3)+B/255;
%% Changing BW to color
fringe1(:,:,2) = 0;
fringe1(:,:,3) = 0;
fringe2(:,:,2) = fringe2;
fringe2(:,:,1) = 0;
fringe2(:,:,3) = 0;
fringe3(:,:,3) = fringe3;
fringe3(:,:,1) = 0;
fringe3(:,:,2) = 0;
%%
figure(1);imshow(fringe1); 
figure(2);imshow(fringe2); 
figure(3);imshow(fringe3); 
imwrite(fringe1,'G:\f116.bmp');
imwrite(fringe2,'G:\f216.bmp'); 
imwrite(fringe3,'G:\f316.bmp');




function output = sin_wave(u,v,phi) 
k = 12;
% s = pi*(45)/180; % shift angle
s = k*(2*pi/64)/4;
for m = 1:1080
    for n = 1:1920
            temp(m,n) = (1+cos(u*m+v*n+phi+s))/2;
    end
end
output = temp; 
end
