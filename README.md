# Atlas Géographique

## Description

Atlas Géographique est une application mobile cross-platform développée avec Flutter permettant de consulter les informations de différents pays du monde de manière interactive.

## Fonctionnalités

### Écran 1 : Page d'Accueil (WelcomePage)
- AppBar avec le titre "Atlas Géographique"
- Image de bienvenue illustrant un globe terrestre
- Texte de bienvenue : "Découvrez les pays du monde"
- Bouton "Entrer" permettant de naviguer vers l'écran principal

### Écran 2 : Page Principale (CountriesPage)
- AppBar avec le titre "Liste des Pays"
- Icône de menu (hamburger) pour ouvrir le Drawer
- **Drawer (menu latéral)** contenant :
  - En-tête avec icône/image
  - Option "Accueil" (retour à WelcomePage)
  - Option "À propos" (navigation vers AboutPage)
  - Option "Quitter" (fermeture de l'application ou message)
- **ListView** affichant la liste des pays sous forme de ListTiles cliquables
- Chaque élément affiche :
  - Nom du pays
  - Drapeau (miniature)

### Écran 3 : Détails du Pays (CountryDetailPage)
- AppBar avec :
  - Bouton retour
  - Nom du pays comme titre
- Affichage des informations suivantes :
  - **Drapeau** (image en grand format)
  - **Capitale**
  - **Population** (format : XX millions d'habitants)
  - **Superficie** (format : XX km²)
  - **Langue officielle**

## Structure de Données

### Modèle "Pays"

```dart
class Pays {
  final String nom;
  final String capitale;
  final String population;
  final String superficie;
  final String langues;
}
```

## Structure du Projet

```
atlas_geo_azyyz/
├── lib/
│   ├── main.dart
│   ├── models/
│   │   └── pays.dart
│   └── pages/
│       ├── welcome_page.dart
│       ├── countries_page.dart
│       └── country_detail_page.dart
├── assets/
│   ├── images/
│   │   ├── globe.png
│   │   └── flags/
│   │       ├── france.png
│   │       ├── tunisie.png
│   │       ├── bresil.png
│   │       ├── italie.png
│   │       ├── canada.png
│   │       ├── australie.png
│   │       ├── allemagne.png
│   │       ├── espagne.png
│   │       └── afrique_du_sud.png
│   └── data/
│       └── pays_info.txt
├── pubspec.yaml
└── README.md
```

## Données des Pays

L'application contient des informations sur 9 pays :
- France
- Tunisie
- Brésil
- Italie
- Canada
- Australie
- Allemagne
- Espagne
- Afrique du Sud

Les données sont stockées dans le fichier `assets/data/pays_info.txt` au format JSON.

## Installation et Exécution

### Prérequis
- Flutter SDK (version 3.0.0 ou supérieure)
- Dart SDK
- Un IDE (VS Code ou Android Studio recommandé)
- Un émulateur ou un appareil physique

### Installation

1. Clonez ou téléchargez le projet
```bash
cd atlas_geo_azyyz
```

2. Installez les dépendances
```bash
flutter pub get
```

3. Ajoutez les images nécessaires :
   - Placez l'image `globe.png` dans `assets/images/`
   - Placez les drapeaux des pays dans `assets/images/flags/`
   - Vous pouvez télécharger les drapeaux depuis : https://www.countryflags.com

### Exécution

Pour exécuter l'application :

```bash
flutter run
```

Pour créer une version de production :

```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

## Technologies Utilisées

- **Framework** : Flutter (Dart)
- **Gestion de l'état** : StatefulWidget / StatelessWidget
- **Navigation** : Navigator (Flutter)
- **Chargement de données** : rootBundle (assets)
- **Parsing JSON** : dart:convert

## Ressources

- Images des drapeaux : [Country Flags](https://www.countryflags.com)
- Documentation Flutter : [flutter.dev](https://flutter.dev)

## Version

1.0.0

