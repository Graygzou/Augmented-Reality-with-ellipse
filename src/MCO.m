function [ X_chapeau ] = MCO( x, y )
% Estimation approchée de X par les Moindres Carrés Ordinaires (MCO).
% 
% [X_chapeau] = MCO(x,y) calcul les six paramètres d'une ellipse à partir
% d'un nuage de points (x,y).
% 
% See also: MCT.m pour une autre résoltion.

% Author : Grégoire Boiron <gregoire.boiron@gmail.com>

n = size(x,1);

% Construction de A
A = [x.^2 , x.*y , y.^2 , x , y , ones(n,1)];

% Ajout de l'equation non homogene
A = [A ; [1 0 1 0 0 0]];

B = zeros(n+1,1);
B(end) = 1;

X_chapeau = A \ B;
end