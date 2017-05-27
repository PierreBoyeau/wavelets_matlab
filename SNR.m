function [score] = SNR( I, I1 )
I_carre = I .^ 2;
num = sum(I_carre(:));
diff_carre = (I - I1) .^ 2;
denom = sum(diff_carre(:));
score = 10*log10(num / denom);
end

