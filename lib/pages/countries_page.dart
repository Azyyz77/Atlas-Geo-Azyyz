import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/pays.dart';
import 'country_detail_page.dart';
import 'welcome_page.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  // Liste des pays hardcodée
  static final List<Pays> paysList = [
    Pays(
      nom: 'France',
      capitale: 'Paris',
      population: '67 millions',
      superficie: '643 801 km²',
      langues: 'Français',
    ),
    Pays(
      nom: 'Tunisie',
      capitale: 'Tunis',
      population: '12 millions',
      superficie: '163 610 km²',
      langues: 'Arabe',
    ),
    Pays(
      nom: 'Brésil',
      capitale: 'Brasília',
      population: '215 millions',
      superficie: '8 515 767 km²',
      langues: 'Portugais',
    ),
    Pays(
      nom: 'Italie',
      capitale: 'Rome',
      population: '59 millions',
      superficie: '301 340 km²',
      langues: 'Italien',
    ),
    Pays(
      nom: 'Canada',
      capitale: 'Ottawa',
      population: '39 millions',
      superficie: '9 984 670 km²',
      langues: 'Anglais',
    ),
    Pays(
      nom: 'Australie',
      capitale: 'Canberra',
      population: '26 millions',
      superficie: '7 692 024 km²',
      langues: 'Anglais',
    ),
    Pays(
      nom: 'Allemagne',
      capitale: 'Berlin',
      population: '84 millions',
      superficie: '357 022 km²',
      langues: 'Allemand',
    ),
    Pays(
      nom: 'Espagne',
      capitale: 'Madrid',
      population: '47 millions',
      superficie: '505 990 km²',
      langues: 'Espagnol',
    ),
    Pays(
      nom: 'Afrique du Sud',
      capitale: 'Pretoria',
      population: '60 millions',
      superficie: '1 219 090 km²',
      langues: 'Afrikaans',
    ),
  ];

  String getFlagAsset(String countryName) {
    final Map<String, String> flagMap = {
      'France': 'assets/images/flags/france.png',
      'Tunisie': 'assets/images/flags/tunisie.png',
      'Brésil': 'assets/images/flags/bresil.png',
      'Italie': 'assets/images/flags/italie.png',
      'Canada': 'assets/images/flags/canada.png',
      'Australie': 'assets/images/flags/australie.png',
      'Allemagne': 'assets/images/flags/allemagne.png',
      'Espagne': 'assets/images/flags/espagne.png',
      'Afrique du Sud': 'assets/images/flags/afrique_du_sud.png',
    };
    return flagMap[countryName] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Pays'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.public,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Atlas Géographique',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.blueAccent),
              title: const Text('Accueil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WelcomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.blueAccent),
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('À propos'),
                    content: const Text(
                      'Atlas Géographique\n\n'
                      'Application mobile de consultation des informations '
                      'de différents pays du monde.\n\n'
                      'Version 1.0.0',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Fermer'),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text('Quitter'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Quitter'),
                    content: const Text(
                      'Voulez-vous vraiment quitter l\'application?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Annuler'),
                      ),
                      TextButton(
                        onPressed: () => SystemNavigator.pop(),
                        child: const Text(
                          'Quitter',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
                  itemCount: paysList.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    final pays = paysList[index];
                    final flagAsset = getFlagAsset(pays.nom);

                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 4,
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(12),
                        leading: flagAsset.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  flagAsset,
                                  width: 60,
                                  height: 45,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 60,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.flag,
                                        color: Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(
                                width: 60,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.flag,
                                  color: Colors.grey,
                                ),
                              ),
                        title: Text(
                          pays.nom,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blueAccent,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CountryDetailPage(
                                pays: pays,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
    );
  }
}
