#include <iostream>
#include <string>

/*std::string hello() {
    return "Hello World!";
}*/

std::string fizzbuzz(int &x, int &y, int &i) {
    if (i%x == 0 && i%y == 0) {
       //std::cout << "FizzBuzz" << std::endl;
       return "FizzBuzz";
    } else if (i%x == 0) {
        //std::cout << "Fizz" << std::endl;
        return "Fizz";
    } else if (i%y == 0) {
        //std::cout << "Buzz" << std::endl;
        return "Buzz";
    } else {
        //std::cout << i << std::endl;
        return std::to_string(i);
    }
}