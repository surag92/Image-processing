clear all; 
close all;
%% Initializing display Matrices
H = 1920; V = 1080; %%Number of Horizontal and Vertical pixels
x = -H/2:1:(H/2-1); 
y = -V/2:1:(V/2-1);
x = x*8e-3; 
y = y*8e-3; 
[X,Y] = meshgrid(x, y);
%% define Parameters
lambda = 633e-6; % Wavelength in mm
r=sqrt(X.^2+Y.^2);
w0= 1;
wz=15;
n=8;
%%
I= ((w0/wz).^2)*exp((-2*r.^2)/(wz.^2));
Is=exp((((-2*r)/(wz)).^2*n));

x1 = [0 size(Is,2)];
y1 = [size(Is,1)/2 size(Is,1)/2];
c1 = improfile(Is,x1,y1);
figure(1);
% subplot(2,1,1);
imagesc(abs(Is))
colormap gray;
axis off;
% grid on;
% hold on;
% subplot(2,1,2);
% plot(-c1(:,1,1),'b')