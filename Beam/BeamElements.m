%% Homework Beam Elements %%

% For each beam shown in the associated figure, compute the deflection at
% the element nodes. The modulus of elasticity is E = 10 x 10^6 psi and the
% cross section is as shwon in each figure. Also compute the maximum
% bending stress. Use the finite element method with the minimum number of
% elements for each case.

%% Problem 1 %%

syms d2 v3 d4 v5 d6 v7 d8

% Get individual node stiffness matrices
Ke1 = getKeCylinder(1.5, 10);
Ke2 = getKeCylinder(1.5, 8);
Ke3 = getKeCylinder(1.0, 8);

% Initialize Zero Matricies to prep node matricies for global matrix
zeros1 = zeros(4,4);
zeros2 = zeros(4,8);
zeros3 = zeros(4,2);
zeros4 = zeros(2,8);

% Prep first node
Ke1 = cat(2, Ke1, zeros1);
Ke1 = cat(1, Ke1, zeros2);

% Prep second node
Ke2 = cat(2, zeros3, Ke2);
Ke2 = cat(2, Ke2, zeros3);
Ke2 = cat(1, zeros4, Ke2);
Ke2 = cat(1, Ke2, zeros4);

% Prep thrid node
Ke3 = cat(2, zeros1, Ke3);
Ke3 = cat(1, zeros2, Ke3);

% Construct Global Matrix
Ke = Ke1 + Ke2 + Ke3
Ke(1,:) = [];
Ke(:,1) = [];

% Initialize Force Vector
F = [0;-500;0;0;0;-200; 400];

% Initialize System of Equations
eq1 = 1.0e+06 *(0.9940*d2 - 0.1491*v3 + 0.4970*d4) == 0;
eq2 = 1.0e+06 *(-0.1491*d2 - 0.0881*v3 + 0.0839*d4 - 0.0582*v5 + 0.2330*d6) == -500;
eq3 = 1.0e+06 *(0.4970*d2 + 0.0839*v3 + 2.2365*d4 - 0.2330*v5 + 0.6213*d6) == 0;
eq4 = 1.0e+06 *(-0.0582*v3 - 0.2330*d4 + 0.0697*v5 - 0.1870*d6 - 0.0115*v7 + 0.0460*d8) == 0;
eq5 = 1.0e+06 *(0.2330*v3 + 0.6213*d4 - 0.1870*v5 + 1.4880*d6 - 0.0460*v7 + 0.1227*d8) == 0;
eq6 = 1.0e+06 *(-0.0115*v5 - 0.0460*d6 + 0.0115*v7 - 0.0460*d8) == -200;
eq7 = 1.0e+06 *(0.0460*v5 + 0.1227*d6 - 0.0460*v7 + 0.2454*d8) == 400;

% Solve System of Equations
S = solve([eq1, eq2, eq3, eq4, eq5, eq6, eq7], [d2, v3, d4, v5, d6, v7, d8]);
d2 = double(S.d2)
v3 = double(S.v3)
d4 = double(S.d4)
v5 = double(S.v5)
d6 = double(S.d6)
v7 = double(S.v7)
d8 = double(S.d8)

% Obtain all node stresses
[S10, S1L] = getStress(1.5, 10, 0, v3, d2, d4)
[S20, S2L] = getStress(1.5, 8, v3, v5, d4, d6)
[S30, S3L] = getStress(1.0, 8, v5, v7, d6, d8)

%% Problem 2 %%

syms d1 v2 d2 d3

% Get individual node stiffness matrices
Ke1 = getKePrism(0.5, 0.5, 10);
Ke2 = getKePrism(0.5, 0.5, 10);

% Get individual forces and moments
f = 10*10/2;
m = (10*(10^2)/12)*3; % multiply by 3 because no moments on ends and symmetry

% Initialize Zero Matricies to prep node matricies for global matrix
zeros1 = zeros(4,2);
zeros2 = zeros(2,6);

% Prep first node
Ke1 = cat(2,Ke1,zeros1);
Ke1 = cat(1,Ke1,zeros2);

% Prep second node
Ke2 = cat(2,zeros1,Ke2);
Ke2 = cat(1,zeros2,Ke2);

% Construct Global Matrix
Ke = Ke1 + Ke2
Ke(5,:) = [];
Ke(:,5) = [];
Ke(1,:) = [];
Ke(:,1) = []

% Initialize Force Vector
F = [0;-f;m;0]

% Initialize System of Equations
eq1 = 1.0e+04 *(2.0833*d1 - 0.3125*v2 + 1.0417*d2) == 0;
eq2 = 1.0e+04 *(-0.3125*d1 + 0.1250*v2 + 0.3125*d3) == -50;
eq3 = 1.0e+04 *(1.0417*d1 + 4.1667*d2 + 1.0417*d3) == 250;
eq4 = 1.0e+04 *(0.3125*v2 + 1.0417*d2 + 2.0833*d3) == 0;

% Solve System of Equations
S = solve([eq1, eq2, eq3, eq4], [d1, v2, d2, d3]);
d1 = double(S.d1)
v2 = double(S.v2)
d2 = double(S.d2)
d3 = double(S.d3)

% Obtain all node stresses
[S10, S1L] = getStress(0.5, 10, 0, v2, d1, d2)
[S20, S2L] = getStress(0.5, 10, v2, 0, d2, d3)