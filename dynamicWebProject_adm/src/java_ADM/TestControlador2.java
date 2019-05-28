package java_ADM;


import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;




	//COMPROBAMOS QUE AL INTRODUCIR VARIOS CÓDIGOS DE CAMPAÑA EL CONTROLADOR NOS DA EL DATO CORRECTO OBTENIDO DE LA BASE DE DATOS
	//TENER EN CUENTA QUE LOS RESULTADOS PUEDEN CAMBIAR DEBIDO A CAMBIOS EN LA BASE DE DATOS
		@RunWith(Parameterized.class)
		public class TestControlador2 {
			private int cod_evento;
			private int numero_de_asistentes;
			
			public TestControlador2(int cod_evento, int numero_de_asistentes) {
				this.cod_evento=cod_evento;
				this.numero_de_asistentes=numero_de_asistentes;
			}
			
			
			@Parameters
			public static Collection<Object[]> datos(){
				return Arrays.asList(new Object[][] {
				{1,3},
				{2,3},
				{3,3},
				{4,2},
				{6,3}
				});
			}
			
			
			
			@Test
			public void dameAsistentesEvento() {
				BD_Controller controladorBD = new BD_Controller();
				ArrayList<Voluntario> voluntarios= new ArrayList<Voluntario>(); 
				voluntarios = controladorBD.dameAsistentesEvento(cod_evento);
				int resultado = voluntarios.size();
				assertEquals(numero_de_asistentes,resultado);
			
	}

}
