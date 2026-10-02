# Bezpečnostní hygiena labu (M00-06)

Poslední aktualizace: 2026-10-02

## Identity a přístupy

| Účet | K čemu slouží | MFA | Stav |
|---|---|---|---|
| lab Microsoft účet (outlook.com) | vlastník subscription a fakturace, zakladatel tenantu | Microsoft Authenticator | aktivní |
| admin@… (cloud-only v lab tenantu) | denní správa labu | — | plán: založit před M06 |
| GitHub účet | repozitář cloud-admin-lab (private) | dvoufázové ověření | aktivní |

- Lab účty jsou oddělené od pracovních (Deufol, POKORNY FLEX): vlastní Chrome profil „LAB", žádný pracovní účet se do labu nepřihlašuje a lab účet se nepoužívá na pracovních zařízeních.
- Každý účet vzniká až ve chvíli, kdy je potřeba (testovací uživatel M07-03, nouzový účet M09-03) — nevyužitý privilegovaný účet je zbytečné riziko.

## Hesla a tajné údaje

- Všechna lab hesla jsou v Bitwardenu (region EU, dvoufázové ověření přes Authenticator), ve složce „Lab".
- Pravidlo: heslo nejdřív vygenerovat a uložit do Bitwardenu, teprve potom použít.
- Hlavní heslo k Bitwardenu a obnovovací kódy jsou mimo počítač i telefon (na papíře, doma).
- Do repozitáře nepatří hesla, tokeny, klíče, Tenant ID, ID subscription ani skutečné e-mailové adresy.

## Ochrana repozitáře (3 vrstvy)

1. `.gitignore` — Git vůbec nepřidá citlivé typy souborů (certifikáty a klíče, exporty dat, lokální konfigurace).
2. pre-commit hook `.githooks/pre-commit` — před každým commitem prohledá přidané řádky a zastaví commit, když najde tvar „klíčové slovo + dvojtečka nebo rovnítko + hodnota" (hesla, tokeny, klíče), začátek privátního klíče nebo zakázaný typ souboru. Hodnotu ve výpisu maskuje. Na novém klonu se zapíná příkazem `git config core.hooksPath .githooks`.
3. GitHub push protection — zapnout, až bude repo veřejné (M05-05).

## Test hooku

| Test | Datum | Výsledek |
|---|---|---|
| T1: textový soubor s heslem ve tvaru klíč = hodnota | 2026-10-02 | commit zastaven, hodnota ve výpisu zamaskovaná |
| T2: prázdný soubor .pfx | 2026-10-02 | .gitignore ho nepřidal; po vynuceném přidání (git add -f) commit zastavil hook |
| T3: pět vzorových řádků | 2026-10-02 | zastaveny 3 z 5; falešný poplach u věty, kde za slovem Password a dvojtečkou stál název správce hesel |

## Známá omezení

- Hook funguje jen na počítači, kde je zapnutý (core.hooksPath se neverzuje).
- Jde obejít přes `git commit --no-verify` — použít jen při jistém falešném poplachu, nikdy kvůli skutečnému tajnému údaji.
- Hledá podle vzoru: nechytí tajný údaj v neobvyklém tvaru a občas zastaví i neškodný text.
- Neprohledává starou historii repozitáře — chrání jen nové commity.