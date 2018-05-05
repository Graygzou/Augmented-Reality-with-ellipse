function [ X_chapeau ] = MCT_ameliore( x, y )
% Estimation de X approchée par les Moindres Carrés Totaux (MCT) couplé à une SVD.
% 
% [X_chapeau] = MCT(x,y) calcul les six paramètres d'une ellipse à partir
% d'un nuage de points (x,y).
% 
% See also: MCT.m pour une version alternative.

% Author : Grégoire Boiron <gregoire.boiron@gmail.com>

n = size(x,1);

% centrage (et normalisation ?) des données
moy_x = mean(x);
moy_y = mean(y);

x = x - moy_x;
y = y - moy_y;

% Construction de A
A = [x.^2 , x.*y , y.^2 , x , y, ones(n,1)];

% Decomposition en valeur singuliere [A B]
[~,S,V] = svd(A);

% Meme si svd(A) trie les valeurs singulieres par ordre decroissant,
% on reapplique un trie au cas ou.
[~, perm] = sort(diag(S), 'descend');
V = V(:,perm);

X_temp = V(:,end);

X_chapeau = X_temp;
X_chapeau(4) = -X_temp(1)*2*moy_x - X_temp(2)*moy_y + X_temp(4);
X_chapeau(5) = -X_temp(2)*moy_x - 2*X_temp(3)*moy_y + X_temp(5);
X_chapeau(6) = X_temp(1)*moy_x^2 + X_temp(2)*moy_x*moy_y + X_temp(3)*moy_y^2 - X_temp(4)*moy_x + X_temp(5)*moy_y + X_temp(6);

end

