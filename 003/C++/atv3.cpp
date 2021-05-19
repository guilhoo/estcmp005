#include <iostream>

using namespace std;

int main() {
    float temperature_in_celsius = 0.0f;
    float temperature_in_fahrenheit = 0.0f;

    cout << "Digite a temperatura em fahrenheit:";
    cin >> temperature_in_fahrenheit;

    temperature_in_celsius = 5 * ((temperature_in_fahrenheit - 32) / 9);

    cout << "A temperatura em celsius eh :";
    cout << temperature_in_celsius << endl;

    return 0;
}
