# TCC2

Luiz Fernando Gomes de Oliveira
2015.2
-----

# O que é o APT

-----

## Contextualização

 - Dificuldade em localização dos pacotes desejados.
 - Sem opções de ordenação.
 - Sem suporte para string matching
 - Sem clareza da forma como os pacotes foram ordenados.

-----

### APT e suas interfaces

	#### apt-cache

	apt-cache search <pacote>

	#### aptitude

	aptitude search <pacote>

	#### apt (CLI)

	apt search <pacote>


:note:
# aptitutde
 - install size
 - install size change
 - deb size
 - name
 - version
 - priority

## Expressões regulares

-------

# Evolução proposta

 - Oferecer opções de ordenação para interface CLI
 - Gerar resultados de pesuisas inexatas
 - Otimizar o modelo de ordenação atual

-----

# Novas interfaces de ordenação

 - Reverse Alphabetic
 - Status/Priority
 - Version

-----

# Algoritmos de ordenação exatos

 - **Rabin Karp**
 - KMP

------  

# Algoritmos de ordenação exatos

 [gráfico]

------  

# Algoritmos de ordenação inexatos

 - **Levenshtein**
 - Damerau-Levenshtein
 - Sørensen–Dice

-----

# Algoritmos de ordenação inexatos

 [gráfico]

------  

# Solução final oferecida

 - Identificação de expressão regular no termo de busca
 - disponibilidade de uso de expressão regular
 - disponibilidade de uso de busca exata
 - para soluções vazias, é retornado uma lista de possiveis 10 candidatos mais próximos

-------

# Iteração com grupo APT

-------

# Obrigado!