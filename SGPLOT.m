clc
close all
clear all
%% Initializing display Matrices
H = 1920; V = 1080; 
x = -H/2:1:(H/2-1); 
y = -V/2:1:(V/2-1);
x = x*7.56e-3; 
y = y*7.56e-3; 
[X,Y] = meshgrid(x, y);
%%
% shape parameters

p = 2;
% p = [2 4 8 12 30];   % super gaussian  distribution 
N = [0 1 5 10 49];   % flattened gaussian distribution 
R = -2:0.01:2;
R00 = 1;
R01 = -1;
    

% Super gaussian
 for  i =1:length(p)
  
        
        R0 =1;
         
         IG(i) = (4.^(1/p(i)))*p(i)/(2*pi*R0.^2*gamma(2/p(i)));
         IGG(i) = IG(i).*exp(-2*(R/R0).^p(i));

end
figure(1)
plot(R,IGG);
xlabel('Cross sectional distance [mm]');
ylabel('Output irradiance');
title('Super gaussian distribution');
legend('p = 2','p = 4','p =8','p = 12','p=30');
figure(2)
imagesc(IGG);
axis off;
colormap;
title('Super gaussian Profile');