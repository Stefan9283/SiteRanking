
#### genMatrix

Returneaza doua matrici dintre care K este cea care contine numarul
de link-uri pentru site-ul i pe pozitia i,i si matricea M in care pe fiecare
linie i sunt stocate site-urile spre care i are link-uri

#### GS

Genereaza matricile Q si R pe baza algoritmului Gram-Schmidt aplicat unui A.

#### SST

Returneaza un vector w solutie a sistemului liniar A * w = b cu A
superior triunghiulara.

#### Iterative

Se citesc atat matricile M si K cu ajutorul functiei genMatrix cat si
numarul de noduri N. Se initializeaza primul vector R (cel vechi) cu
1 / N pe toate pozitiile. Se inverseaza K apoi se afla ultima matrice M
care contine 1 / numarul de link-uri ale paginii i acolo unde exista link
de la i catre o pagina j si respectiv 0 atunci cand nu exista.
Relatia de recurenta folosita este R(t + 1) = d * M * R(t) + (1 - d) / N. Se genereaza in
mod iterativ noi vectori R si se calculeaza norma dintre doua iteratii
consecutive. Cand aceasta este mai mica decat eroarea dorita se poate returna
vectorul R aflat la penultima iteratie pe motiv ca primul R este aflat inaintea
lantului de iteratii (linia 19).

#### Algebraic

Prin trecere la limita a formulei de recurenta folosita in metoda iterativa
se obtine ca R = (I - d * M) ^ -1 * (1 - d) / N. Se citesc M, K si N. In K se retine
inversa lui iar apoi cu ajutorul functiei PR_Inv se afla inversa lui I-d*M
si se retine in B. R se afla folosind formula B * (1 - d) / N

#### PageRank

Se retin rezultatele returnate de cele doua metode descrise mai sus in vectorii
PR1 si respectiv PR2. Se citesc numarul de site-uri N si cele doua valori val1
si val2 din fisierul de intrare. Se genereaza o matrice care contine pe prima
coloana numerele de la 1 la N si pe a doua valorile corespunzatoare site-urilor
de la 1 la N din PR1. Pe fiecare positie din a doua coloana se retine valoarea
returnata de functia Apartenenta(). Cu ajutorul functiei sortrows se sorteaza
vectorul PR3 dupa a doua coloana. Se deschide cu drepturi de write fisierul
de output si se adauga N. In cele din urma in modul append se scriu vectorii
PR1, PR2 si PR3.