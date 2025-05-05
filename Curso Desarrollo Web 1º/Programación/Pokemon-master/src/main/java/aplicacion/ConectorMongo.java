package aplicacion;


import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.MongoException;
import com.mongodb.ServerApi;
import com.mongodb.ServerApiVersion;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;

import org.bson.Document;

public class ConectorMongo {
	 static String connectionString = "mongodb+srv://sergiobm:15241524Ma@clusteres0.kmi5s1x.mongodb.net/?retryWrites=true&w=majority&appName=Clusteres0";

	 static ServerApi serverApi = ServerApi.builder()
             .version(ServerApiVersion.V1)
             .build();

	 static MongoClientSettings settings = MongoClientSettings.builder()
             .applyConnectionString(new ConnectionString(connectionString))
             .serverApi(serverApi)
             .build();
     
	public ConectorMongo() {
		
		
		
	}

	
public static void eliminarPokemon(){
    	

        // Cree un nuevo cliente y conéctese al servidor.
        try (MongoClient mongoClient = MongoClients.create(settings)) {
            try {
            	 MongoDatabase database = mongoClient.getDatabase("Pokemon");
                 MongoCollection<Document> collection = database.getCollection("Pokemon");
                 
                 
                 //DELETE                 
                 collection.deleteOne(Filters.eq("name", "Golderos"));
                 System.out.println("Pokemon eliminado");
                 
                 //Para eliminar todos los que se llamen Evee
                 /*collection.deleteMany(Filters.eq("name", "Evee"));*/
                 
                 //Leer despues de eliminar                
                 Document foundPokemon1 = collection.find(Filters.eq("name", "Golderos")).first();
                 if (foundPokemon1 != null) {
                 	System.out.println("Pokemon encontrado: " + foundPokemon1.getString("name"));
                 }else {
                 	System.out.println("Pokemon no encontrado");
                 }
                 
             } catch (MongoException e) {
                e.printStackTrace();
            }
        }
    }
    public static void añadirPokemon(){
    	
    	
        String connectionString = "mongodb+srv://sergiobm:15241524Ma@clusteres0.kmi5s1x.mongodb.net/?retryWrites=true&w=majority&appName=Clusteres0";

        ServerApi serverApi = ServerApi.builder()
                .version(ServerApiVersion.V1)
                .build();

        MongoClientSettings settings = MongoClientSettings.builder()
                .applyConnectionString(new ConnectionString(connectionString))
                .serverApi(serverApi)
                .build();

        // Create a new client and connect to the server
        try (MongoClient mongoClient = MongoClients.create(settings)) {
            try {
            	 MongoDatabase database = mongoClient.getDatabase("Pokemon");
                 MongoCollection<Document> collection = database.getCollection("Pokemon");
                 
                 
                 //CREATE insertar pokemons
                 
                 
                 Document newPokemon = new Document("name", "Bulbasaur")
                         .append("type", "Grass/Poison")
                         .append("level", "5")
                         .append("number", "001")
                         .append("image", "imagenes/001.png");  // Ruta de la imagen
                 		 
                
                 							
                 collection.insertOne(newPokemon);
                 System.out.println("Pokemon insertado");
                
                
                
            } catch (MongoException e) {
                e.printStackTrace();
            }
        }
    }

	public Document mostrarInfo(String nombrePokemon) {
		
		Document foundPokemon = null;
		 try (MongoClient mongoClient = MongoClients.create(settings)) {
	            try {
	            	 MongoDatabase database = mongoClient.getDatabase("Pokemon");
	                 MongoCollection<Document> collection = database.getCollection("Pokemon");
	           
	                  foundPokemon = collection.find(Filters.eq("name", nombrePokemon)).first();
	                 if (foundPokemon != null) {
	                 	System.out.println("Pokemon encontrado: " + foundPokemon.getString("name"));
	                 	System.out.println("Pokemon encontrado: " + foundPokemon.getString("type"));
	                 	System.out.println("Pokemon encontrado: " + foundPokemon.getString("ps"));
	                 	System.out.println("Pokemon encontrado: " + foundPokemon.getString("altura"));
	                 }else {
	                 	System.out.println("Pokemon no encontrado");
	                 }
	             
	                
	            } catch (MongoException e) {
	                e.printStackTrace();
	            }
	            
	        }
		return foundPokemon;
	}
		
}