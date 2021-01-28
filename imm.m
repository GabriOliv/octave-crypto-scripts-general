%Funcao IMM (Inverse Multiplative Modular)
function IMM = imm(A,B)

  %Variavel de Inverso Multiplicativo Modular
  IMM = 0;
  mdc = 0;
  %Variaveis Constante
  Ar=A;
  Br=B;

  %Erro de Parametros
  if ((A <= 0) || (B <= 0))
    disp ("IMM ERRO: Valor fora do intervalo do Modulo");
    disp ("IMM ERRO: IMM nao pode ser Calculado");
    return;
  endif

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
    printf ("\nmdc(%d , %d)",A,B);
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
      mdc = B;
      printf ("\nmdc(%d , %d) = %d",A,B,B);
    elseif (B == 0)
      mdc = A;
      printf ("\nmdc(%d , %d) = %d",A,B,A);
    endif
  endwhile

  %Saida de MMC
  printf ("\n\nMDC = %d",mdc);

  %Calculo do IMM
  if (mdc == 1)
    printf ("\n\nExiste %d^-1 mod %d\n",Ar,Br);
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
    printf ("\n\nNao Existe %d^-1 mod %d\n",Ar,Br);
    disp ("IMM ERRO: IMM nao pode ser Calculado");
  endif

  %Saida de Equacoes
  while ((i > 1) && (mdc == 1))
    i--;  j++;
    %Equacao Reduzida
    printf ("\n\tEQ%d: %d = %d -%d x %d ",j,R(1,i),M(1,i),n(1,i),S(1,i));
  endwhile

  %Saida de IMM
  printf ("\n\nIMM = %d\n\n",IMM);

endfunction
