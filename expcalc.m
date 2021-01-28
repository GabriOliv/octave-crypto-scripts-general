%Calculo de Expoente Modular
function y = expcalc(a, b, n)
  %a^b mod n
  %Numero Composto
  B = a;
  %Divisores
  D = [];
  %Expoente
  N = [];

  i = 2;  %Divisor inicial
  j = 1;  %Numero de Divisoes
  k = 1;  %Matrix
  B = a;  %Numero Base

%  printf ("\nDecomposicao\n");
  while (B > 1)
    if (mod(B,i) == 0)
%      printf ("\t%d\t | %d\n",B,i);
      D(1,k) = i;
      N(1,k) = j;
      B = B/i;
      j++;
    else
      i++;
      if (j>1)
        k++;
      endif
      j=1;
    endif
  endwhile
%  printf ("\t%d\t |\n",1);

  %Valor Final
  y = 1;
  %Modulo dos Fatores
  i = k;

  while(i > 0)
    for j = 1 : N(1,i)
      for l = 1 : b
        y = y * D(1,i);
        y = mod(y , n);
      endfor
    endfor
    i = i-1;
  endwhile

endfunction
