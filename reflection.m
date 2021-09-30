clear all; 
close all;
clc;
%% Initializing display Matrices
H = 1920; V = 1080; 
x = -H/2:1:(H/2-1); 
y = -V/2:1:(V/2-1);
x = x*7.56e-3; 
y = y*7.56e-3; 
[X,Y] = meshgrid(x, y);
%% define Parameters
r=sqrt((X).^2+(Y).^2);
% r1=500;
r2= 3; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=20;
nx=10*7.56e-3;
x0 = 0;     		% center
y0 = 0;  
A=1;
B=0.4;
sigma = 3; 
sigma1= sigma./1.5;
% nx=0.0003;
%%
%A1=-exp(((2*r).^n)/(r2.^n));
% A1=exp((1+(r/r2).^n).^-1);
% res1 = ((X-x0).^n + (Y-y0).^n)./(2*sigma^n);
res1 = ((r).^n)./(2*sigma^n);
res2 = ((r).^2)./(2*sigma1^2);
 A1=A*exp(-res1);
 B1=B*exp(-res2);
% A1=exp(1+(r/r2).^n);
R=A1./B1;
R1=sqrt(R);
figure(1);
% set(gca,'position',[0 0 1 1],'Visible','off')
fig=imagesc(A1);
axis off;axis equal;
% colormap gray
figure(2);
imagesc(B1);
axis off;axis equal;
%%
figure(3);
imagesc(R1);
axis off;axis equal;
%%
x1 = [0 size(A1,2)];
y1 = [size(A1,1)/2 size(A1,1)/2];
c1 = improfile(A1,x1,y1);
figure(4);
plot(c1);
% axis equal;
figure(5);
imagesc(A1);
colormap gray
axis off;
figure(6);
imagesc(B1);
colormap gray
axis off;
%%
x2 = [0 size(B1,2)];
y2 = [size(B1,1)/2 size(B1,1)/2];
c2 = improfile(B1,x2,y2);
figure(7);
plot(c2);
% axis equal;
figure(8);
imagesc(R1);
colormap gray
axis off;
%%
x3 = [0 size(R1,2)];
y3 = [size(R1,1)/2 size(R1,1)/2];
c3 = improfile(R1,x3,y3);
figure(9);
plot(c3);
%%
w=abs((1/pi).*asin(abs(R1)));
P=(1/pi).*imag(R1);
z=cos((2*pi*X/nx)+ pi.*P)-cos(pi*w);
% z=cos((2*pi*X/nx));
H = 0.5.*(1+sign(z));
% H=sign(z);
% DMD = H/max(H(:))*255;
% size(1920,1080);
% D=imagesc(real(H));
D1=imresize((H),[1080 1920]);
% set(gca,'position',[0 0 1 1],'Visible','off')
%%
% C = ((X.^n)+(Y.^n))< 0.3; %rectangular aperture
 C = sqrt((X).^2+(Y).^2)<0.3; %Circular aperture
cap = D1.*C; %Creating Diffraction Pattern
%%
figure(10);
imagesc(cap);
% imagesc(D1);
colormap gray
axis off;