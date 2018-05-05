%clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Simulation des donnees','Position',[0.33*L,0,0.67*L,H]);

%ell = affichage_ellipse(C,theta_0,a,b,theta_points_ellipse,'g-',4);
hold on;
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
axis equal;
hold on;
bruits = plot(xy_donnees_bruitees(1,1:end-1),xy_donnees_bruitees(2,1:end-1),'k*');
plot(xy_donnees_bruitees(1,end),xy_donnees_bruitees(2,end),'rh','MarkerSize',10,'MarkerFaceColor','r');
echelle = [x_min-2 x_max+8 y_min-2 y_max+8];
axis(echelle);
hold on;

% scorey = [];
% for uyut=1:15
%donnees;

% Definition des intervalles pour les tirages aleatoires :
x_min = min(xy_donnees_bruitees(1,:));
x_max = max(xy_donnees_bruitees(1,:));
delta_x = x_max-x_min;
y_min = min(xy_donnees_bruitees(2,:));
y_max = max(xy_donnees_bruitees(2,:));
delta_y = y_max-y_min;
a_max = sqrt(delta_x^2+delta_y^2)/2;

% Tirage de valeurs aleatoires pour les parametres :
nb_tirages = 100000;
x_F_aleatoire = x_min+(x_max-x_min)*rand(2,nb_tirages);
y_F_aleatoire = y_min+(y_max-y_min)*rand(2,nb_tirages);
a_aleatoire = a_max*rand(1,nb_tirages);

% Estimation des parametres par le maximum de vraisemblance :
[F_1_chapeau,F_2_chapeau,a_chapeau, arg_min] = MV(xy_donnees_bruitees,x_F_aleatoire,y_F_aleatoire,a_aleatoire, sigma);
C_chapeau = (F_1_chapeau+F_2_chapeau)/2;
F_2_chapeau_F_1_chapeau = F_1_chapeau-F_2_chapeau;
theta_0_chapeau = atan(F_2_chapeau_F_1_chapeau(2)/F_2_chapeau_F_1_chapeau(1));
c_chapeau = sqrt(F_2_chapeau_F_1_chapeau(1)^2+F_2_chapeau_F_1_chapeau(2)^2)/2;
b_chapeau = sqrt(a_chapeau*a_chapeau-c_chapeau*c_chapeau);

%plot(x_F_aleatoire(1,:),y_F_aleatoire(1,:),'.g')
%plot(x_F_aleatoire(2,:),y_F_aleatoire(2,:),'.k')

% Estimation de sigma (ecart-type) du bruit
% On fait l'hypothese que 2|c-a| >> sigma
sigmas = 0.1:0.1:abs(c-a);
n = length(sigmas);
valeurs = zeros(1,n);
for i=1:n
    K = 1/(sigmas(i)*sqrt(2*pi));
    valeurs(i) = nb_points_ellipse * log(K) - 1/(2*sigmas(i)^2) * arg_min;
end
[~,imax] = max(valeurs);
sigma_chapeau = sigmas(imax);

% Affichage de l'ellipse estimee par MV :
ell_MV = affichage_ellipse(C_chapeau,theta_0_chapeau,a_chapeau,b_chapeau,theta_points_ellipse,'b-',2);
% cF1 = plot(F_1_chapeau(1),F_1_chapeau(2),'+','Color','b','MarkerSize',10,'LineWidth',2);
% cF2 = plot(F_2_chapeau(1),F_2_chapeau(2),'+','Color','b','MarkerSize',10,'LineWidth',2);
% cC = plot(C_chapeau(1),C_chapeau(2),'+','Color','b','MarkerSize',8,'LineWidth',2);

% x = [F_1_chapeau(1),F_2_chapeau(1)];
% y = [F_1_chapeau(2),F_2_chapeau(2)];
% line(x,y,'Color','blue')
% %Finale
% ax=axes('visible','off');
% lg4 = legend(ax,[bruits,ell_MV],'Donnees bruitees','Estimation par MV','Location','Best');
% lg = legend('Ellipserrr','Donnees bruitees','Estimation par MV','Location','Best');
% set(lg4,'Interpreter','Latex');
% set(lg4,'FontSize',15);
% set(lg4,'box','off');
% %1
% ax=axes('visible','off');
% lg1 = legend(ax,[F1,cF1],'$F_1$','$\hat{F_1}$');
% set(lg1,'Interpreter','Latex');
% set(lg1,'FontSize',15);
% set(lg1,'box','off');
% %2               
% ax=axes('visible','off');
% lg2 = legend(ax,[F2,cF2],'$F_2$','$\hat{F_2}$');
% set(lg2,'Interpreter','Latex');
% set(lg2,'FontSize',15);
% set(lg2,'box','off');
% %3
% ax=axes('visible','off');
% lg3 = legend(ax,[C_entre,cC],'$C$','$\hat{C}$');
% set(lg3,'Interpreter','Latex');
% set(lg3,'FontSize',15);
% set(lg3,'box','off');

% uuu = score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau);
% scorey = [scorey, uuu];
% % Calcul du score de l'ellipse estimee par MV :
% fprintf('Score de l''estimation par MV = %.3f\n',score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau));
% fprintf('Estimation du paramètre sigma = %.3f\n',sigma_chapeau);
% end
% score_moyen = sum(scorey)/15

%lg = legend('Ellipse','Donnees bruitees','Point abérrant','Estimation par MV','Location','Best');
%set(lg,'FontSize',15);

% Calcul du score de l'ellipse estimee par MV :
fprintf('Score de l''estimation par MV = %.3f\n',score(F_1,F_2,a,F_1_chapeau,F_2_chapeau,a_chapeau));
fprintf('Estimation du paramètre sigma = %.3f\n',sigma_chapeau);