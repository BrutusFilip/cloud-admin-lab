# Git minimum — nácvik (M00-07)

Poslední aktualizace: 2026-10-12

## Měření

| Kolo | Datum | Čas (min:s) | Poznámka |
|---|---|---|---|
| B — z prázdné složky na GitHub | 2026-10-12 | 06:41 | z hlavy, ale musím na GitHub celkově ještě zamakat|

## Postup s větví

1. `git switch -c test/branch` — vytvoří větev a přepne se na ni
2. změna souboru → `git add` → `git commit`
3. `git switch main` — zpět na hlavní větev
4. `git merge test/branch` — sloučení (zde fast-forward)
5. `git push` — odeslání main na GitHub
6. `git branch -d test/branch` — smazání sloučené větve