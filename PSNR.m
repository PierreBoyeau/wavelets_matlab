function [score] = PSNR(I, I1)
[M, N] = size(I);

I_carre = I .^ 2;
num = M*N*max(I_carre(:));
diff_carre = (I - I1) .^ 2;
denom = sum(diff_carre(:));
score = 10*log10(num / denom);
end

