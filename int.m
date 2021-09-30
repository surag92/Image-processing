A = imread('red1.jpg');

% B = imread('c2.jpg');
% C= imread('c3.jpg');
% 
A=A/max(A(:));
%  [ImageA,rect]=imcrop(ImageA); 


% A=imcrop(A,rect);
% B=imcrop(B,rect);
% C=imcrop(C,rect);

x1 = [0 size(A,2)];
y1 = [size(A,1)/2 size(A,1)/2];
c1 = improfile(A,x1,y1);


% x2 = [0 size(B,2)];
% y2 = [size(B,1)/2 size(B,1)/2];
% c2 = improfile(B,x2,y2);
% % 

% x3 = [0 size(C,2)];
% y3 = [size(C,1)/2 size(C,1)/2];
% c3 = improfile(C,x3,y3);


% 
% hg=fspecial('gaussian',[31,31],5);
% % 
%  GC1=imfilter(c1(:,1,2),hg,'replicate');
% GC2=imfilter(c2(:,1,2),hg,'replicate');
% GC3=imfilter(c3(:,1,2),hg,'replicate');

figure
% subplot(3,1,1)
plot(c1(:,1,2),'r')
% hold on
% plot(c2(:,1,2),'g')
% hold on
% plot(c3(:,1,2),'g')
% 
% subplot(3,1,2)

%  plot(GC1,'r')
%  hold on
% plot(GC2,'g')
%  hold on
% plot(GC3,'b')
% 
% subplot(3,1,3)

% findpeaks(GC1)
% grid on;
% hold on;
% findpeaks(GC2)
% hold on;
% findpeaks(GC3)
