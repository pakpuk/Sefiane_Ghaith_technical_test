# 🚀 Flutter Technical Test by Ghaith Sefiane

A clean, scalable, and fully responsive **Flutter Task Manager** built as part of a technical test.  
The app demonstrates advanced state management, smooth animations, modern UI/UX, and an optional GPS map integration.

---

## 🏁 1. Introduction

Ce projet a été réalisé dans le cadre d’un **test technique Flutter** visant à évaluer mes compétences en :

- 📱 Développement mobile multiplateforme
- 🧩 Architecture logicielle propre et scalable
- 🎨 Conception d’expériences utilisateurs fluides et modernes (UI/UX)

### 📋 L’application comprend :
- 🔐 Une page de connexion avec validation des formulaires  
- 🧾 Une liste de tâches connectée à une API simulée (JSON local)  
- 📋 Un écran de détail de tâche avec marquage comme terminée  
- 🗺️ **Bonus :** affichage de la position GPS sur Google Maps  
- ✨ Interface fluide avec animations et transitions cohérentes  

---

## 🏗️ 2. Architecture et Structure du projet

Le projet suit une architecture modulaire et maintenable, inspirée des principes de la **Clean Architecture**.

lib/
│
├── core/
│ ├── constants/ # Couleurs, styles, textes, poids de police

│
├── data/
│ └── models/ # Modèle de données : TaskModel

│
├── providers/ # Gestion d’état via Provider

│
├── presentation/
│ ├── screens/ # Écrans : Login, Home, TaskDetail

│ └── widgets/ # Widgets réutilisables : Button, TaskWidget, etc.
│
└── main.dart # Point d'entrée de l'application

yaml
Copier le code

### 💡 Pro Tips
- Séparation claire entre UI / logique métier / état.  
- Widgets réutilisables (TaskWidget, ButtonCustom) pour cohérence et performance.  
- Provider assure une gestion d’état fluide sans rebuilds inutiles.  

---

## ⚙️ 3. Fonctionnalités Clés et Expérience Utilisateur

### 🧾 Liste de tâches
- Marquage instantané comme terminée via Provider.  
- Animation FadeInUp à l’apparition.  
- Suppression fluide avec Dismissible + Snackbar.  
- Si la liste est vide → Animation Lottie.

### 📋 Détail de la tâche
- Transition Hero entre la liste et le détail.  
- Possibilité de marquer la tâche comme terminée.  
- Affichage conditionnel de la carte Google Maps selon les coordonnées GPS.  
- Snackbar pour informer de la mise à jour réussie.

### 🔐 Connexion
- Validation de formulaire sécurisée.  
- Gestion de visibilité du mot de passe via Provider.  
- Design 100% responsive (flutter_screenutil).

---

## 🧱 4. Stack Technique

| Domaine | Package / Outil | Rôle |
|----------|----------------|------|
| State Management | provider ^6.1.2 | Gestion d’état réactive |
| Responsive Design | flutter_screenutil ^5.9.3 | Adaptation multi-écrans |
| Animations | lottie ^3.2.0, animate_do ^4.2.0 | Animations fluides |
| Dialogues | panara_dialogs ^0.1.5 | Dialogues modernes |
| API / HTTP | dio ^5.7.0 | Simulation d’API |
| Cartes | google_maps_flutter ^2.9.0 | Intégration carte et GPS |
| Icônes | cupertino_icons ^1.0.8 | Icônes iOS-style |

💡 *Tous les packages choisis sont stables, maintenus et optimisés pour la production.*

---

## 🧾 5. Permissions et Configuration

### 📱 Android – `AndroidManifest.xml`
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
<uses-permission android:name="android.permission.INTERNET" />
🍏 iOS – Info.plist
xml
Copier le code
<key>NSLocationWhenInUseUsageDescription</key>
<string>Votre position sera utilisée pour afficher votre emplacement sur la carte.</string>

<key>io.flutter.embedded_views_preview</key>
<true/>
🎨 6. Design et Expérience Utilisateur (UI/UX)
Palette de couleurs, typographie et tailles gérées dans :

app_colors.dart

text_styles.dart

font_weights.dart

✨ Animations intégrées :
FadeInUp → Apparition fluide des tâches

Dismissible → Suppression avec animation

Lottie → Liste vide

Hero → Transition fluide entre écrans

💡 Les micro-animations renforcent la perception de fluidité sans nuire aux performances.

🧠 7. Bonnes Pratiques Appliquées
✅ Clean Architecture (UI / logique / état séparés)
✅ Nommage cohérent et code commenté
✅ Widgets découplés et réutilisables
✅ Validation sécurisée des formulaires
✅ Animations légères et performantes
✅ Provider centralisé pour la réactivité

💻 8. Installation et Exécution
bash
Copier le code
# 1️⃣ Cloner le projet
git clone https://github.com/pakpuk/Sefiane_Ghaith_technical_test.git

# 2️⃣ Entrer dans le dossier
cd Sefiane_Ghaith_technical_test

# 3️⃣ Installer les dépendances
flutter pub get

# 4️⃣ Lancer l’application
flutter run
🔮 9. Améliorations Futures
🔐 Authentification Firebase / Supabase

💾 Persistance locale (Hive)

🔔 Notifications push (rappels)

🌐 Synchronisation en temps réel (API REST)

🎛️ Filtres, tri et recherche de tâches

✨ Micro-interactions et retours haptiques


👨‍💻 10. Auteur
Ghaith Sefiane
Flutter Developer | UI/UX Designer
💼 Passionné par le clean code, les micro-interactions et l’optimisation UX
