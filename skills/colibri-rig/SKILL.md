# colibri-rig

Deploiement / optimisation du moteur Colibri (github.com/JustVugg/colibri) sur la machine hote Xeon : 2x Intel Xeon Gold 6526Y (64 threads), ~500 Go RAM, 8 NVMe (2x894G + 6x3.5T, RAID-1/RAID-10), pas de GPU.

## Faits cles Colibri
- Moteur d'inference en C pur, aucun GPU requis ; traite VRAM/RAM/NVMe comme une seule hierarchie (experts streames a la demande).
- Le debit disque est LE facteur de vitesse ("speed is set by your disk").
- Modeles natifs : GLM-5.2 (744B), GLM-5.3-Flash, Inkling, Kimi K3, DeepSeek V4 Flash, Qwen3.6-35B-A3B, OLMoE ; + Qwen3.8-Flash.
- Qwen3.6-35B-A3B : ~20 Go int4, resident RAM (~24 Go requis), GPU non requis, ideal pour test de demarrage.
- GLM-5.2 int4 : ~372 Go, 16 Go RAM min, streaming multi-NVMe.
- Dual-SSD : COLI_MODEL_MIRROR=/second/copy dedouble la bande passante de lecture (parfait pour 8 NVMe).
- COLI_NUMA=1 interleave la RAM pivote sur double socket.

## Optimisations pour CETTE machine
1. Privilegier la residence complete en RAM (elle a ~448 Go libres) -> le disque sort du chemin de decodage.
2. Pour streaming froid, dual/triple mirror sur NVMe distincts (COLI_MODEL_MIRROR) pour cumuler la bande passante.
3. COLI_NUMA=1 (double socket). Mesurer DIRECT=1 (O_DIRECT, drive-dependent).
4. PIN_GB / cache LRU pour apprendre le workload et chauffer les experts les plus routes.

## Contraintes d'execution
- Le sandbox agent ne peut pas construire/executer Colibri (pas de gcc) ni atteindre /data : builds/run se font sur la machine hote, ou via GH Actions self-hosted connecte au Xeon.
- Build : gcc + OpenMP (pas de GPU). Download modele : ./coli convert (python).

## Statut
En plan - voir aussi gh-actions-runtime pour le contournement.