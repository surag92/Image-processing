clear all; close all;
tic;
%% Initializing display Matrices
H = 1920; V = 1080; 
x = -H/2:1:(H/2-1); 
y = -V/2:1:(V/2-1);
x = x*7.56e-3; 
y = y*7.56e-3; 
[X,Y] = meshgrid(x, y);
	    %%
	x0 = 0;     		% center
	y0 = 0;     		% center
	sigma = 960e-3; 			% beam waist
    sigma1=3.24;
	A = 1;      		% peak of the beam 
    n= 40;
    
	res = ((X-x0).^2 + (Y-y0).^2)./(2*sigma^2);
    res1 = ((X-x0).^n + (Y-y0).^n)./(2*sigma1^n);
	input_intensity = A  * exp(-res);
    output_intensity = A  * exp(-res1);
    figure(1)
	surf(input_intensity);
	shading interp 
      figure(2)
	surf(output_intensity);
	shading interp 
%---------------------------------------------------------
	Target=output_intensity;
    c1=0.002;
    c2=0.006;
    deltac=0.0001;
    c=c1;
initialguess= c((m.^2)+ (n.^2));
	A = fftshift(ifft2(fftshift(Target)));
	error = [];
	iteration_num = 100;
	%hologram = |objectWave + referenceWave|.^2
for i=1:iteration_num
  B = abs(input_intensity) .* exp(1i*initialguess);
  C = fftshift(fft2(fftshift(B)));
  D = abs(Target) .* exp(1i*angle(C));
  A = fftshift(ifft2(fftshift(D)));
  error = [error; sum(sum(abs(1.32*abs(C) - abs(Target))))];   
end
	figure
	subplot(2,1,1);
	imagesc(Target);
	title('Original image')
	subplot(2,1,2);
	imagesc(abs(C))               %last pattern
	title('reconstructed image');
	figure
	i = 1:1:i;
	plot(i,(error'));
	title('Error');
	figure
	imagesc(abs(C)) %last pattern
	title('reconstructed image');
	figure
	imagesc(angle(A)) %phase
	title('reconstructed phase')
	toc;