Proceso CalcularBaremo
	Definir via Como Entero;
	Definir Comunidad Como Caracter;
	Definir notaMedia Como Real;
	Definir anioTitulo Como Entero;
	Definir baremo Como Real;
	Dimension baremo[5];
	Escribir  " BAREMO APLICABLE EN LA ADMISIÓN A DICLOS FORMATIVOS DE GRADO SUPERIOR";
	Escribir 'Responde  1, 2  ó 3 B dependiendo del título o formación para el acceso: ";
	Escribir "1.- Bachiller, 2.- Grado Medio  3.-Otras vías';
	Leer via;
	Escribir 'Responde 1 si has cursado la modalidad en centros docentes de la Comunidad de Madrid';
	Escribir "2 fuera del ámbito de la Comunidad";
	Leer Comunidad;
	Escribir 'Escbribe la nota media del título';
	Leer notaMedia;
	Escribir 'Escribe el año del obtención del título: (aaaa)';
	Leer anioTitulo;
	baremo[0] <- CalculaNota(notaMedia);
	baremo[1] <- CalculaComunidad(Comunidad);
	baremo[2] <- CalculaAnio(anioTitulo);
	baremo[3] <- CalcularVia(via);
	Escribir "Las puntuaciones parciales son", baremo[0],' ',baremo[1],' ',baremo[2],' ',baremo[3];
	Escribir "La nota final del baremo es :", baremo[0] + baremo[1]+baremo[2]+baremo[3];
FinProceso

SubProceso valor <- CalcularVia(via)
	Definir valor Como Real;
	Definir respuesta Como Caracter;
	Segun via  Hacer
		1:
			
			Escribir 'Responde 1 si HAS CURSADO alguna de las modalidades de Bachiller del anexoIII';
			Escribir 'Responde 2 si NO  has cursado alguna de las modalidades de Bachiller del anexoIII';
			 
			Leer respuesta;
			Si (respuesta=="1") Entonces
				valor <- 5;
			SiNo
				valor <- 0;
			FinSi
		2:
			Escribir 'Responde 1 si HAS CURSADO  alguna de las modalidades de Grado Medio de la Familia';
			Escribir 'Responde 2 si NO has cursado  alguna de las modalidades de Grado Medio de la Familia';
			Leer respuesta;
			Si (respuesta=="1") Entonces
				valor <- 10;
			SiNo
				valor <- 0;
			FinSi
		3:
			valor <- 0;
		De Otro Modo:
			valor <- 0;
	FinSegun
FinSubProceso

SubProceso valor <- CalculaNota(notaMedia)
	Definir valor Como Real;
	notaMedia <- trunc(notaMedia);
	Segun notaMedia  Hacer
		9:
			valor <- 12;
		8:
			valor <- 11;
		7:
			valor <- 10;
		6:
			valor <- 8;
		5:
			valor <- 6;
		De Otro Modo:
			valor <- 0;
	FinSegun
FinSubProceso

SubProceso valor <- CalculaComunidad(Comunidad)
	Definir valor Como Real;
	Si Comunidad=='1' Entonces
		valor <- 12;
	SiNo
		Si Comunidad=='2' Entonces
			valor <- 2;
		SiNo
			valor <- 0;
		FinSi
	FinSi
FinSubProceso

SubProceso valor <- CalculaAnio(anioTitulo)
	Definir valor Como Real;
	Segun anioTitulo  Hacer
		2008:
			valor <- 6;
		2007:
			valor <- 4;
		2006:
			valor <- 3;
		2005:
			valor <- 2;
		2004:
			valor <- 1;
		2003:
			valor <- 0.5;
		De Otro Modo:
			SI anioTitulo>2008 Entonces
				valor <- 6;
			SiNo
				valor <- 0;
			FinSi
			
			
	FinSegun
FinSubProceso
