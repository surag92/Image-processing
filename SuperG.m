clear all; 
close all;
%% Initializing display Matrices
H = 1920; V = 1080; 
x = -H/2:1:(H/2-1); 
y = -V/2:1:(V/2-1);
x = x*8e-3; 
y = y*8e-3; 
[X,Y] = meshgrid(x, y);
%% define Parameters
% r=sqrt(X.^2+Y.^2);
r=sqrt((X+Y)^2);
r1=3;
r2= r1/1.5;
n=30;
nx=.5;
%%
%A=-exp(((2*r).^n)/(r1.^n));
A1=exp((1+(r/r2).^n).^-1);
figure(1);
fig=imagesc(A1);
axis off;
axis equal;
% set(fig,'Position',[1920 0 1920 1080],'MenuBar','none','ToolBar','none','resize','off');
% set(gca,'position',[0 0 1 1],'Visible','off')
% colormap gray
x1 = [0 size(A1,2)];
y1 = [size(A1,1)/2 size(A1,1)/2];
c1 = improfile(A1,x1,y1);
figure(2);
plot(c1);
% axis equal;
% axis off;
%% 
w=(1/pi)*asin(abs(A1));
% P=(1/pi)*imag(A);
P=1;
z=cos((2*pi*X/nx)+ pi*P)-cos(pi*w);
% H = 0.5*(1+sign(z));
H=0.5+0.5*sign(z);
DMD = H/max(H(:))*255;
figure(3);
D=imagesc(real(DMD));
colormap gray
axis off;
% imwrite(D,'SG.jpg')