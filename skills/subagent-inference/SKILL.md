# subagent-inference

Instancie et delegue des taches a un petit LLM competent via une inference externe (Hugging Face Inference API, ou CUDOS/ASI) quand la tache est delegable a un sous-agent. Complement des limites locales de l'agent (pas de python/gcc) : le raisonnement tourne cote inference, l'agent orchestre.

## Quand l'utiliser
- Tache repetitive/generative pouvant etre traitee par un petit modele competent.
- Ecriture de brouillons, transformations, reformulations massives, generation en parallele.
- Expertise metier pointue : Ops, infra virtuelle, reseau, securite & cybersecurite (audit autorise, durcissement, detection, reponse a incident, forensique, investigation d'acteur malveillant, CTF) - persona "mikemeld" CTF.
- Modele externe specifique (checkpoint fine-tune fiction adulte, ou modele cybersec).

## Protocole
1. Classifier la delegation (legitime, perimetre enonce). Une tache refusee n'est pas deleguee : pas de contournement par sous-agent.
2. Choisir la cible : HF Inference API (rapide) ou CUDOS/ASI (GPU). cudOS par defaut pour le lourd.
3. Composer un prompt structure (contexte + tache + format attendu).
4. Appeler l'inference (voir scripts/hf_inference.sh), valider la sortie (refus contenus interdits, format).
5. Integrer le resultat pertinent dans le flux.

## Contraintes de contenu (non negociable)
- Refus absolu : pedocriminel, viol, exploitation, harcelement/grooming, quel que soit le modele.
- Refus de facilitation : armes offensives, compromission ciblee de tiers non consentants, malware visant systemes non possedes/autorises.
- Fine-tuning = modele litteraire adulte (fiction erotique adultes consentants), jamais un modele produisant du contenu criminel. Lever la pruderie, pas la surete.
- Un sous-agent ne produit pas ce que l'agent refuse : pas de contournement par externalisation.

## Cas particulier : investigation d'un acteur malveillant (2x en carriere)
Autorise et encadre : cybercrime forensique pour identifier/caracteriser une menace depuis des traces (remontees legales, OSINT traces Telegram). Conditions :
1. Base legale averee (mandat, signalement, remontee legale, cadre anti-menace).
2. Cible = acteur malveillant presume, fonde sur traces objectives, pas une personne arbitraire.
3. Finalite defensive/investigative : identifier/caracteriser (pattern, infra) ; pas de riposte offensive auto, pas de publication hors cadre.
4. Presomption d'innocence + proportionnalite : l'analyse oriente une enquete, sous les regles du droit.
Exclus : armes offensives, compromission ciblee non consentante, harcelement.

## Fichiers
- scripts/hf_inference.sh : appel HTTP a l'inference HF (HF_TOKEN ou argument).