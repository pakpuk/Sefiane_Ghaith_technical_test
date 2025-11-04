 Test Technique Flutter – Ghaith Sefiane
🏁 1. Introduction

Ce projet a été développé dans le cadre d’un test technique Flutter afin d’évaluer mes compétences en :

Développement mobile multiplateforme (Flutter)

Architecture logicielle propre et maintenable

Conception UI/UX fluide, moderne et cohérente

Gestion d’état et intégration de fonctionnalités avancées

L’application est un Task Manager complète et réactive, proposant :

🔐 Écran de connexion avec validation dynamique

🧾 Liste de tâches interactive avec Provider

📋 Détails d’une tâche avec statut et description

🗺️ Bonus : Affichage de la position GPS sur Flutter Map (OpenStreetMap)

✨ Expérience fluide avec animations, transitions et feedback utilisateur

🏗️ 2. Architecture du projet

Le projet suit une structure modulaire inspirée de la Clean Architecture, garantissant clarté, évolutivité et maintenabilité.

lib/
│
├── core/
│   ├── constants/         # Couleurs, textes, styles et poids de police

│   ├── utils/             # Fonctions utilitaires

│
├── data/
│   └── models/            # Modèle de données (TaskModel)

│
├── providers/             # Gestion d’état via Provider

│
├── presentation/
│   ├── screens/           # Pages : Login, Home, TaskDetail

│   └── widgets/           # Widgets réutilisables : Button, TextField, TaskItem

│
└── main.dart              # Point d’entrée de l’application

💡 Pro Tips

Séparation claire entre interface, logique métier et état

Widgets réutilisables pour cohérence et performance

Provider utilisé pour une gestion d’état légère et fluide

⚙️ 3. Fonctionnalités principales
🧾 Liste de tâches

Chargement depuis un fichier JSON local (simulation API)

Mise à jour instantanée du statut via Provider

Suppression fluide via Dismissible + animation

Animation Lottie lorsqu’aucune tâche n’est disponible

Effet FadeInUp pour une apparition dynamique

📋 Détail d’une tâche

Transition Hero entre la liste et la page détail

Possibilité de marquer/démarquer la tâche comme terminée

Carte Flutter Map (OpenStreetMap) intégrée pour visualiser la position de la tâche

SnackBar de confirmation après mise à jour

🔐 Connexion

Validation de formulaire sécurisée (email & mot de passe)

Gestion de la visibilité du mot de passe avec Provider

Interface 100% responsive grâce à flutter_screenutil

📦 4. Packages utilisés
Package	Version	Utilisation
provider	^6.1.2	Gestion d’état réactive
flutter_screenutil	^5.9.3	Design adaptatif
dio	^5.7.0	Simulation d’API (fichier JSON local)
panara_dialogs	^0.1.5	Dialogues modernes
lottie	^3.2.0	Animations fluides
flutter_map	^7.0.0	Affichage de carte OpenStreetMap
latlong2	^0.9.0	Gestion des coordonnées
cupertino_icons	^1.0.8	Icônes iOS-style

💡 Les packages sélectionnés sont stables, bien maintenus et légers, parfaits pour un MVP professionnel.

🧾 5. Permissions & Configuration
📱 Android – AndroidManifest.xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />

🍏 iOS – Info.plist
<key>NSLocationWhenInUseUsageDescription</key>
<string>Votre position est utilisée pour afficher la carte de la tâche.</string>

<key>io.flutter.embedded_views_preview</key>
<true/>

🎨 6. Design & Expérience Utilisateur

L’expérience utilisateur repose sur la fluidité et la clarté visuelle :

🎬 FadeInUp : apparition animée des éléments

🗑️ Dismissible : suppression fluide des tâches

🪄 Lottie : feedback visuel lorsque la liste est vide

⚡ Hero Transition : passage fluide entre la liste et les détails

💬 SnackBar : retour utilisateur immédiat

Palette cohérente et typographie harmonieuse définies dans app_colors.dart et text_styles.dart.

🧠 7. Bonnes pratiques appliquées

✅ Architecture modulaire et maintenable

✅ Code clair, commenté et bien nommé

✅ Séparation UI / logique / état

✅ Validation sécurisée des formulaires

✅ Widgets réutilisables pour optimiser la cohérence

✅ Performance optimisée (animations légères, Provider efficace)

💻 8. Installation & Exécution

git clone https://github.com/pakpuk/Sefiane_Ghaith_technical_test.git

cd Sefiane_Ghaith_technical_test

flutter pub get

flutter run

🔮 9. Améliorations futures

🔐 Authentification Firebase / Supabase

💾 Persistance locale (Hive / SQLite)

🔔 Notifications Push (Firebase Cloud Messaging)

🌐 Intégration API REST réelle

🎛️ Filtres et tri dynamique des tâches

✨ Micro-interactions avancées

👨‍💻 10. Auteur

Ghaith Sefiane
Flutter Developer | UI/UX Designer | Passionné par le Clean Code et les expériences utilisateurs modernes
