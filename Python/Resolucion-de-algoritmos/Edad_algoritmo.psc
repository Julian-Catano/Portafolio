Algoritmo Edad_algoritmo
	definir dia, mes, a�o, dia_n, mes_n, a�o_n, edad como entero
	escribir"Ingrese su fecha de nacimiento"
	escribir "Dia: ";leer dia_n
	escribir "Mes: ";leer mes_n
	escribir "A�o: ";leer a�o_n
	escribir "Ingrese la fecha de hoy"
	escribir "Dia: ";leer dia
	escribir "Mes: ";leer mes
	escribir "A�o: ";leer a�o
	si mes >= mes_n Entonces
		si dia >= dia_n Entonces
			edad = a�o-a�o_n
			escribir "Su edad actual es: ",edad
		SiNo
			edad = a�o-a�o_n-1
			escribir "Su edad actual es: ",edad
		FinSi
	SiNo
		edad = a�o-a�o_n-1
		escribir "Su edad actual es: ",edad
	FinSi

FinAlgoritmo
