package petstore;


import com.intuit.karate.junit5.Karate;

class TestRunner {
    @Karate.Test
    Karate testAll() {
        System.out.println("--- Buscando el archivo en la ruta: " + getClass().getResource("/petstore/petstore.feature"));
        return Karate.run("classpath:petstore/petstore.feature"); 
    }
}