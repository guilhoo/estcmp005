/*Faça um programa que receba dois números inteiros e gere os números 
inteiros que estão no intervalo compreendido por eles.*/

#include<stdio.h>

int main(){
    
    int a, b;
    scanf("%d %d", &a, &b);

    if (a < b){
        for (int i = a+1; i < b; i++){
            printf("%d ", i);
        }
    }
    else{
        for (int i = a-1; i > b; i--){
           printf("%d ", i);
        }   
    }
    
    return 0;
}