package java_ADM;


import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.Arrays;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;




	//COMPROBAMOS NUESTRO MÉTODO DEL CONTROLADOR QUE NOS DEVUELVE UNA TABLA HASHTABLE CON CÓDIGOS  DE CAMPANNA Y STRINGS CON TIPO (AMBITO)
	//TENER EN CUENTA QUE LOS RESULTADOS PUEDEN CAMBIAR DEBIDO A CAMBIOS EN LA BASE DE DATOS
		@RunWith(Parameterized.class)
		public class TestControlador3 {
			private int cod_campanna;
			private String tipoAmbito;
			
			public TestControlador3(int cod_campanna, String tipoAmbito) {
				this.cod_campanna=cod_campanna;
				this.tipoAmbito=tipoAmbito;
			}
			
			
			@Parameters
			public static Collection<Object[]> datos(){
				return Arrays.asList(new Object[][] {
				{1,"Europea (EU)"},
				{2,"Nacional (Nacional)"},
				{7,"Municipal (Málaga)"},
				{14,"Municipal (Fuengirola (Málaga))"},
				{21,"Autonómica (Comunidad Castilla La Mancha)"}
				});
			}
			
					
			@Test
			public void dametipoAmbitodeHashtable() {
				BD_Controller controladorBD = new BD_Controller();
				Hashtable <Integer,String> codigoNombre = new Hashtable <Integer,String>();
				codigoNombre = controladorBD.dameTipoyAmbitoCampanna();
				String resultado = codigoNombre.get(cod_campanna);
				assertEquals(tipoAmbito,resultado);
			
	}

}

