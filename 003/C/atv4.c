/*Faça um programa que resolva a MÉDIA DA UEA*/

#include<stdio.h>

int main(){

    float nota1, nota2, media, pf, mediafinal;
    scanf("%f %f", &nota1, nota2);

    media = (nota1 + nota2)/2;

    if (media >= 8){
        printf("Não fez mais que sua obrigação, neném");
    
    }
    else{
        scanf("%f", &pf);
        mediafinal = (media + pf)/2;

        if (mediafinal >= 6){
            printf("Quase ein, neném");
        }
        else printf("Te vejo semestre que vem");
        
    }
    

    return 0;
}