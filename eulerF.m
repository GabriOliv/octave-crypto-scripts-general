%Funcao Phi de Euler
function A = eulerF(a)

  %Numero Composto
  B = a;
  %Divisores
  D = [];
  %Expoente
  N = [];

  %Contadores
  i = 2;  %Divisor
  j = 1;  %Numero de Divisoes
  k = 1;  %Matrix

  %Saida de Decomposicao
  printf ("\nDecomposicao\n");
  while (B > 1)
    if (mod(B,i) == 0)
      printf ("\t%d\t | %d\n",B,i);
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
  printf ("\t%d\t |\n",1);

  [m,n] = size(D);
  %Saida de Composicao
  printf ("\nComposicao\n");
  i = n;
  printf ("\n\t%d = ",a);
  while (i > 0)
    printf (" %d^%d ",D(1,i),N(1,i));
    i--;
    if (i > 0)
      printf ("*");
    else
      printf ("\n");
    endif
  endwhile

  %Saida de Equacao de Funcao
  printf ("\nFuncao de Euler\n");
  i = n;
  printf ("\n\tE = ");
  while (i > 0)
    printf ("(%d^%d - %d^%d)",D(1,i),N(1,i),D(1,i),N(1,i)-1);
    i--;
    if (i > 0)
      printf ("*");
    else
      printf ("\n");
    endif
  endwhile

  %Calculo Final de E
  A = (D(1,1) ^ N(1,1)) - (D(1,1) ^ (N(1,1)-1));
  i = n;
  while (i > 1)
    A = A * ((D(1,i) ^ N(1,i)) - (D(1,i) ^ (N(1,i)-1)));
    i--;
  endwhile

  E = (D(1,1) ^ N(1,1)) - (D(1,1) ^ (N(1,1)-1));
  i = 1;
  printf ("\n\tE = %d",E);
  while (i <= n)
    E = ((D(1,i) ^ N(1,i)) - (D(1,i) ^ (N(1,i)-1)));
    if (i > 1)
      printf (" * %d",E);
    endif
    i++;
  endwhile
  %Saida de E
  printf ("\n\n\tE(%d) = %d\n\n",a,A);

endfunction
