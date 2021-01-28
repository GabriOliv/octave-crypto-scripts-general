# octave-crypto-scripts-general

### Usando os Scripts:

* Unzip os scripts
* Selecione a pasta no ambiente de trabalho do [Octave](https://www.gnu.org/software/octave/index)
* Chame no Terminal como no Exemplo

Exemplo 01:
```matlab
>> expcalc(15,4,50)
```
Exemplo 02:
```matlab
>> A = 15; B = 4; C = 50;
>> expcalc(A,B,C)
```

## Lista dos Scripts
Listagem dos Scripts do repositório

| Scripts | Descrição |
| ------ | ------ |
| expcalc.m | Cálculo de Expoente Modular criado para números grandes |
| raiz_diffie.m | Cálculo de Raiz Segura para uso em Diffie_Hellman |
| diffie_hellman.m | Cálculo das chaves Diffie Hellman |
| eulerF.m | Função Phi de Euler |
| imm.m | Inverso Multiplicativo Modular (Modular Multiplicative Inverse) |
| miller_rabin_test.m | Teste de Miller Rabin para Números Primos |
| restoC.m | Solução de Sistema de equações modulares por Algoritmo Chinês do Resto (Chinese remainder theorem) |
| rsa_key_inv.m | Seleciona Chaves viáveis em um intervalo de números para uso em RSA |
| tableGF.m | Gera tabela de soma e tabela de multiplicação de grupo em um intervalo de entrada, cria gráfico dos intervalos resultantes  |
