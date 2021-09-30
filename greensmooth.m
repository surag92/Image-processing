 
clear;  
workspace;  
fontSize = 20;
% Open an image.
[baseFileName, folder] = uigetfile('*.jpg', 'code'); 
fullImageFileName = fullfile(folder, baseFileName); 
if folder == 0
  return;
end
% Read in image into an array.
[rgbImage, storedColorMap] = imread(fullImageFileName); 
[rows, columns, numberOfColorBands] = size(rgbImage)
% If it's monochrome (indexed), convert it to color. 
if numberOfColorBands < 3
  uiwait(warndlg('It must be a color image'));
end
% Display the original image.
subplot(2, 1, 1);
imshow(rgbImage);
title('BLUE channel Image', 'FontSize', fontSize, 'Interpreter', 'None');
axis on;
% Set up figure properties:
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'RGB variation plot', 'NumberTitle', 'Off') 
% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);
hg=fspecial('gaussian',[19,19],3);
greenChannel=imfilter(greenChannel,hg,'replicate');
figure(1)
hold on
plot(greenChannel(1, :), 'g', 'LineWidth', 2);
grid on;
% Plot the red signal
%plot(redChannel(1, :), 'r', 'LineWidth', 2);
%%hold on;
%Plot the green signal
%plot(greenChannel(1, :), 'g', 'LineWidth', 2);
%grid on;
%hold on;
% Plot the blue signal
%plot(blueChannel(1, :), 'b', 'LineWidth', 2);
%grid on;





