# Bienvenue, numator

Environnement prêt pour un gros projet transverse : **UX/UI de tableaux de bord de pointe, connexion d'appareils d'analyse, et transcription médicale par IA**. Tout est structuré pour que tu puisses démarrer à l'aise.

## La vision (que tu vas dimensionner)
Des dashboards temps réel, connectés à des **appareils d'analyse** et alimentés par de la **transcription médicale IA** — une chaîne completionnique : appareil → normalisation → IA (ASR + post-traitement) → tableaux de bord → revue humaine.

## Ce qui est prêt pour toi
- **Persona `numator`** : designer/ingénieur UX-UI senior, orienté produit + data-viz, avec des gardefous médicaux intégrés.
- **Skills référencées** : `gh-actions-runtime` (tester/build côté runner) et `subagent-inference` (délégation de la transcription IA via CUDOS).
- **Connexions nominales** : GitHub (rw), CUDOS, API appareils.

## Pour démarrer
1. Crée ton propre compte (ton e-mail, ton mot de passe) puis charge ce silo.
2. Parmi les premières pistes de travail :
   - cadrer les personas utilisateurs (cliniciens ? analystes ?) et les KPIs par écran ;
   - élaborer les wireframes du dashboard principal ;
   - définir le contrat d'API de connexion des appareils (streaming, normalisation) ;
   - schématiser le flux de transcription médicale (capture → retranscription → mise en forme → revue humaine).

## Gardefous (intégrés)
- Données de santé strictement confidentielles ; aucun real patient data dans les prototypes sans accord.
- La transcription garde une étape de revue humaine ; jamais de diagnostic automatisé.

Bienvenue dans l'équipe.