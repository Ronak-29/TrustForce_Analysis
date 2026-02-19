clc;
clear;
format short e

% Material Properties
E = 210e9;
A = 0.001;

% Node Coordinates
nodes = [0 0;
         1 0;
         0.5 0.866];

% Element Connectivity
elements = [1 2;
            2 3;
            1 3];

n_nodes = size(nodes,1);
n_dof = 2*n_nodes;

K = zeros(n_dof);

% Assembly of Global Stiffness Matrix
for e = 1:size(elements,1)
    
    n1 = elements(e,1);
    n2 = elements(e,2);
    
    x1 = nodes(n1,1); y1 = nodes(n1,2);
    x2 = nodes(n2,1); y2 = nodes(n2,2);
    
    L = sqrt((x2-x1)^2 + (y2-y1)^2);
    c = (x2-x1)/L;
    s = (y2-y1)/L;
    
    k = (A*E/L)*[ c^2   c*s  -c^2  -c*s;
                  c*s   s^2  -c*s  -s^2;
                 -c^2  -c*s   c^2   c*s;
                 -c*s  -s^2   c*s   s^2];
             
    dof = [2*n1-1 2*n1 2*n2-1 2*n2];
    
    K(dof,dof) = K(dof,dof) + k;
end

disp('Global Stiffness Matrix:');
disp(K);

% Load Vector
F = zeros(n_dof,1);
F(6) = -10000;   % Load at node 3 in Y-direction

% Boundary Conditions (Node 1 fixed)
fixed_dof = [1 2];
free_dof = setdiff(1:n_dof,fixed_dof);

K_reduced = K(free_dof,free_dof);
F_reduced = F(free_dof);

% Solve for Displacements
U = zeros(n_dof,1);
U(free_dof) = K_reduced \ F_reduced;

disp('Nodal Displacements (meters):');
disp(U);

% Calculate Member Forces
for e = 1:size(elements,1)
    
    n1 = elements(e,1);
    n2 = elements(e,2);
    
    x1 = nodes(n1,1); y1 = nodes(n1,2);
    x2 = nodes(n2,1); y2 = nodes(n2,2);
    
    L = sqrt((x2-x1)^2 + (y2-y1)^2);
    c = (x2-x1)/L;
    s = (y2-y1)/L;
    
    dof = [2*n1-1 2*n1 2*n2-1 2*n2];
    Ue = U(dof);
    
    F_member = (A*E/L)*[-c -s c s]*Ue;
    
    fprintf('Member %d Force (N): %e\n', e, F_member);
end

