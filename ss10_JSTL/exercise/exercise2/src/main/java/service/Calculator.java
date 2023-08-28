package service;

public class Calculator {
    public static double calculate(double firstNum, double secondNum, char operator) {
        double result = 0;
        switch (operator) {
            case '+':
                result = firstNum + secondNum;
                break;
            case '-':
                result = firstNum - secondNum;
                break;
            case '*':
                result = firstNum * secondNum;
                break;
            case '/':
                if (secondNum != 0){
                    result = firstNum / secondNum;
                } else {
                    throw new ArithmeticException("Không chia cho 0!");
                }
        }
        return result;
    }
}
