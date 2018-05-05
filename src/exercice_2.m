%clear;
%close all;

exercice_1;

% Affiche les foyers
% F1 = plot(F_1(1),F_1(2),'xg','MarkerSize',10,'LineWidth',2);
% F2 = plot(F_2(1),F_2(2),'xg','MarkerSize',10,'LineWidth',2);
% C_entre = plot(C(1),C(2),'xg','MarkerSize',8,'LineWidth',2);
% 
% x = [F_1(1),F_2(1)];
% y = [F_1(2),F_2(2)];
% line(x,y,'Color','green')

% Estimation des parametres par les moindres carres ordinaires :
x = transpose(xy_donnees_bruitees(1,:));
y = transpose(xy_donnees_bruitees(2,:));

% scorey = [];
% for uyut=1:15

X_chapeau = MCO(x,y);
[C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau] = conversion(X_chapeau);

% x = [F_1_chapeau(1),F_2_chapeau(1)];
% y = [F_1_chapeau(2),F_2_chapeau(2)];
% line(x,y,'Color','blue')

% Affichage de l'ellipse estimee par MCO :
ell_MCO = affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse,'r-',2   );
hold on;
%lg = legend([ell, bruits, ell_MV, ell_MCO],'Ellipse','Donnees bruitees','Estimation par MV','Estimation par MCO','Location','Best');
%set(lg,'FontSize',15);

% Calcul du score de l'ellipse estimee par MCO :
R_chapeau = [cos(theta_0_chapeau) -sin(theta_0_chapeau) ; sin(theta_0_chapeau) cos(theta_0_chapeau)];
c_chapeau = sqrt(a_chapeau*a_chapeau-b_chapeau*b_chapeau);
F_1_chapeau = R_chapeau*[c_chapeau ; 0]+C_chapeau;
F_2_chapeau = R_chapeau*[-c_chapeau ; 0]+C_chapeau;

% x = [F_1_chapeau(1),F_2_chapeau(1)];
% y = [F_1_chapeau(2),F_2_chapeau(2)];
% line(x,y,'Color','red')

% cF12 = plot(F_1_chapeau(1),F_1_chapeau(2),'+','Color','r','MarkerSize',10,'LineWidth',2);
% cF22 = plot(F_2_chapeau(1),F_2_chapeau(2),'+','Color','r','MarkerSize',10,'LineWidth',2);
% cC2 = plot(C_chapeau(1),C_chapeau(2),'+','Color','r','MarkerSize',8,'LineWidth',2);

fprintf('Score de l''estimation par MCO = %.3f\n',score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau));

% uuu = score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau);
% scorey = [scorey, uuu];
% % Calcul du score de l'ellipse estimee par MV :
% fprintf('Score de l''estimation par MCO = %.3f\n',score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau));
% fprintf('Estimation du paramètre sigma = %.3f\n',sigma_chapeau);
% end
% score_moyen = sum(scorey)/15
