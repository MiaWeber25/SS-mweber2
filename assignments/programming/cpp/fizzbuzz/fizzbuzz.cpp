#include <iostream>
#include <cassert>
#include "fizzbuzz.h"


int test() {
    int i = 2;
    int j = 3;
    int k = 7;
    std::string expected = "7";
    assert (fizzbuzz(i,j,k) == expected);

    k=3;
    expected = "Buzz";
    assert (fizzbuzz(i,j,k) == expected);

    k=4;
    expected = "Fizz";
    assert (fizzbuzz(i,j,k) == expected);

    k=6;
    expected = "FizzBuzz";
    assert (fizzbuzz(i,j,k) == expected);

    std::cerr << "all unit tests passed." << std::endl;
    return 0;
}


int main(int argc, char* argv[]) {
   if (argc > 1 && std::string(argv[1]) == "test") {
        test();
   } else {
    int x, y, z;
    std::cin >> x;
    std::cin >> y;
    std::cin >> z;
    std::string result;
    for (int i=1; i<=z; i++) {
        result = fizzbuzz(x,y,i);
        std::cout << result << std::endl;
    }
   }
    return 0;
}





