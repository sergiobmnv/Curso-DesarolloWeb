package metodos;

import java.util.Scanner;

public class Dia_laboral_refactor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// TODO Auto-generated method stub
		Scanner Reader = new Scanner(System.in);
		System.out.println("Introduzca un día de la semana:");
		String DIA=Reader.next();
		
		//comprobamos si el día introducido es laboral o no
		String Resultado="";
		
		switch (DIA) {
			case "lunes":
			case "martes":
			case "miercoles":
			case "jueves":
			case "viernes":
				Resultado= "Es un día laboral";
			case "sabado":
			case "domingo":
				Resultado="Es un día no laboral";
			default:
				Resultado="Introduzca un día de la semana:";
		}
		
		//calculamos el área de una circunferencia dado su radio
		System.out.println("Introduzca el radio de la circunferencia:");
		String RadioCirc=Reader.next();
		double area;
		double r=Double.valueOf(RadioCirc);
		area = 3.14 * Math.pow(r, 2);

	}

}
