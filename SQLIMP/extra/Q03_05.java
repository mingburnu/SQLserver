/*
5.  由程式印出九九乘法表。 
*/
public class Q03_05 {  
   public static void main(String [] args){
	   int sum = 0;
	   for(int x = 1; x <= 9; x = x + 1){
	        for(int y = 1; y <= 9; y = y +1){
	           sum = y * x;
	           System.out.print(y + "X" + x + "=" + 
	           ((sum <= 9 ? " " + sum : "" + sum) + "   "));
	        }
	        System.out.println();
       }
  } 
}