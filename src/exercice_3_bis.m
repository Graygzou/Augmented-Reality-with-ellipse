%clear;
close all;

exercice_3;

%% Méthode améliorée.
% Estimation des parametres par les moindres carres totaux :
x = transpose(xy_donnees_bruitees(1,:));
y = transpose(xy_donnees_bruitees(2,:));
X_chapeau = MCT_ameliore(x,y);
[C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau] = conversion(X_chapeau);

% Affichage de l'ellipse estimee par MCT_ameliore :
ell_MCT2 = affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse,'m-',2);
%lg = legend([ell, bruits, ell_MV, ell_MCO, ell_MCT,ell_MCT2],'Ellipse','Donnees bruitees','Estimation par MV','Estimation par MCO','Estimation par MCT','Estimation par MCT\_2','Location','Best');
%set(lg,'FontSize',15);

% Calcul du score de l'ellipse estimee par MCT_ameliore :
R_chapeau = [cos(theta_0_chapeau) -sin(theta_0_chapeau) ; sin(theta_0_chapeau) cos(theta_0_chapeau)];
c_chapeau = sqrt(a_chapeau*a_chapeau-b_chapeau*b_chapeau);
F_1_chapeau = R_chapeau*[c_chapeau ; 0]+C_chapeau;
F_2_chapeau = R_chapeau*[-c_chapeau ; 0]+C_chapeau;
fprintf('Score de l''estimation par MCT_ameliore = %.3f\n',score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau));
