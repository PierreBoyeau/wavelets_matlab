function Iout = wavelet_denoise(I, theta)

L = 4;
qmf=MakeONFilter('Daubechies', 4);

wtransfo = FWT2_PO(I,L,qmf);
filter = wtransfo .* (wtransfo >= theta);

Iout = IWT2_PO(filter, L, qmf);

end

