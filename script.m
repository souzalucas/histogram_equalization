pkg load image;

# Constantes
L = 256;
M = 679;
N = 800;

# Carregando imagem de entrada
img_entrada = imread("imagem.jpg");

# Obtendo histograma da imagem de entrada
[counts, x] = imhist(img_entrada);

# Normalizacao do histograma
norm = zeros(L,1);
for i = 1:L
  norm(i) = counts(i)/(M*N);
endfor

# Equalizacao do histograma
res = zeros(L,1);
for k = 0:L-1
  soma = 0;
  for r = 0:k
    soma += norm(r+1);
  endfor
  res(k+1) = round((L-1)*soma);
endfor

# Criando imagem de saida
img_saida = zeros(M,N,'uint8');
for i = 1:M
  for j = 1:N
    img_saida(i,j) = res(img_entrada(i,j) + 1);
  endfor
endfor

# Obtendo histograma da imagem de saida
[counts, x] = imhist(img_saida);

# Plotando histograma da imagem de saida
plot(x, counts);

# Gravando imagem de saida
imwrite(img_saida, "saida.jpg");
