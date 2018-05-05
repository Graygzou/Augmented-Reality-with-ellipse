function [F_1_chapeau,F_2_chapeau,a_chapeau, arg_min] = MV( xy_donnees_bruitees,x_F_aleatoire,y_F_aleatoire,a_aleatoire, sigma )
% Resolution du problème de Maximum de Vraisemblance (MV)
% tirage aléatoire selon des lois uniformes
% out : F_1_chapeau :   estimateur du foyer F1
%       F_2_chapeau :   estimateur du foyer F2
%       a_chapeau :     estimateur d
%       sigma_chapeau : estimateur sigma
% 
% See also: MCO.m pour une méthode plus adaptée.

% Author : Grégoire Boiron <gregoire.boiron@gmail.com>

n = size(x_F_aleatoire,2);
nb_donnees = size(xy_donnees_bruitees,2);
valeurs = zeros(1,n);

% Pour les n tirages
for i = 1:n
    % Calcul la première partie PF_1 + PF_2
    dist_foyer_F1 = sqrt((xy_donnees_bruitees(1,:) - x_F_aleatoire(1,i)).^2 + (xy_donnees_bruitees(2,:) - y_F_aleatoire(1,i)).^2);
    dist_foyer_F2 = sqrt((xy_donnees_bruitees(1,:) - x_F_aleatoire(2,i)).^2 + (xy_donnees_bruitees(2,:) - y_F_aleatoire(2,i)).^2);
    
    dist_foyer = dist_foyer_F1 + dist_foyer_F2;
    
    % Soustraction de 2a
    E_Pi = dist_foyer - (2*a_aleatoire(i))*ones(1,nb_donnees);
    
    valeurs(i) = sum(E_Pi.^2);
    
end

[arg_min,ind_min] = min(valeurs);

F_1_chapeau = [x_F_aleatoire(1,ind_min) ; y_F_aleatoire(1,ind_min)];

F_2_chapeau = [x_F_aleatoire(2,ind_min) ; y_F_aleatoire(2,ind_min)];

a_chapeau = a_aleatoire(ind_min);
end

