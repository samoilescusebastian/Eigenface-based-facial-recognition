function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  B = double(rgb2gray(imread(image_path)));
  B = B';
  T = B(:);
  [N] = length(T);
  for i = 1 : N
   T(i) = T(i) - m(i);
  endfor
  pr_test_img = eigenfaces' * T;
  [M1,N1] = size(pr_img);
  output_img_index = 1;
  min_dist = norm(pr_test_img - pr_img(:,1));
  for i = 2 : N1
    dist = norm(pr_test_img - pr_img(:,i));
    if dist < min_dist
      min_dist = dist;
      output_img_index = i;
    endif
  endfor
  
endfunction  
    