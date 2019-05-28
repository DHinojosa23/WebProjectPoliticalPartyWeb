package java_ADM;


import static org.junit.jupiter.api.Assertions.assertEquals;

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
		public class TestControlador {
			private int cod_campanna;
			private String tipo;
			
			public TestControlador(int cod_campanna, String tipo) {
				this.cod_campanna=cod_campanna;
				this.tipo=tipo;
			}
			
			
			@Parameters
			public static Collection<Object[]> datos(){
				return Arrays.asList(new Object[][] {
				{1,"Europea"},
				{2,"Nacional"},
				{3,"Municipal"},
				{11,"Autonómica"},
				{20,"Autonómica"}
				});
			}
			
			
			
			@Test
			public void dameCampanna() {
				BD_Controller controladorBD = new BD_Controller();
				
				Campanna campanna = controladorBD.dameCampanna(cod_campanna);
				String resultado = campanna.getTipo();
				assertEquals(tipo,resultado);
			
	}

}
