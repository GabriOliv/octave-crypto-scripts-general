function Prime = miller_rabin_test(n);
%   220 as 22 55,
% n -> n-1 = (2^s) * d

  A = n-1;
  B = A;
  s = 0;
    
  %Enquanto A for Inteiro
  while(abs(mod(A,1)) == 0)
    A = A / 2;
    %Se Divide sem Resto
    if(abs(mod(A,1)) == 0)
      s++;
    endif
    d = A*2;
  endwhile
  
  %Random [1 < a <= n-1]
  a = randi(B-1);
  a++;
  a = 350

  printf ("\n\nNumero n: %d\n",n);
  printf ("Numero n-1: %d\n",B);
  printf ("\nn -> n-1 = (2^s) * d \n",n);
  printf ("s = %d\n",s);
  printf ("d = %d\n",d);
  printf ("\n%d -> %d = (2^%d) * %d\n",n,B,s,d);
  printf ("\nRandom [a] = %d\n",a);

  %Primo Bool
  Prime = 0;

  printf ("\nCalculo Test 0\n",i);
  printf ("\n\t%d^%d mod %d\n",a,d,n);
  C = expcalc(a, d, n)
  if(C == mod(1,n))
    Prime = 1
  endif

  for i = 1 : s
    k = 2^(i-1) * d;
    printf ("\nCalculo Test %d\n",i);
    printf ("\t%d^((2^%d) * %d) mod %d\n",a,i-1,d,n);
    printf ("\t%d^%d mod %d\n",a,k,n);
    %a^k mod n
    C = expcalc(a, k, n)
    if(C == B)
      Prime = 1
    endif
  endfor

  Prime

endfunction
