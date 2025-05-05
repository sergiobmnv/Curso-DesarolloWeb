package aplicacion;

import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import org.bson.Document;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.net.URL;
import java.awt.event.ActionEvent;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.ImageIcon;
import java.awt.Color;
import java.awt.Component;
import javax.swing.Box;
import javax.swing.JSeparator;
import org.eclipse.wb.swing.FocusTraversalOnArray;
import javax.swing.SwingConstants;

public class Interfaz extends JFrame {

	private static final long serialVersionUID = 1L;
	protected static final String Bulbasaur = null;
	private JPanel contentPane;
	private Document pokemonInfo = null;
	private JLabel lblNombre;
	private JLabel lblNivel;
	private JLabel lblTipo;
	private JLabel lblNumero;
	private JLabel lblDescripcion;
	private JLabel lblSexo;
	private JLabel lblAltura;
	private JLabel lblPeso;
	private JLabel lblPs;
	private JLabel lblAtaque;
	private JLabel lblAtaqueEspecial;
	private JLabel lblCategoria;
	private JLabel lblDefensa;
	private JLabel lblDefensaEspecial;
	private JLabel lblHabilidad;
	private JLabel lblVelocidad;
	private JLabel lblimagen;
	private JLabel lblNewLabel;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Interfaz frame = new Interfaz();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Interfaz() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 1280, 775);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 128, 64));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		// Pokemons del 1 al 25 //Pokemons del 26 al 50
		addPokemonButton("Bulbasaur", 10, 10);
		addPokemonButton("Raichu", 120, 10);
		addPokemonButton("Ivysaur", 10, 30);
		addPokemonButton("Sandshrew", 120, 30);
		addPokemonButton("Venusaur", 10, 50);
		addPokemonButton("Sandslash", 120, 50);
		addPokemonButton("Charmander", 10, 70);
		addPokemonButton("Nidoran♀", 120, 70);
		addPokemonButton("Charmeleon", 10, 90);
		addPokemonButton("Nidorina", 120, 90);
		addPokemonButton("Charizard", 10, 110);
		addPokemonButton("Nidoqueen", 120, 110);
		addPokemonButton("Squirtle", 10, 130);
		addPokemonButton("Nidoran♂", 120, 130);
		addPokemonButton("Wartortle", 10, 150);
		addPokemonButton("Nidorino", 120, 150);
		addPokemonButton("Blastoise", 10, 170);
		addPokemonButton("Nidoking", 120, 170);
		addPokemonButton("Caterpie", 10, 190);
		addPokemonButton("Clefairy", 120, 190);
		addPokemonButton("Metapod", 10, 210);
		addPokemonButton("Clefable", 120, 210);
		addPokemonButton("Butterfree", 10, 230);
		addPokemonButton("Vulpix", 120, 230);
		addPokemonButton("Weedle", 10, 250);
		addPokemonButton("Ninetales", 120, 250);
		addPokemonButton("Kakuna", 10, 270);
		addPokemonButton("Jigglypuff", 120, 270);
		addPokemonButton("Beedrill", 10, 290);
		addPokemonButton("Wigglytuff", 120, 290);
		addPokemonButton("Pidgey", 10, 310);
		addPokemonButton("Zubat", 120, 310);
		addPokemonButton("Pidgeotto", 10, 330);
		addPokemonButton("Golbat", 120, 330);
		addPokemonButton("Pidgeot", 10, 350);
		addPokemonButton("Oddish", 120, 350);
		addPokemonButton("Rattata", 10, 370);
		addPokemonButton("Gloom", 120, 370);
		addPokemonButton("Raticate", 10, 390);
		addPokemonButton("Vileplume", 120, 390);
		addPokemonButton("Spearow", 10, 410);
		addPokemonButton("Paras", 120, 410);
		addPokemonButton("Fearow", 10, 430);
		addPokemonButton("Parasect", 120, 430);
		addPokemonButton("Ekans", 10, 450);
		addPokemonButton("Venonat", 120, 450);
		addPokemonButton("Arbok", 10, 470);
		addPokemonButton("Venomoth", 120, 470);
		addPokemonButton("Pikachu", 10, 490);
		addPokemonButton("Diglett", 120, 490);

		// Pokemons del 51 75 //Pokemons del 76 al 100
		addPokemonButton("Dugtrio", 230, 10);
		addPokemonButton("Golem", 340, 10);
		addPokemonButton("Meowth", 230, 30);
		addPokemonButton("Ponyta", 340, 30);
		addPokemonButton("Persian", 230, 50);
		addPokemonButton("Rapidash", 340, 50);
		addPokemonButton("Psyduck", 230, 70);
		addPokemonButton("Slowpoke", 340, 70);
		addPokemonButton("Golduck", 230, 90);
		addPokemonButton("Slowbro", 340, 90);
		addPokemonButton("Mankey", 230, 110);
		addPokemonButton("Magnemite", 340, 110);
		addPokemonButton("Primeape", 230, 130);
		addPokemonButton("Magneton", 340, 130);
		addPokemonButton("Growlithe", 230, 150);
		addPokemonButton("Farfetch'd", 340, 150);
		addPokemonButton("Arcanine", 230, 170);
		addPokemonButton("Doduo", 340, 170);
		addPokemonButton("Poliwag", 230, 190);
		addPokemonButton("Dodrio", 340, 190);
		addPokemonButton("Poliwhirl", 230, 210);
		addPokemonButton("Seel", 340, 210);
		addPokemonButton("Poliwrath", 230, 230);
		addPokemonButton("Dewgong", 340, 230);
		addPokemonButton("Abra", 230, 250);
		addPokemonButton("Grimer", 340, 250);
		addPokemonButton("Kadabra", 230, 270);
		addPokemonButton("Muk", 340, 270);
		addPokemonButton("Alakazam", 230, 290);
		addPokemonButton("Shellder", 340, 290);
		addPokemonButton("Machop", 230, 310);
		addPokemonButton("Cloyster", 340, 310);
		addPokemonButton("Machoke", 230, 330);
		addPokemonButton("Gastly", 340, 330);
		addPokemonButton("Machamp", 230, 350);
		addPokemonButton("Haunter", 340, 350);
		addPokemonButton("Bellsprout", 230, 370);
		addPokemonButton("Gengar", 340, 370);
		addPokemonButton("Weepinbell", 230, 390);
		addPokemonButton("Onix", 340, 390);
		addPokemonButton("Victreebel", 230, 410);
		addPokemonButton("Drowzee", 340, 410);
		addPokemonButton("Tentacool", 230, 430);
		addPokemonButton("Hypno", 340, 430);
		addPokemonButton("Tentacruel", 230, 450);
		addPokemonButton("Krabby", 340, 450);
		addPokemonButton("Geodude", 230, 470);
		addPokemonButton("Kingler", 340, 470);
		addPokemonButton("Graveler", 230, 490);
		addPokemonButton("Voltorb", 340, 490);

		// Pokemons del 101 al 125 //Pokemons del 126 al 151
		addPokemonButton("Electrode", 450, 10);
		addPokemonButton("Magmar", 560, 10);
		addPokemonButton("Exeggcute", 450, 30);
		addPokemonButton("Pinsir", 560, 30);
		addPokemonButton("Exeggutor", 450, 50);
		addPokemonButton("Tauros", 560, 50);
		addPokemonButton("Cubone", 450, 70);
		addPokemonButton("Magikarp", 560, 70);
		addPokemonButton("Marowak", 450, 90);
		addPokemonButton("Gyarados", 560, 90);
		addPokemonButton("Hitmonlee", 450, 110);
		addPokemonButton("Lapras", 560, 110);
		addPokemonButton("Hitmonchan", 450, 130);
		addPokemonButton("Ditto", 560, 130);
		addPokemonButton("Lickitung", 450, 150);
		addPokemonButton("Eevee", 560, 150);
		addPokemonButton("Koffing", 450, 170);
		addPokemonButton("Vaporeon", 560, 170);
		addPokemonButton("Weezing", 450, 190);
		addPokemonButton("Jolteon", 560, 190);
		addPokemonButton("Rhyhorn", 450, 210);
		addPokemonButton("Flareon", 560, 210);
		addPokemonButton("Rhydon", 450, 230);
		addPokemonButton("Porygon", 560, 230);
		addPokemonButton("Chansey", 450, 250);
		addPokemonButton("Omanyte", 560, 250);
		addPokemonButton("Tangela", 450, 270);
		addPokemonButton("Omastar", 560, 270);
		addPokemonButton("Kangaskhan", 450, 290);
		addPokemonButton("Kabuto", 560, 290);
		addPokemonButton("Horsea", 450, 310);
		addPokemonButton("Kabutops", 560, 310);
		addPokemonButton("Seadra", 450, 330);
		addPokemonButton("Aerodactyl", 560, 330);
		addPokemonButton("Goldeen", 450, 350);
		addPokemonButton("Snorlax", 560, 350);
		addPokemonButton("Seaking", 450, 370);
		addPokemonButton("Articuno", 560, 370);
		addPokemonButton("Staryu", 450, 390);
		addPokemonButton("Zapdos", 560, 390);
		addPokemonButton("Starmie", 450, 410);
		addPokemonButton("Moltres", 560, 410);
		addPokemonButton("Mr. Mime", 450, 430);
		addPokemonButton("Dratini", 560, 430);
		addPokemonButton("Scyther", 450, 450);
		addPokemonButton("Dragonair", 560, 450);
		addPokemonButton("Jynx", 450, 470);
		addPokemonButton("Dragonite", 560, 470);
		addPokemonButton("Electabuzz", 450, 490);
		addPokemonButton("Mewtwo", 560, 490);

		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(192, 192, 192));
		panel_1.setBounds(517, 89, 265, 216);
		contentPane.add(panel_1);
		panel_1.setLayout(null);

		// Agregar más JLabel aquí según sea necesario

		lblNombre = new JLabel("Nombre:");
		lblNombre.setBounds(10, 10, 217, 13);
		panel_1.add(lblNombre);

		lblNumero = new JLabel("Número:");
		lblNumero.setBounds(10, 33, 245, 13);
		panel_1.add(lblNumero);

		lblDescripcion = new JLabel("Descripción:");
		lblDescripcion.setBounds(10, 72, 245, 13);
		panel_1.add(lblDescripcion);

		lblTipo = new JLabel("Tipo:");
		lblTipo.setBounds(10, 95, 217, 23);
		panel_1.add(lblTipo);

		lblSexo = new JLabel("Sexo:");
		lblSexo.setBounds(10, 183, 245, 23);
		panel_1.add(lblSexo);

		lblCategoria = new JLabel("Categoria:");
		lblCategoria.setBounds(10, 127, 245, 23);
		panel_1.add(lblCategoria);

		JPanel panel_3 = new JPanel();
		panel_3.setBackground(new Color(192, 192, 192));
		panel_3.setBounds(517, 340, 265, 262);
		contentPane.add(panel_3);
		panel_3.setLayout(null);

		lblAtaque = new JLabel("Ataque:");
		lblAtaque.setBounds(10, 10, 245, 13);
		panel_3.add(lblAtaque);

		lblAtaqueEspecial = new JLabel("AtaqueEspecial:");
		lblAtaqueEspecial.setBounds(-157, 51, 172, 23);
		panel_3.add(lblAtaqueEspecial);

		lblDefensaEspecial = new JLabel("DefensaEspecial:");
		lblDefensaEspecial.setBounds(10, 51, 225, 23);
		panel_3.add(lblDefensaEspecial);

		lblDefensa = new JLabel("Defensa:");
		lblDefensa.setBounds(10, 33, 245, 23);
		panel_3.add(lblDefensa);

		lblHabilidad = new JLabel("Habilidad:");
		lblHabilidad.setBounds(10, 98, 245, 23);
		panel_3.add(lblHabilidad);

		lblVelocidad = new JLabel("Velocidad:");
		lblVelocidad.setBounds(10, 120, 216, 23);
		panel_3.add(lblVelocidad);

		lblAltura = new JLabel("Altura:");
		lblAltura.setBounds(10, 229, 96, 23);
		panel_3.add(lblAltura);

		lblPeso = new JLabel("Peso:");
		lblPeso.setBounds(10, 206, 102, 23);
		panel_3.add(lblPeso);

		lblPs = new JLabel("PS:");
		lblPs.setBounds(10, 153, 245, 23);
		panel_3.add(lblPs);

		lblNivel = new JLabel("Nivel:");
		lblNivel.setBounds(10, 173, 245, 23);
		panel_3.add(lblNivel);
		
				lblNewLabel = new JLabel("");
				lblNewLabel.setBounds(843, 340, 378, 311);
				contentPane.add(lblNewLabel);
				lblNewLabel.setHorizontalAlignment(SwingConstants.CENTER);
				lblNewLabel.setIcon(new ImageIcon("C:\\Users\\sergi\\Downloads\\Pokemon-master\\src\\icons\\Bulbasaur.png"));
				
						lblimagen = new JLabel("");
						lblimagen.setBounds(843, 34, 378, 213);
						contentPane.add(lblimagen);
						lblimagen.setHorizontalAlignment(SwingConstants.CENTER);
						lblimagen.setIcon(new ImageIcon("C:\\Users\\sergi\\Downloads\\Pokemon-master\\src\\icons\\Fondo.png"));
						
								JPanel panel = new JPanel();
								panel.setBounds(26, 10, 455, 641);
								contentPane.add(panel);
								panel.setBackground(new Color(192, 192, 192));
								panel.setLayout(null);
								JButton btnBulbasaur = new JButton();
								btnBulbasaur.setBounds(10, 10, 77, 21);
								btnBulbasaur.setText("bulbasaur");
								panel.add(btnBulbasaur);
		btnBulbasaur.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					ConectorMongo conector = new ConectorMongo();
					pokemonInfo = conector.mostrarInfo(Bulbasaur);
					if (pokemonInfo != null) {
						updateLabels();
					} else {
						lblNombre.setText("Información no encontrada");
						lblNivel.setText("Nivel: ");
						lblTipo.setText("Tipo: ");
						lblNumero.setText("Número: ");
						lblDescripcion.setText("Descripción: ");
						lblSexo.setText("Sexo: ");
						lblAltura.setText("Altura: ");
						lblPeso.setText("Peso: ");
						lblPs.setText("PS: ");
						lblAtaque.setText("Ataque: ");
						lblAtaqueEspecial.setText("AtaqueEspecial: ");
						lblCategoria.setText("Categoria: ");
						lblDefensa.setText("Defensa: ");
						lblDefensaEspecial.setText("DefensaEspecial: ");
						lblHabilidad.setText("Habilidad: ");
						lblVelocidad.setText("Velocidad: ");
						lblimagen.setIcon(null);
					}
				} catch (Exception ex) {
					ex.printStackTrace();
					JOptionPane.showMessageDialog(contentPane, "Error: " + ex.getMessage(), "Error",
							JOptionPane.ERROR_MESSAGE);
				}
			}
		});
	}

	private void addPokemonButton(final String pokemonName, int x, int y) {
	}

	private void updateLabels() {
		lblNombre.setText("Nombre: " + pokemonInfo.getString("name"));
		lblNivel.setText("Nivel: " + pokemonInfo.getString("level"));
		lblTipo.setText("Tipo: " + pokemonInfo.getString("type"));
		lblNumero.setText("Número: " + pokemonInfo.getString("number"));
		lblDescripcion.setText("Descripción: " + pokemonInfo.getString("descripcion"));
		lblSexo.setText("Sexo: " + pokemonInfo.getString("sexo"));
		lblAltura.setText("Altura: " + pokemonInfo.getString("altura"));
		lblPeso.setText("Peso: " + pokemonInfo.getString("peso"));
		lblPs.setText("PS: " + pokemonInfo.getString("ps"));
		lblAtaque.setText("Ataque: " + pokemonInfo.getString("ataque"));
		lblAtaqueEspecial.setText("Ataque Especial: " + pokemonInfo.getString("ataque especial"));
		lblCategoria.setText("Categoria: " + pokemonInfo.getString("categoria"));
		lblDefensa.setText("Defensa: " + pokemonInfo.getString("defensa"));
		lblDefensaEspecial.setText("Defensa Especial: " + pokemonInfo.getString("defensa especial"));
		lblHabilidad.setText("Habilidad: " + pokemonInfo.getString("habilidad"));
		lblVelocidad.setText("Velocidad: " + pokemonInfo.getString("velocidad"));

		String imagePath = pokemonInfo.getString("image");
		if (imagePath != null) {
			URL imgURL = getClass().getResource("/imagenes/" + imagePath);
			if (imgURL != null) {
				lblimagen.setIcon(new ImageIcon(imgURL));
			} else {
				lblimagen.setIcon(null);
				System.err.println("No se pudo encontrar el archivo: " + imagePath);
			}
		} else {
			lblimagen.setIcon(null);
		}
	}
}