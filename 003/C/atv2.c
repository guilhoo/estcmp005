/*2) Faça um Programa que peça dois números e imprima o maior deles.*/

#include<stdio.h>

int main(){

    float n1, n2;
    scanf("%f %f", &n1, n2);

    if (n1 > n2){
        printf("O numero %.2f e maior", n1);
    }
    else{
        printf("O numero %.2f e maior", n2);
    }
    


    return 0;
}