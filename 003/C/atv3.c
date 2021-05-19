/*3) Faça um Programa que peça a temperatura em 
graus Fahrenheit, transforme e mostre a 
temperatura em graus Celsius.
C = 5 * ((F-32) / 9).*/

#include<stdio.h>

int main(){

    float celsius, fahr;

    scanf("%f", &fahr);

    celsius = 5 * ((fahr-32)/9);

    printf("%.2f", celsius);

    return 0;
}