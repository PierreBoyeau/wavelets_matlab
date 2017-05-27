%% Visulalisation des ondelettes 2D
L = 4;
% Question 1
qmf=MakeONFilter('Daubechies', L);
figure(1);
 bar(qmf);
% title('Norme du gradient')
% print(2,'results/24.jpg','-djpeg');


figure(4);
toon0231;
figure(5);
toon0233;
figure(6);
toon0232;


print(4,'results/221.jpg','-djpeg');
print(5,'results/222.jpg','-djpeg');
print(6,'results/223.jpg','-djpeg');


%% Question 4 Visualiser l'image correspondant aux coefficients de $\phi_j^k$
% Test pour k=1 et j = -2
j = -2;
L = 4;

box = Make2dSignal('BoxWithCross', 256);
%
qmf=MakeONFilter('Daubechies', 4);
wbox = FWT2_PO(box,4,qmf);
idx_i = int64(2^j/2*256)+1:int64(2^j*256);
idx_j = 1:int64(2^j/2*256);

m_psi_kj = zeros(256, 256);
m_psi_kj(idx_i, idx_j) = wbox(idx_i, idx_j);

img = IWT2_PO(m_psi_kj, 4, qmf);

AutoImage(img);


%% Question 5
Wsingle = zeros(256,256);
Wsingle(40, 40) = 1;
Isingle=IWT2_PO(Wsingle, L, qmf);
figure(7);
surf(Isingle);
colormap copper;
shading interp %donne a la surface un aspect lisse par interpolation
light %ajoute une source lumineuse pour illuminer la surface
lighting gouraud; %calcule le rendu de la diffusion/reflexion de la lumiere

print(7,'results/251.jpg','-djpeg');





%% Partie 3 : débruitage d'image

I = ReadImage('Canaletto');
imagesc(I);
colormap(gray);

%% Question 2

Inoisy = gaussian_noise(I);
imagesc(Inoisy);
colormap(gray);


