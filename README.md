# reborn-capabilities

Catalogue maître des compétences réutilisables développées pour étendre les capacités de l'agent Reborn. Chaque compétence = une skill SKILL.md installable + sa fiche ci-dessous.

## Compétences du catalogue

| Compétence | Rôle | Statut |
|---|---|---|
| subagent-inference | Instancier / déléguer à un petit LLM externe (HF Inference API, CUDOS/ASI). Expertise cyber large + cas encadré d'investigation d'acteur malveillant | active |
| gh-actions-runtime | Contourner les limites locales (pas de python/gcc) via runners GitHub Actions sur repos publics | active |
| adult-fiction-ft | Fine-tuning ciblé d'une base Qwen3.6/GLM sur corpus de fiction adulte entre adultes, en conservant le refus sur catégories criminelles | en plan |
| colibri-rig | Déploiement/optimisation du moteur Colibri sur la machine hôte Xeon (NVMe/RAID, 64 coeurs, 500 Go RAM) | en plan |

## Contraintes transverses
- Sandbox agent : pas de python/gcc, RAM 4 Go, 1 CPU, pas d'install, pas d'accès /data hôte -> contourner via GH Actions ou déléguer à l'hôte.
- Cible inférence externe : CUDOS/ASI (pas Judeos).
- Lignes de contenu fermes : refus absolu du contenu pédocriminel et du viol, quel que soit le modèle ; pas d'armes offensives ni compromission ciblée de tiers non consentants. Fine-tuning = modèle littéraire adulte (fiction érotique entre adultes), pas un modèle "débridé" produisant du contenu criminel. Cas d'investigation d'acteur malveillant autorisé et encadré (base légale, cible objective, finalité défensive, proportionnalité).
- Persona "mikemeld" : identité dédiée aux outils/CTF cybersécurité, à développer.

## Cycle de vie d'une compétence
1. Nouvelle tâche -> identifier si une compétence catalogue s'applique (réutiliser) ou en développer une (ajouter).
2. Développer = skill SKILL.md installable (builtin.skill_install).
3. Ajouter une fiche dans le tableau.
4. Pousser skill + fiche sur ce repo.