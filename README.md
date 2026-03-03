Truss Joint Force Analysis  
 Direct Stiffness Method 

Project Overview
This project presents the analysis of a **2D planar truss** using the **Direct Stiffness Method (Global Stiffness Matrix Method)**.
The governing equilibrium equation is expressed in matrix form:

\[
[K][U] = [F]
\]

Where:

- **K** = Global stiffness matrix  
- **U** = Nodal displacement vector  
- **F** = Load vector  

The reduced stiffness matrix is solved using **MATLAB** to determine nodal displacements and internal member forces.

Objectives

- Assemble equilibrium equations and solve using simultaneous linear equations  
- Formulate structural equilibrium equations in matrix form  
- Assemble the global stiffness matrix from individual element stiffness matrices  
- Solve the reduced matrix system using MATLAB  

Structure Details

**Type:** 2D Pin-Jointed Truss  
**Material:** Steel  

- Young’s Modulus: `E = 29000 ksi`  
- Cross-Sectional Area: `A = 2 in²`  

Applied Loads

- 3 kips downward at Joint E  
- 2 kips downward at Joint F  
- 1 kip at 45° at Joint C  

Resolved at C:
- \( F_x = 0.707 \) kip  
- \( F_y = 0.707 \) kip  

Methodology

1. Define element stiffness matrix:

   \[
   k_e = \frac{AE}{L}
   \]

2. Assemble global stiffness matrix  
3. Apply boundary conditions  
4. Reduce matrix to \( K_r \)  
5. Solve:

   \[
   [K_r][U_r] = [F_r]
   \]

Results

Nodal Displacements (inches)

uE = 0.000000
vE = -0.002729
uF = 0.000000
vF = -0.002144
uD = 0.000000
uB = 0.000000
vB = 0.000000
uC = 0.002067
vC = -0.002067

Member Forces (kips)

| Member | Force | Nature |
|--------|--------|---------|
| AB | 4.10 | Compression |
| BE | 2.90 | Tension |
| BC | 5.60 | Compression |
| EC | 4.80 | Tension |
| CF | 1.00 | Tension |
| CD | 4.00 | Compression |
| AE | 2.70 | Tension |
| EF | 3.20 | Tension |
| FD | 2.00 | Tension |

