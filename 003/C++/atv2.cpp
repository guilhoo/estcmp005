#include <iostream>

using namespace std;

int main() {
    int first_number = 0;
    int second_number = 0;

    cout << "Digite o primeiro número: ";
    cin >> first_number;

    cout << "Digite o segundo número: ";
    cin >> second_number;

    if (first_number > second_number) {
        cout << first_number << endl;
    } else {
        cout << second_number << endl;
    }

    return 0;
}
