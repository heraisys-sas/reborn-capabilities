# gh-actions-runtime

Contourne les limites locales du sandbox de l'agent (pas de python/gcc, RAM 4 Go, pas d'install, pas d'acces /data hote) en executant du travail sur les runners GitHub Actions de repos publics (gratuits, illimites, Linux 2 vCPU / 7 Go / 14 Go, python+gcc+make preinstalles).

## Quand l'utiliser
- Besoin d'executer Python, compiler, lancer un script lourd, mesurer des performances.
- Tests de logique avant de passer a l'hote Xeon pour le lourd.
- Pipeline build/test reutilisable.

## Faits
- Repos publics : minutes gratuites illimitees, jobs jusqu'a 6h.
- Runner heberge Linux : 2 vCPU / 7 Go / 14 Go -> tests + petits modeles uniquement.
- Runner self-hosted (machine Xeon) : temps illimite, acces NVMe/RAM -> vrai travail Colibri.
- Ne pas modifier son sandbox : GH Actions = CPU distant.

## Protocole
1. Encode la tache dans un workflow .github/workflows/*.yml (workflow_dispatch ou push).
2. Ecris le workflow via le connecteur GitHub (create_or_update_file).
3. Declenche via trigger_workflow (workflow_dispatch).
4. Recolte les resultats : get_workflow_runs, get_workflow_run_jobs, get_job_logs, get_workflow_run_artifacts.
5. Rapporte les conclusions dans la conversation (pas juste "job fini").
6. Reutilise : stocke job + parametres comme competence catalogue.

## Bonnes pratiques
- Workflow parametrable (inputs) pour relancer facilement.
- Runner self-hosted (runs-on: [self-hosted, xeon]) pour le lourd Colibri.
- timeout-minutes en precaution sur les jobs longs.
- Secrets (tokens HF/CUDO) via GitHub Secrets, jamais en clair.