clc;    
close all; 
imtool close all;  
clear;  
workspace;  
fontSize = 20;
% Read in image1 into an array.
[rgbImage1, storedColorMap1] = imread('15.jpg'); 

[rows, columns, numberOfColorBands] = size(rgbImage1)
% If it's monochrome (indexed), convert it to color. 
if numberOfColorBands < 3
  uiwait(warndlg('It must be a color image'));
end

% Read in image2 into an array.
[rgbImage2, storedColorMap2] = imread('16.jpg'); 
[rows, columns, numberOfColorBands] = size(rgbImage2)
% If it's monochrome (indexed), convert it to color. 
if numberOfColorBands < 3
  uiwait(warndlg('It must be a color image'));
end

% Read in image3 into an array.
[rgbImage3, storedColorMap3] = imread('17.jpg'); 
[rows, columns, numberOfColorBands] = size(rgbImage3)
% If it's monochrome (indexed), convert it to color. 
if numberOfColorBands < 3
  uiwait(warndlg('It must be a color image'));
end

greenChannel1 = rgbImage1(:, :, 2);
greenChannel2 = rgbImage2(:, :, 2);
greenChannel3 = rgbImage3(:, :, 2);

hg=fspecial('gaussian',[31,31],5);

greenChannel11=imfilter(greenChannel1,hg,'replicate');
greenChannel21=imfilter(greenChannel2,hg,'replicate');
greenChannel31=imfilter(greenChannel3,hg,'replicate');
figure(1)
subplot(2,1,1)

plot(greenChannel1(1, :), 'g', 'LineWidth', 2);
grid on;
hold on;
plot(greenChannel2(1, :), 'g', 'LineWidth', 2);
grid on;
hold on;
plot(greenChannel3(1, :), 'g', 'LineWidth', 2);
grid on;

subplot(2,1,2)
%Plot the green signal

plot(greenChannel11(1, :), 'r', 'LineWidth', 2);
grid on;
hold on
plot(greenChannel21(1, :), 'r', 'LineWidth', 2);
grid on;
hold on
plot(greenChannel31(1, :), 'r', 'LineWidth', 2);
grid on;

title('Color as function of distance along x axis', 'FontSize', fontSize, 'Interpreter', 'None');
xlabel('Distance in Pixels', 'FontSize', fontSize');
ylabel('Gray Levels', 'FontSize', fontSize');
%xlim([0 6000]);
%ylim([-20 20]);
legend('green');
hold on;
