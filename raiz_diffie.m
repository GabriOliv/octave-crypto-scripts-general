%Calculo de Raiz de Diffie_Hellman
function y = raiz_diffie(a, b)
%  a Numero Testado
%  b Modulo
  X = [];

  for i = 1 : b-1
    X(1,i) = i;
  endfor

  Y = X;

  if(a == 1)
    for i = 1 : b-1
      Y(1,i) = 1;
    endfor

  else
    for i = 1 : b-1
      Y(1,i) = expcalc(a, X(1,i), b);
    endfor

  endif

  printf ("\nRaizes de %d mod %d\n",a,b);
  for i = 1 : b-1
    printf ("%d  ",Y(1,i));
  endfor

  
  y = 1;
  for i = 1 : (b-1)
    for j = (i+1) : (b-1)
      if(Y(1,i) == Y(1,j))
        y = 0;
      endif
    endfor
  endfor

  printf ("\n");

endfunction
