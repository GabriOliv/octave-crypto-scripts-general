%entrada
%n = numero do intervalo
%phin = phi de euler do numero n
function rsa_key_inv(n,phin);

  p_mais_q = phin -1;
  p_mais_q = (p_mais_q - n) * (-1);

  list_p = primes(p_mais_q);
  A = size(list_p);

  printf ("\nn = %d\nphi(n) = %d\n",n,phin);
  printf ("\n(p-1) x (q-1) = %d",phin);
  printf ("\np + q = %d - %d\n",phin,n);
  printf ("p + q = %d\n",p_mais_q);
  printf ("\nIntervalo de Valores Primos\nPossiveis dentro de %d: %d\n",p_mais_q,A(1,2));
  
  printf ("\n\np x q = %d\n",n);
  printf ("p + q = %d\n",p_mais_q);
  printf ("n mod p = 0\nn mod q = 0\n");

  for i = 2 : (A(1,2))
    B = n / list_p(1,i);
    if(abs(mod(B,1)) == 0)
      p = list_p(1,i);
      q = B;
      printf ("\n\nDecomposicao: \n\tp = %d\t q = %d\n",p,q);
      return
    endif
  endfor

endfunction