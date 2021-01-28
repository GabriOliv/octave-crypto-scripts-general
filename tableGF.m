%GF(x) Table Gerador
function [B,C] = tableGF(A)
%B = Tabela Soma
%C = Tabela Multiplicacao

  a = A-1;
  B = zeros(A,A);
  C = B;

  for i = 0: a
    for j = 0: a
      B((i+1),(j+1)) = mod((i+j) , A);
    endfor
  endfor

  for i = 0: a
    for j = 0: a
      C((i+1),(j+1)) = mod((i*j) , A);
    endfor
  endfor

  printf ("\n\tTabela Adicao:\n");
  B
  printf ("\n\tTabela Multiplicacao:\n");
  C

  Im1 = zeros (A,A, "uint8");
  Im2 = Im1;

  for i = 1: A
    for j = 1: A
      Im1(i,j) = (B(i,j) * 255)/A;
      Im2(i,j) = (C(i,j) * 255)/A;
    endfor
  endfor

  subplot (2, 1, 1)
  imshow(Im1);
  subplot (2, 1, 2)
  imshow(Im2);

  B = Im1;
  C = Im2;
endfunction
