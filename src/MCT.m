function [ X_chapeau ] = MCT( x, y )
% Estimation approchée de X par les Moindres Carrés Totaux (MCT).
% 
% [X_chapeau] = MCT(x,y) calcul les six paramètres d'une ellipse à partir
% d'un nuage de points (x,y).
% 
% See also: MCT_ameliore.m pour une version alternative.

% Author : Grégoire Boiron <gregoire.boiron@gmail.com>

n = size(x,1);

% Centrage et normalisation des données
% et normalisation correspond a prendre en compte que le degré 0 et
% le degré 1 (pas de degré 2).

% Construction de A
A = [x.^2 , x.*y , y.^2 , x , y, ones(n,1)];

% Decomposition en valeur singuliere [A B]
[~,S,V] = svd(A);
% Meme si svd(A) trie les valeurs singulieres par ordre decroissant,
% on reapplique un trie au cas ou.
[~, perm] = sort(diag(S), 'descend');
V = V(:,perm);

X_chapeau = V(:,end);
end