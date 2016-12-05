function [ Ke ] = getKePrism( a, b, l )
%getKeCylinder Obtain the inertia of the beam
Ke = [12, 6*l, -12, 6*l;...
    6*l, 4*(l^2), -6*l, 2*(l^2);...
    -12, -6*l, 12, -6*l;...
    6*l, 2*(l^2), -6*l, 4*(l^2)];

E = 10*10^6;
I = (a*(b^3))/12;
k = E*I/(l^3);

Ke = Ke * k;

end