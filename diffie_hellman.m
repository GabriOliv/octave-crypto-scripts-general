%Diffie - Hellman
%Text-Like
function diffie_hellman(p,g,x,y)
  p_x = expcalc(g, x, p);
  p_y = expcalc(g, y, p);
  p_x_y = expcalc(p_y, x, p);
  p_y_x = expcalc(p_x, y, p);

  printf ("\t\t   Diffie-Hellman\n");

  printf ("\nPessoa [A]\t\t\t\tPessoa [B]\n");
  printf ("\nPublic Key\t\t\t\tPublic Key\n");
  printf ("[A](P,G): %d,%d\t\t\t\t[B](P,G): %d,%d\n",p,g,p,g);
  printf ("\nSecret Key\t\t\t\tSecret Key\n",x,y);
  printf ("[A](X): %d\t\t\t\t[B](Y): %d\n",x,y);

  printf ("\n\t\t     Synthesize");
  printf ("\nSwap Key--->\t\t\t\t<---Swap Key\n");
  printf ("[A](P_x): %d\t\t\t\t[B](P_y): %d\n",p_x,p_y);

  printf ("\n\t\t   Troca de Chave\n");
  printf ("[A](P): %d\t\t\t\t[B](P): %d\n",p,p);
  printf ("[A](x): %d\t\t\t\t[B](y): %d\n",x,y);
  printf ("[A](P_y): %d\t\t\t\t[B](P_x): %d\n",p_y,p_x);

  printf ("\n\t\t     Synthesize\n");
  printf ("[A](P_y_x): %d\t\t\t\t[B](P_x_y): %d\n",p_x_y,p_x_y);
  printf ("\n\n\n\n\n\n");

endfunction