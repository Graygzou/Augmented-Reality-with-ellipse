%clear;
%close all;

taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Simulation des donnees','Position',[0.33*L,0,0.67*L,H]);

% Parametres de l'ellipse :
taille = 20;
% c : largeur de l'ellipse.
c = 2*taille/5*(rand+0.25);
% a : valeur/2 qui separera les deux foyers.
a = 2*taille/5*(rand+1);
if a<c
	aux = a;
	a = c;
	c = aux;
end
b = sqrt(a^2-c^2);
C = (taille-a)*(2*rand(2,1)-1);
%C = [1; 1];
theta_0 = 2*pi*rand;

%% Affichage de l'ellipse :
nb_points_ellipse = 100;
deux_pi = 2*pi;
theta_points_ellipse = deux_pi/nb_points_ellipse:deux_pi/nb_points_ellipse:deux_pi;
ell = affichage_ellipse(C,theta_0,a,b,theta_points_ellipse,'g-',4);
hx = xlabel('$x$','FontSize',20);
set(hx,'Interpreter','Latex');
hy = ylabel('$y$','FontSize',20);
set(hy,'Interpreter','Latex');
axis equal;
hold on;

%% Foyers :
R = [cos(theta_0) -sin(theta_0) ; sin(theta_0) cos(theta_0)];
F_1 = R*[c ; 0]+C;
F_2 = R*[-c ; 0]+C;
% % Affiche les foyers
% F1 = plot(F_1(1),F_1(2),'xr','MarkerSize',10,'LineWidth',2);
% F2 = plot(F_2(1),F_2(2),'xb','MarkerSize',10,'LineWidth',2);
% C_entre = plot(C(1),C(2),'xm','MarkerSize',8,'LineWidth',2);

%% Calcul et affichage des donnees bruitees :
n = 401;    
theta_donnees_bruitees = 2*pi*rand(1,n-1)+2*pi*rand;
% Construit une ellipse a base de point correspondant à la meme ellipse que les données
xy_donnees_bruitees = [a*cos(theta_donnees_bruitees) ; b*sin(theta_donnees_bruitees)];
% Applique une rotation et translate le nuage de point pour avoir
% superposition
xy_donnees_bruitees = R*xy_donnees_bruitees+C*ones(1,n-1);
sigma = 1;
% Transforme l'ensemble de points en un nuage de point. Permet de créer le
% bruit.
xy_donnees_bruitees = xy_donnees_bruitees+sigma*randn(2,n-1);

%% Ajout d'un point vraiment abérant
%xy_donnees_bruitees = [xy_donnees_bruitees, [25;0]];
bruits = plot(xy_donnees_bruitees(1,1:end-1),xy_donnees_bruitees(2,1:end-1),'k*');
%plot(xy_donnees_bruitees(1,end),xy_donnees_bruitees(2,end),'rh','MarkerSize',10,'MarkerFaceColor','r');


% x = [F_1(1),F_2(1)];
% y = [F_1(2),F_2(2)];
% line(x,y,'Color','blue')
% %txt = 'd = 2c';
% %text(C(1)-0.5,C(2)-0.2,txt,'HorizontalAlignment','right','Color','blue','FontSize',11)
% % Affichage random
% ind = find(min(xy_donnees_bruitees(1,:) - C(2)));
% text(xy_donnees_bruitees(1,ind(1,1)),xy_donnees_bruitees(2,ind(1,1)),['P'],...
%     'HorizontalAlignment','right','Color','magenta','FontSize',11)
% x = [F_1(1),xy_donnees_bruitees(1,ind(1,1))];
% y = [F_1(2),xy_donnees_bruitees(2,ind(1,1))];
% line(x,y,'Color','red')
% %txt = 'd = 2c';
% %text(C(1)-0.5,C(2)-0.2,txt,'HorizontalAlignment','right','Color','blue','FontSize',11)
% x = [F_2(1),xy_donnees_bruitees(1,ind(1,1))];
% y = [F_2(2),xy_donnees_bruitees(2,ind(1,1))];
% line(x,y,'Color','red') 

x_min = min(xy_donnees_bruitees(1,:));
x_max = max(xy_donnees_bruitees(1,:));
y_min = min(xy_donnees_bruitees(2,:));
y_max = max(xy_donnees_bruitees(2,:));
% % 
% echelle = [x_min-2 x_max+8 y_min-2 y_max+8];
% axis(echelle);
% ax=axes('visible','off');
% lg2 = legend(ax,[F1,F2],'$F_1$','$F_2$');
% set(lg2,'Interpreter','Latex');
% set(lg2,'FontSize',15);
% set(lg2,'box','off');
% ax=axes('visible','off');
% lg1 = legend(ax,[ell,C_entre,bruits],'Ellipse','Centre','Donnees bruitees','Location','Best');
% set(lg1,'Interpreter','Latex');
% set(lg1,'box','off');
% set(lg1,'FontSize',15);
