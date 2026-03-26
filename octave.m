% Factorizacion LU con Entradas de Usuario
clear; clc;

% 1. Entradas del usuario
fprintf('--- Factorizacion LU (Metodo de Gauss) ---\n');
A = input('Ingrese la matriz A entre corchetes [f1; f2; f3]: ');
b = input('Ingrese el vector b entre corchetes [b1; b2; b3]: ');

[n, m] = size(A);
L = eye(n); % Crea matriz identidad para L
U = A;      % Inicializa U como una copia de A

% 2. Proceso de Descomposicion
for i = 1:n-1
    for j = i+1:n
        % Calcular el factor (multiplicador)
        factor = U(j,i) / U(i,i);
        L(j,i) = factor;
        
        % Eliminar en la fila actual de U
        U(j,i:n) = U(j,i:n) - factor * U(i,i:n);
        
        % Mostrar paso intermedio (opcional)
        fprintf('\nEliminando posicion (%d,%d) con factor f = %.4f\n', j, i, factor);
    end
end

% 3. Resolucion del sistema (Sustitucion)
% Ly = b
y = L\b;
% Ux = y
x = U\y;

% 4. Mostrar Resultados
fprintf('\n--- MATRIZ L (Inferior) ---\n');
disp(L);

fprintf('--- MATRIZ U (Superior) ---\n');
disp(U);

fprintf('--- SOLUCION FINAL (x) ---\n');
fprintf('x1 = %.4f\n', x(1));
fprintf('x2 = %.4f\n', x(2));
fprintf('x3 = %.4f\n', x(3));