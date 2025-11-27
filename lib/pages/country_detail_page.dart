import 'package:flutter/material.dart';
import '../models/pays.dart';

class CountryDetailPage extends StatelessWidget {
  final Pays pays;

  const CountryDetailPage({
    super.key,
    required this.pays,
  });

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
    final flagAsset = getFlagAsset(pays.nom);

    return Scaffold(
      appBar: AppBar(
        title: Text(pays.nom),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Drapeau en grand format
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
              ),
              child: flagAsset.isNotEmpty
                  ? Image.asset(
                      flagAsset,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Icon(
                              Icons.flag,
                              size: 100,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey.shade300,
                      child: const Center(
                        child: Icon(
                          Icons.flag,
                          size: 100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20),

            // Informations du pays
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Capitale
                  _buildInfoCard(
                    icon: Icons.location_city,
                    label: 'Capitale',
                    value: pays.capitale,
                    iconColor: Colors.blue,
                    textColor: Colors.red,
                  ),
                  const SizedBox(height: 16),

                  // Population
                  _buildInfoCard(
                    icon: Icons.people,
                    label: 'Population',
                    value: '${pays.population} d\'habitants',
                    iconColor: Colors.red,
                  ),
                  const SizedBox(height: 16),

                  // Superficie
                  _buildInfoCard(
                    icon: Icons.map,
                    label: 'Superficie',
                    value: pays.superficie,
                    iconColor: Colors.orange,
                  ),
                  const SizedBox(height: 16),

                  // Langue officielle
                  _buildInfoCard(
                    icon: Icons.language,
                    label: 'Langue(s) officielle(s)',
                    value: pays.langues,
                    iconColor: Colors.purple,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String label,
    required String value,
    required Color iconColor,
    Color? textColor,
  }) {
    return CountryInfoCard(
      icon: icon,
      label: label,
      value: value,
      iconColor: iconColor,
      textColor: textColor ?? Colors.red,
    );
  }
}

// Composant séparé pour la carte d'information
class CountryInfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color iconColor;
  final Color? textColor;

  const CountryInfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CountryInfoIcon(
            icon: icon,
            iconColor: iconColor,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CountryInfoText(
              label: label,
              value: value,
              textColor: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

// Composant pour l'icône
class CountryInfoIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;

  const CountryInfoIcon({
    super.key,
    required this.icon,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 30,
      ),
    );
  }
}

// Composant pour le texte d'information
class CountryInfoText extends StatelessWidget {
  final String label;
  final String value;
  final Color? textColor;

  const CountryInfoText({
    super.key,
    required this.label,
    required this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.black87,
          ),
        ),
      ],
    );
  }
}
