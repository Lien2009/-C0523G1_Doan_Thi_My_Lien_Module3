package model;

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
                try {
                    result = firstNum / secondNum;
                } catch (ArithmeticException e) {
                    System.out.println("Không chia cho 0!");
                }
        }
        return result;
    }
}
