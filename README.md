# Augmented Reality with ellipse
Detect and estimate parameters of an ellipse to fill it with custom images. This project was made during a college
course, followed at [ENSEEIHT](http://www.enseeiht.fr/fr/index.html), a french engineer school.

<img  width="285px" height="200px" src="https://github.com/Graygzou/Augmented-Reality-with-ellipse/blob/master/images/initialImage.jpg"> <img width="285px" height="200px" src="https://github.com/Graygzou/Augmented-Reality-with-ellipse/blob/master/images/flame.jpg">
<img width="285px" height="200px" src="https://github.com/Graygzou/Augmented-Reality-with-ellipse/blob/master/images/finalResult.png">
From left to right : Initial image containing an ellipse (the black and white target). Once we've detect it, we fill it with the flame image shown in the middle image. The last image represents the final result obtained. 

## License
This project is licensed under the GNU General Public License v3.0 - please do read the [LICENSE.md](https://github.com/Graygzou/Augmented-Reality-with-ellipse/blob/master/LICENSE) file for more details.

## Getting Started
To be able to run the basic estimation run the following scripts in order :
1. `donnees.m` which generate points from an ellipse with added noise. They will be used as initial data through each estimation method.
2. `exerciceX.m` with a `X` a number which corresponds to a specific estimation. It will prints the estimated ellipse on top of the initial points.

If you want to run the augmented reality application, just follow those steps :
1. Run the `augmentation.m` script which compute `n` augmented images from two initial sets of images (basics one and those we want to integrate). This script might take a while to finish.
1. Run the `cinema.m` script which show all the `n` augmented images one after the other like a flipping book.

## About
Different regression models were used to estimate ellipse's parameters.

Each technique was reviewed, to understand possible weaknesses and strengths.

All scripts are written in Matlab and comments are in french.

## Contributors
* [Grégoire Boiron](https://github.com/Graygzou)

## Acknowledgments
This project contains a toolbox for the augmented reality application written by the following people :
* Lilian Calvet
* Fitzgibbon, A.~W.and Pilu, M. and Fisher, R.~B.
