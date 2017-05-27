function [ Iout ] = gaussian_noise( I )
[h, w] = size(I);
noise = randn(h, w);
Iout = I + 20*noise;
end

