clear all;clc;close all;
set(0,'DefaultFigureWindowStyle','docked');
%%
%load image
 Image= double(rgb2gray(imread('1.jpg')));
 figure('name','Image'); imagesc(Image); axis on; axis equal ;colormap('gray');
% ImageCrop = Image(1:600,1:630);
%  figure('name','Image'); imagesc(ImageCrop); axis on; axis equal ;colormap('gray');hold on;
%%
numElement = 24; %how many element 
Map = [7 250 30];

%define spatial fre.
Map(1,1,1:30) = [16.00,17.95,20.16,22.62,25.39,28.50,32.0,36.0,40.3,45.3,50.8,57.0,64.0,71.8,80.6,90.5,102.0,114.0,128.0,144.0,161.0,181.0,203.0,228.0,256.0,287.0,323.0,362.0,406.0,456.0];

%location

% %group4
% %Map(3,1:3,1)=[202,178,36];    
% Map(3,1:3,2)=[565,635,15];     
% Map(3,1:3,3)=[628,639,15];     
% Map(3,1:3,4)=[683,631,12];
% Map(3,1:3,5)=[733,624,11];
% Map(3,1:3,6)=[777,623,10];
% %group5
% Map(3,1:3,7)=[563,842,9];
% Map(3,1:3,8)=[598,843,8];
% Map(3,1:3,9)=[630,837,7];
% Map(3,1:3,10)=[658,837,6];
% Map(3,1:3,11)=[683,840,5];
% Map(3,1:3,12)=[705,844,4];
%group6
%Map(3,1:3,13)=[800,745,40];
Map(2,1:3,14)=[595,675,30];
Map(2,1:3,15)=[633,670,30];
Map(2,1:3,16)=[690,664,24];
Map(2,1:3,17)=[750,659,22];
Map(2,1:3,18)=[789,655,20];
%group7
Map(2,1:3,19)=[574,802,18];
Map(2,1:3,20)=[605,808,16];
Map(2,1:3,21)=[636,812,14];
Map(2,1:3,22)=[660,816,12];
Map(2,1:3,23)=[688,820,10];
Map(2,1:3,24)=[712,823,8];

%group8
% Map(2,1:3,25)=[741,769,8];
% Map(2,1:3,26)=[700,756,6];

for i=14:24
%spatial fre.    
MTFx(i) = Map(1,1,i);

% horizontal   
Map(4,1:Map(2,3,i)+1,i) = Image( Map(2,1,i):Map(2,1,i) , Map(2,2,i):Map(2,2,i)+Map(2,3,i));
plot([Map(2,2,i) Map(2,2,i)+Map(2,3,i)], [Map(2,1,i) Map(2,1,i)],'color','b','LineWidth', 2, 'LineStyle','--');hold on;
[u1 v1 w1] =find(Map(4,:,i));
MTFh(i) = (max(w1) - min(w1))/ (max(w1) + min(w1));

% %vertical
%  Map(5,1:Map(3,3,i)+1,i) = transpose(Image( Map(3,2,i):Map(3,2,i)+Map(3,3,i) ,Map(3,1,i):Map(3,1,i)));
%  plot([Map(3,2,i) Map(3,2,i)], [Map(3,1,i) Map(3,1,i)+Map(3,3,i)],'color','r','LineWidth', 2, 'LineStyle','--');hold on;
%  [u2 v2 w2] =find(Map(5,:,i));
%  MTFv(i) = (max(w2) - min(w2))/ (max(w2) + min(w2));
end

figure;
plot(MTFx,MTFh,'b-o');grid on;hold on;
% plot(MTFx,MTFv,'r-o');grid on;hold on;
xlabel('Spatial Frequency (lp/mm)','FontSize', 24);  
ylabel('Contrast (%)','FontSize', 24);
axis square;



