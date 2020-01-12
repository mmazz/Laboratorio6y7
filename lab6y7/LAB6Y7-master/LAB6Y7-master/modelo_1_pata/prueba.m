x1 = normrnd(5,2,10000,1); % First data set of 10000 values with mean 5
x2 = normrnd(10,2,10000,1); % Second data set of 10000 values with mean 10
x3 = normrnd(15,2,10000,1); % Third data set of 10000 values with mean 15

x = cat(2,x1,x2,x3); % Concatenate the data sets in a 10000 x 3 matrix

aboxplot(x,'labels',[5,10,15]); % Advanced box plot

xlabel('$\mu$'); % Set the X-axis label


    aa = error_por_coordenada(1,:,2); aa_vec = aa(:);
    bb= error_por_coordenada(1,:,4); bb_vec = bb(:);
   cc = error_por_coordenada(1,:,6); cc_vec = cc(:);
       error_en_x = cat(2,aa_vec(:,1),bb_vec(:,1),cc_vec(:,1));
