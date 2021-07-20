// Gmsh project created on Mon Jul 19 22:58:51 2021
//+
d = DefineNumber[ 1.0, Name "Parameters/diameter" ];
//+
cos45 = DefineNumber[ 0.707106781186, Name "Parameters/cosine45" ];
nx1 = 41;
nx2 = 81;
ny = 41;
nc = 31

//+
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
