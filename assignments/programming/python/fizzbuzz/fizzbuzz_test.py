from main import fizzbuzz

def test():
    assert fizzbuzz(2,3,7) == "7"
    assert fizzbuzz(2,3,6) == "FizzBuzz"
    assert fizzbuzz(2,3,2) == "Fizz"
    assert fizzbuzz(2,3,3) == "Buzz"
   
    print('all test cases passed...')

if __name__ == '__main__':
    test()