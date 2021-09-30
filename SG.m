clc
close all
clear all
%% shape parameters
p = [30];   % super gaussian  distribution 

R = -2:0.01:2;

    
% Super gaussian
 for  i =1:length(p)
    for j = 1:length(R)
        
        R0 =1;
         
         IG(i,j) = (4^(1/p(i)))*p(i)/(2*pi*R0^2*gamma(2/p(i)));
         IGG(i,j) = IG(i,j)*exp(-2*(R(j)/R0)^p(i));
    end
end
figure(3)
% imagesc(R,IGG);
plot(R,IGG);
xlabel('distance [mm]');
ylabel('Intensity');
title('Super gaussian distribution');
% legend('p = 2','p = 4','p =8','p = 12','p=30');
 