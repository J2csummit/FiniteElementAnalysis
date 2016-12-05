function [ s0, sL ] = getStress( d, l, v1, v2, d1, d2 )
%getStress get stresses at end nodes of each sub section

ymax = d/2;
E = 10*10^6;
s0 = ymax*E*( ( (6/(l^2)) * (v2 - v1) ) - ( (2/l) * (2*d1 - d2) ) );
sL = ymax*E*( ( (6/(l^2)) * (v1 - v2) ) - ( (2/l) * (2*d2 - d1) ) );

end

