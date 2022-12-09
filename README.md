# VOM-Task

 # Questions And Answers

I. Add arithmetic operators (add, subtract, multiply, divide) to make the following expressions
true. You can use any parentheses you’d like.
3 1 3 9 = 12
 
 solution: (3 + 1) * 9 / 3 = 12
 
 
 II. Write a function/method utilizing Swift to determine whether two strings are anagrams or not
(examples of anagrams: debit card/bad credit, etc.)

solution: 
   ```
   func anagramChecker(string1: String, string2: String) -> Bool {
        if string1.count != string2.count {
            return false
        } else {
            return string1.sorted() == string2.sorted()
        }
     }
```
 
 III. Write a method in Swift to generate the nth Fibonacci number (1, 1, 2, 3, 5, 8, 13, 21, 34)
     A. recursive approach
     B. iterative approach
     
  solution: 
       A. recursive approach
       ```
        func generateFibonacciRecursive(n: Int) -> [Int] {
        
        var result: [Int] = []
        
        for n in 0 ... n {
            
            if n == 0 {
                result.append(0)
            }
            else if n == 1 {
                result.append(1)
            }
            else {
                result.append (result[n-1] + result[n-2] )
            }
        }
        return result
    }
       ```
       B. iterative approach
       
        ```
        
        ```
       
  
