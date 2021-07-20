// Gmsh project created on Mon Jul 19 22:58:51 2021
//+
d = DefineNumber[ 1.0, Name "Parameters/diameter" ];
//+
cos45 = DefineNumber[ 0.707106781186, Name "Parameters/cosine45" ];
nx1 = 61; px1 = 1.0;
nx2 = 121; px2 = 1/px1;
ny = 41; py1 = 0.95; py2 = 1.0/py1;
nc = 31; pc1 = 1.0; pc2 = 1.1;

Point(1) = {0, 0, 0, 1.0};
Point(2) = {d/2*cos45, d/2*cos45, 0, 1.0};
Point(3) = {-d/2*cos45, d/2*cos45, 0, 1.0};
Point(4) = {-d/2*cos45, -d/2*cos45, 0, 1.0};
Point(5) = {d/2*cos45, -d/2*cos45, 0, 1.0};

Point(6) = {2*d*cos45, 2*d*cos45, 0, 1.0};
Point(7) = {-2*d*cos45, 2*d*cos45, 0, 1.0};
Point(8) = {-2*d*cos45, -2*d*cos45, 0, 1.0};
Point(9) = {2*d*cos45, -2*d*cos45, 0, 1.0};

Point(10) = {20.0*d, 10.0*d, 0, 1.0};
Point(11) = {-10.0*d, 10.0*d, 0, 1.0};
Point(12) = {-10.0*d, -10.0*d, 0, 1.0};
Point(13) = {20.0*d, -10.0*d, 0, 1.0};

Point(14) = {2*d*cos45, 10.0*d, 0, 1.0};
Point(15) = {-2*d*cos45, 10.0*d, 0, 1.0};
Point(16) = {-2*d*cos45, -10.0*d, 0, 1.0};
Point(17) = {2*d*cos45, -10.0*d, 0, 1.0};
Point(18) = {20.0*d, 2*d*cos45, 0, 1.0};
Point(19) = {-10.0*d, 2*d*cos45, 0, 1.0};
Point(20) = {-10.0*d, -2*d*cos45, 0, 1.0};
Point(21) = {20.0*d, -2*d*cos45, 0, 1.0};

//+
Line(1) = {11, 15};
Line(2) = {15, 14};
Line(3) = {14, 10};
Line(4) = {19, 7};
Line(5) = {6, 18};
Line(6) = {20, 8};
Line(7) = {9, 21};
Line(8) = {12, 16};
Line(9) = {16, 17};
Line(10) = {17, 13};
Line(11) = {11, 19};
Line(12) = {19, 20};
Line(13) = {20, 12};
Line(14) = {15, 7};
Line(15) = {8, 16};
Line(16) = {14, 6};
Line(17) = {9, 17};
Line(18) = {10, 18};
Line(19) = {18, 21};
Line(20) = {21, 13};
Circle(21) = {2, 1, 3};
Circle(22) = {3, 1, 4};
Circle(23) = {4, 1, 5};
Circle(24) = {5, 1, 2};
Circle(25) = {6, 1, 7};
Circle(26) = {7, 1, 8};
Circle(27) = {8, 1, 9};
Circle(28) = {9, 1, 6};
Line(29) = {2, 6};
Line(30) = {3, 7};
Line(31) = {4, 8};
Line(32) = {5, 9};

Transfinite Curve {1, 4, 6, 8} = nx1 Using Progression px1;
Transfinite Curve {3, 5, 7, 10} = nx2 Using Progression px2;
Transfinite Curve {11, 14, 16, 18} = ny Using Progression py1;
Transfinite Curve {13, 15, 17, 20} = ny Using Progression py2;
Transfinite Curve {12, 26, 22, 2, 25, 21, 19, 28, 24, 9, 27, 23} = nc Using Progression pc1;
Transfinite Curve {29, 30, 31, 32} = nc Using Progression pc2;

Curve Loop(1) = {11, 4, -14, -1};
Plane Surface(1) = {1};
Curve Loop(2) = {2, 16, 25, -14};
Plane Surface(2) = {2};
Curve Loop(3) = {3, 18, -5, -16};
Plane Surface(3) = {3};
Curve Loop(4) = {4, 26, -6, -12};
Plane Surface(4) = {4};
Curve Loop(5) = {26, -31, -22, 30};
Plane Surface(5) = {5};
Curve Loop(6) = {25, -30, -21, 29};
Plane Surface(6) = {6};
Curve Loop(7) = {23, 32, -27, -31};
Plane Surface(7) = {7};
Curve Loop(8) = {29, -28, -32, 24};
Plane Surface(8) = {8};
Curve Loop(9) = {5, 19, -7, 28};
Plane Surface(9) = {9};
Curve Loop(10) = {6, 15, -8, -13};
Plane Surface(10) = {10};
Curve Loop(11) = {27, 17, -9, -15};
Plane Surface(11) = {11};
Curve Loop(12) = {7, 20, -10, -17};
Plane Surface(12) = {12};

Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Transfinite Surface {5};
Transfinite Surface {6};
Transfinite Surface {7};
Transfinite Surface {8};
Transfinite Surface {9};
Transfinite Surface {10};
Transfinite Surface {11};
Transfinite Surface {12};


//+
Recombine Surface {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12};
//+
Extrude {0, 0, 1} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Surface{5}; Surface{6}; Surface{8}; Surface{7}; Surface{9}; Surface{10}; Surface{11}; Surface{12}; Layers {1}; Recombine;
}


//+
Physical Surface("inlet", 297) = {41, 119, 251};
Physical Surface("outlet", 298) = {89, 221, 287};
Physical Surface("top", 299) = {53, 63, 85};
Physical Surface("bottom", 300) = {247, 269, 291};
Physical Surface("cylinderWall", 301) = {159, 137, 195, 185};
Physical Surface("frontAndBack", 302) = {54, 1, 76, 2, 98, 3, 120, 4, 142, 5, 164, 6, 186, 8, 208, 7, 230, 9, 252, 10, 274, 11, 296, 12};
Physical Volume("fluid", 303) = {1, 2, 3, 4, 6, 5, 8, 7, 9, 10, 11, 12};



