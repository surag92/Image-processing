% Function FPU to calculation of unwrapped phase 'unwrapped_psi' from wrapped phase 'wrapped_fi'.
% Function recognizes the size of input data and chooses 2D or 3D. 
% The user can choose number of FFTs 'number_of_ffts' (Tab. 1) 4,6 or 8.
% Time measurment was done using 'tic' and 'toc' functions. 

function [unwrapped_psi] = FPU(wrapped_fi,number_of_ffts)
    
    S = size(wrapped_fi);
    dim = length(S);
    
    % frequency coordinates from spatial coordinates
    fx = 1/(S(1)-1)*[-S(1)/2:S(1)/2-1];
    fy = 1/(S(2)-1)*[-S(2)/2:S(2)/2-1];

    % K is Fourier-space conjugate of the vector r [x,y] or r [x,y,z]
    if dim == 2
        [X, Y] = meshgrid(fy, fx);
        K = X.^2 + Y.^2 + eps;
        
    elseif dim == 3
        % additional coordinates for third spatial dimension
        fz = 1/(S(3)-1)*[-S(3)/2:S(3)/2-1];
        
        [X, Y, Z] = meshgrid(fy, fx, fz);
        K = X.^2 + Y.^2 + Z.^2 + eps;
    end
        K = fftshift(K);
    
        
    if number_of_ffts == 4    
    % estimated unwrapped phase psi using Eq. 14 (4 FFTs)
    tic
    estimated_psi = ifftn( fftn(imag(ifftn(K.*fftn(exp(1i*wrapped_fi)))./exp(1i*wrapped_fi)))./K );
    toc
    t4 = toc
    
    elseif number_of_ffts == 6
    % estimated unwrapped phase psi using Eq. 12 (6 FFTs)
    tic
    estimated_psi = ifftn( fftn(((cos(wrapped_fi).*ifftn(K.*fftn(sin(wrapped_fi))) ...
                    - sin(wrapped_fi).*ifftn(K.*fftn(cos(wrapped_fi))))))./K );
    toc
    t6 = toc
    
    elseif number_of_ffts == 8
    % estimated unwrapped phase psi using Eq. 10 (8 FFTs)
    tic
    estimated_psi = ifftn( fftn(cos(wrapped_fi).*(ifftn(K.*fftn(sin(wrapped_fi)))))./K ) ...
                   -ifftn( fftn(sin(wrapped_fi).*(ifftn(K.*fftn(cos(wrapped_fi)))))./K );
    toc
    t8 = toc
    end
    
    % Eq.13 phase correcting function
    Q = round( (estimated_psi - wrapped_fi)/(2*pi) );
    
    % Eq. 1 phase unwrapping
    unwrapped_psi = wrapped_fi + 2*pi*(Q);   

end




