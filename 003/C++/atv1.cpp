#include <iostream>

using namespace std;

int main() {
    int inferior_limit = 0;
    int superior_limit = 0;

    cout << "Digite o intervalo inferior: ";
    cin >> inferior_limit;

    cout << "Digite o intervalo superior: ";
    cin >> superior_limit;

    for (int i = inferior_limit + 1; i < superior_limit; i++ ){
        cout << i << endl;
    }

    return 0;
}
