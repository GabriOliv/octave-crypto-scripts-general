%Calculo Resto Chines
function x0 = restoC(A,B)

%Ex:
  %Coeficientes
    %A = [2,3,2]
  %Modulos (coprimos dois a dois)
    %B = [3,5,7]

  [o,m] = size(A);
  [o,n] = size(B);
  %ERRO de tamanhos diferentes
  if(m != n)
    disp ("restoC ERRO: Tamanho das Matrizes Incoerentes");
    return;
  endif

  %Retorno de Equacoes
  for i = 1: n
      printf("\nX = %d (mod %d)",A(1,i),B(1,i));    
  endfor

  %Test B coprimos MDC
  mdc = 1;
  TestMDC = 0;
  for i = 1: n
    for j = i: n
      if(i != j)
        mdc = gcd( B(1,i) , B(1,j) );
      endif
      if(mdc != 1)
        TestMDC++;
      endif
    endfor
  endfor

  %Calculo Resto Chines
  if(TestMDC != 0)
    disp ("restoC(A,_) ERRO: Elementos de B devem ser Coprimos");
    return;
  else
    %Retorna M
    M0 = 1;
    printf("\n\tM = ");
    for i = 1: n
      M0 *= B(1,i);
      printf("%d",B(1,i));
      if(i != n)
        printf(" * ");
      else
        printf(" = %d\n\n",M0);
      endif
    endfor

    %Retorna Ms
    M = [];
    for i = 1: n
      M(1,i) = M0/ B(1,i);
      printf("M%d = %d / %d = %d\n",i,M0,B(1,i),M(1,i));
    endfor

    %Retorna Equacao Sem Inverso
    x0 = 0;
    Inv = [];
    for i = 1: n
      printf("\n\nC%d = %d * %d * %d^-1",i,A(1,i),M(1,i),M(1,i));
      Inv(1,i) = Inv_M(M(1,i),B(1,i));
      printf("\n\t\t%d^-1 = %d",M(1,i),Inv(1,i));
    endfor

    %Retorna Soma Parcial
    printf("\n\n");
    x0 = 0;
    T = [];
    for i = 1: n
      T(1,i) =  A(1,i) * M(1,i) * Inv(1,i);
      x0 += T(1,i);
      printf("\nC%d = %d * %d * %d = %d",i,A(1,i),M(1,i),Inv(1,i),T(1,i));
    endfor

    %Retorna Soma Final
    printf("\n\n");
    for i = 1: n
      printf(" %d ",T(1,i));
      if(i != n)
        printf("+");
      else
        printf(" = %d\n",x0);
      endif
    endfor

    %Retorna Modular
    x4 = mod(x0,M0);
    printf("\n X = %d(mod %d) = %d\n\n",x0,M0,x4);
    x0 = x4;
  endif

endfunction

%Funcao IMM (Inverse Multiplative Modular)
function IMM = Inv_M(A,B)

  %Variavel de Inverso Multiplicativo Modular
  IMM = 0;
  mmc = 0;
  %Variaveis Constante
  Ar=A;
  Br=B;

  %Vetores:
  M = [];   %Main
  n = [];   %numero multiplo
  S = [];   %Substituivel
  R = [];   %Resto

  %Contador de Equacoes
  i=0;  j=0;
  %Calculo do MMC em Passos
  %Saida de Fatoracao
  while ((A != 0) && (B != 0))
    printf ("\n\tmdc(%d , %d)",A,B);
    if (A > B)
      i++;
      printf ("\t = mdc(%d mod %d , %d)",A,B,B);
      M(1,i) = A;
      S(1,i) = B;
      n(1,i) = fix(A/B);
          A = mod(A,B);
      R(1,i) = A;
    elseif (A < B)
      i++;
      printf ("\t = mdc(%d , %d mod %d)",A,B,A);
      M(1,i) = B;
      S(1,i) = A;
      n(1,i) = fix(B/A);
          B = mod(B,A);
      R(1,i) = B;
    endif

    if (A == 0)
      mmc = B;
      printf ("\n\tmdc(%d , %d) = %d",A,B,B);
    elseif (B == 0)
      mmc = A;
      printf ("\n\tmdc(%d , %d) = %d",A,B,A);
    endif
  endwhile

  %Calculo do IMM
  if (mmc == 1)
    %Variaveis de Calculo IMM
    a = Ar;
    b = Br;
    x = 1;
    y = 0;
    if (Br == 1)
      return;
    endif

    %Algoritmo de Calculo
    while (a > 1)
      q = fix(a / b);
      t = b;

      b = mod(a,b);
      a = t;
      t = y;

      y = x - q * y;
      x = t;
    endwhile

    IMM = x;
    if (IMM < 0)
      IMM = IMM + Br;
    endif

  elseif
    printf ("\n\nN�o Existe %d^-1 mod %d\n",Ar,Br);
    disp ("IMM ERRO: IMM nao pode ser Calculado");
  endif

  %Saida de Equacoes
  while ((i > 1) && (mmc == 1))
    i--;  j++;
    %Equacao Reduzida
    printf ("\nEQ%d: %d = %d -%d x %d ",j,R(1,i),M(1,i),n(1,i),S(1,i));
  endwhile

endfunction
