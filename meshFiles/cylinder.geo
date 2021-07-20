// Gmsh project created on Sun Jul 18 10:42:37 2021

Nx1 = 41; Rx1 = 1.00;
Nx2 = 41; Rx2 = 1.00;
Ny = 41; Ry = 5.00;
Nb = 41; Rb = 0.90;
Nc = 41; Rc = 1.00;

Point(1) = {-10, -10, 0, 1};
Point(2) = {10, -10, 0, 1};
Point(3) = {40, -10, 0, 1};
Point(4) = {40, 10, 0, 1};
Point(5) = {10, 10, 0, 1};
Point(6) = {-10, 10, 0, 1};
Point(7) = {0, 0, 0, 1};

//Cylinder points
Point(8) = {-0.35355339, -0.35355339, 0, 1};
Point(9) = {0.35355339, -0.35355339, 0, 1};
Point(10) = {-0.35355339, 0.35355339, 0, 1};
Point(11) = {0.35355339, 0.35355339, 0, 1};

//domain lines
Line(1) = {1, 2}; Transfinite Curve {1} = Nx1 Using Progression Rx1;
Line(2) = {2, 3}; Transfinite Curve {2} = Nx2 Using Progression Rx2;
Line(3) = {3, 4}; Transfinite Curve {3} = Ny Using Bump Ry;
Line(4) = {4, 5}; Transfinite Curve {4} = Nx2 Using Progression Rx2;
Line(5) = {5, 6}; Transfinite Curve {5} = Nx1 Using Progression Rx1;
Line(6) = {6, 1}; Transfinite Curve {6} = Ny Using Bump Ry;
Line(7) = {5, 2}; Transfinite Curve {7} = Ny Using Bump Ry;

//cylinder lines
Circle(8) = {10, 7, 8}; Transfinite Curve {8} = Nc Using Progression Rc;
Circle(9) = {8, 7, 9}; Transfinite Curve {9} = Nc Using Progression Rc;
Circle(10) = {9, 7, 11}; Transfinite Curve {10} = Nc Using Progression Rc;
Circle(11) = {11, 7, 10}; Transfinite Curve {11} = Nc Using Progression Rc;

//block lines
Line(12) = {1, 8}; Transfinite Curve {12} = Nb Using Progression Rb;
Line(13) = {2, 9}; Transfinite Curve {13} = Nb Using Progression Rb;
Line(14) = {5, 11}; Transfinite Curve {14} = Nb Using Progression Rb;
Line(15) = {6, 10}; Transfinite Curve {15} = Nb Using Progression Rb ;

//surfaces
Curve Loop(1) = {12, 9, -13, -1};
Plane Surface(1) = {1};
Curve Loop(2) = {13, 10, -14, 7};
Plane Surface(2) = {2};
Curve Loop(3) = {14, 11, -15, -5};
Plane Surface(3) = {3};
Curve Loop(4) = {15, 8, -12, -6};
Plane Surface(4) = {4};
Curve Loop(5) = {7, 2, 3, 4};
Plane Surface(5) = {5};

Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Transfinite Surface {5};

Recombine Surface {1};
Recombine Surface {2};
Recombine Surface {3};
Recombine Surface {4};
Recombine Surface {5};

Extrude {0, 0, 1} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; 
  Layers{1};
  Recombine;
}

Physical Surface("inlet") = {102};
Physical Surface("outlet") = {120};
Physical Surface("top") = {80, 124};
Physical Surface("bottom") = {36, 116};
Physical Surface("cylinderWalls") = {94, 72, 28, 50};
Physical Surface("frontAndBack") = {103, 81, 37, 59, 125, 5, 1, 4, 3, 2};
Physical Volume("fluid") = {3, 4, 1, 2, 5};



