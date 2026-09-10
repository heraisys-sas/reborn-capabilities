# state-subsystem

Moteur d'état multi-projets de l'agent Reborn en mode **projet silo**. Chaque activité = un silo isolé (mémoire + persona + skills + connexions), qu'on **exporte**, **charge** et **réinitialise** pour changer d'activité sans créer d'autres agents near.ai.

## Vision
Un seul compte/agent near.ai, plusieurs activités cloisonnées. On bascule en déchargeant un silo et en chargeant un autre. Un silo est un **bundle versionné** épais.

## Structure d'un silo (bundle)
```
silos/<slug>/manifest.json        # métadonnées: nom, version, date, auteur, activites couvertes
silos/<slug>/memory.md            # mémoire persistante du projet (notes, dec alsions, contraintes)
silos/<slug>/persona.md           # identite/persona (ex. "mikemeld" pour cybersec, "romanciere" pour fiction)
silos/<slug>/skills.txt           # liste des skills actives + versions
silos/<slug>/connections.json     # references des connecteurs (SANS secrets, juste noms/etats)
silos/<slug>/assets/              # fichiers annexes (scripts, corpus, configs) - optionnel
```

## Commandes
- `export --slug <slug>` : generer le bundle depuis l'etat courant (lire memory/read, skill_list, connexions) et l'ecrire sous silos/<slug>/.
- `load --slug <slug>` : restaurer le bundle dans l'environnement courant (re-ecrire memory, re-installer skills, re-brancher connexions).
- `reset` : purger l'etat courant (memory + skills + connexions) sans toucher aux bundles, pour demarrer un silo different proprement.
- `list` : lister les silos disponibles.

## Regles
- **Jamais de secrets/credentials en clair** dans un bundle : les connexions sont referencees par nom, les credentials restent dans le coffre/gestionnaire de secrets, jamais exportes.
- Versionner chaque bundle (manifest.version) pour permettre restore a un etat anterieur.
- Le reset est reversible via load d'un bundle : on ne detruit jamais un silo, on le desactive.
- Les silos sont pousses en tant que dossier `silos/` dans ce repo (source partagee).

## Usage type
- Bascule colibri-rig -> fiction-adulte : export --slug colibri-rig ; reset ; load --slug fiction-adulte.
- Migrer de machine : exporter tous les silos, les pousser, puis load sur le nouvel environnement.

## Statut
A construire - structure definie, implementation a faire (scripts de export/load/reset).