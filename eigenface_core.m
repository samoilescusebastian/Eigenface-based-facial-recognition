function [m A eigenfaces pr_img] = eigenface_core(database_path)
   
   for i = 1 : 10
    image_path = strcat(database_path,'/',int2str(i),'.jpg');
    B = double(rgb2gray(imread(image_path)));
    B = B';
    B = B(:);
    T(:,i) = B;
  endfor
  [M,N] = size(T);
  
  for i = 1:M
    m(i) = mean(T(i,:));
   endfor
  A = T - m';
   B = A' * A;
  [V,D] = eig(B);
  i = 1;
  while (D(i,i) - 1 < 0.00001)
    i++;
  endwhile
  while (i > 1)
    V(:,1) = [];
    i--;
  endwhile
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
end
