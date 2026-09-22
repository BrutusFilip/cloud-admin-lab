# Podmínky labu (M00-01) — 16. 9. 2026 (odpovědi z 5. 9. 2026)

## a) Azure subscription a strop
- Stav: žádná subscription; zakládá se privátní `sub-smallco-lab`, oddělená od Deufol i POKORNY FLEX (postup: M00-navod.md, kroky 2–3).
- Strop: 30 €/měs (budget 30 € v měně účtu, alerty 50/80/100 % + forecast 100 %); jednorázově FIDO2 klíč 30–50 € (nákup před M09).
- Free account: 200 USD kredit / 30 dní; rozhodnutí o upgradu na Pay-As-You-Go den 25 (datum: 2026-10-16).

## b) Tenant a licence
- Samostatný nový lab tenant SmallCo Lab (`smallcolab-xx.onmicrosoft.com`); produkční tenant POKORNY FLEX se nepoužívá.
- Licence na startu: Entra ID Free. Trialy (Business Premium 1 měsíc, Entra ID P2 30 dní) až v M06-01, blok M06→M10 v jednom horizontu.
- Partner program / M365 Developer Program: nezjišťováno (M00-08 volitelné).

## c) Stav labu a repo
- Hyper-V host: příprava nezačala (M03-01). VM DC01 / SRV01 / CLIENT01 / UBU01 neexistují.
- Repo: nové `cloud-admin-lab` (private → public podle M05-05). Starý scaffold `hybrid-enterprise-lab` bude archivován (M00-02).

## Aktualizace
- 2026-09-22: subscription založena (M00-04); kredit, expirace a termín rozhodnutí viz `docs/trials.md`.