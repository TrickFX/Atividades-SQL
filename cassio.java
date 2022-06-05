/*
Escreva um programa que leia um valor e imprima todas as possíveis combinações em
que o lançamento de um par de dados tenha como resultado da soma dos valores dos
dados o número lido. Por exemplo, se a entrada for o número 7, o programa deve
imprimir as seguintes combinações:
• 1 6
• 2 5
• 3 4
• 4 3
• 5 2
• 6 1
*/
public class cassio {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int num = sc.nextInt();
        int i = 1;
        int j = num;
        while (i <= num) {
            while (j >= 1) {
                System.out.println(i + " " + j);
                j--;
            }
            i++;
            j = num;
        }
    }
}
