function [sigma_chapeau] = MV2( xy_donnees_bruitees,F_1_chapeau,F_2_chapeau,a_chapeau )
% Resolution du problème de maximum de vraisemblance
% tirage aléatoire selon des lois uniformes
% out : F_1_chapeau : estimateur du foyer F1
%       F_2_chapeau : estimateur du foyer F2
%       a_chapeau : estimateur d

n = size(x_F_aleatoire,2);
nb_donnees = size(xy_donnees_bruitees,2);
valeurs = zeros(1,n);

% Pour les n tirages
for i = 1:n
    
    
    
end

[~,arg_min] = min(valeurs);

a_chapeau = a_aleatoire(arg_min);

end

