
%the LP modes 
%% % parameters
a=10;    %diameter
n1=1.45;    %core
n2=1.4;     %cladding
lambda=488;
v=(pi*a/lambda)*sqrt(n1^2-n2^2);    %normalized freq
v=4;
%% mesh draw points r & phi
r=linspace(0,a,400);
phi=linspace(0,2*pi,400);
[r,phi]=meshgrid(r,phi);
%% calculate the modes
m0=[];m1=[];m2=[];
for x=1:10
    m0(end+1)=fzero(@(x)besselj(0,x),[x-1 x]*pi);
    if x*pi>v
        break;
    end
end
for x=1:10
    t=fzero(@(x)besselj(1,x),[x-1 x]*pi);
    if t>0
        m1(end+1)=t;
    end
    if x*pi>v
        break;
    end
end
for x=1:10
    t=fzero(@(x)besselj(2,x),[x-1 x]*pi);
    if t>0
        m2(end+1)=t;
    end
    if x*pi>v
        break;
    end
end
%% draw modes for m=0
for i=1:length(m0)
    z=besselj(0,m0(i)*r/a).*cos(0.*phi);
    x=r.*cos(phi);
    y=r.*sin(phi);
    figure
  mesh(x,y,imag(z)./real(z));
  
end
%% draw modes for m=1
for i=1:length(m1)
    z=besselj(1,m1(i)*r/a).*cos(1.*phi);
    x=r.*cos(phi);
    y=r.*sin(phi);
    figure
  %mesh(x,y,z.^2);
   mesh(x,y,imag(z)./real(z));
end
%% draw modes for m=2
for i=1:length(m2)
    z=besselj(2,m2(i)*r/a).*cos(2.*phi);
    x=r.*cos(phi);
    y=r.*sin(phi);
    figure
    %mesh(x,y,z.^2);
     mesh(x,y,imag(z)./real(z));
end