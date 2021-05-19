#include <iostream>

using namespace std;

int main() {

    float first_note = 0.0f;
    float second_note = 0.0f;
    float media = 0.0f;
    float final_test_note = 0.0f;
    float final_media = 0.0f;

    cout << "Digite a primeira parcial:";
    cin >> first_note;

    cout << "Digite a segunda parcial:";
    cin >> second_note;

    media = (first_note + second_note) / 2;

    if (media >= 8) cout << "Aprovado";
    else {
        cout << "Digite a nota final:";
        cin >> final_test_note;

        final_media = (final_test_note + media) / 2;

        if (final_media >= 6) cout << "Aprovado";
        else cout << "Reprovado";


    }

    return 0;
}
