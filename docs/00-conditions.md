# Podmínky labu (M00-01) — 16. 9. 2026 (odpovědi z 5. 9. 2026)

## a) Azure subscription a strop
- Stav: žádná subscription; zakládá se privátní `sub-smallco-lab`, oddělená od Deufol i POKORNY FLEX (postup: M00-navod.md, kroky 2–3).
- Strop: 30 €/měs (budget 30 € v měně účtu, alerty 50/80/100 % + forecast 100 %); jednorázově FIDO2 klíč 30–50 € (nákup před M09).
- Free account: 200 USD kredit / 30 dní; rozhodnutí o upgradu na Pay-As-You-Go den 25 (datum: 2026-10-16).

## b) Tenant a licence
- Samostatný nový lab tenant SmallCo Lab (`smallcolab-xx.onmicrosoft.com`); produkční tenant POKORNY FLEX se nepoužívá.
- Licence na startu: Entra ID Free. Trialy (Business Premium 1 měsíc, Entra ID P2 30 dní) až v M06-01, blok M06→M10 v jednom horizontu.
- Partner program / M365 Developer Program: ověřeno 2026-10-12 — nárok na E5 developer sandbox nemám (viz sekce M00-08).

## c) Stav labu a repo
- Hyper-V host: příprava nezačala (M03-01). VM DC01 / SRV01 / CLIENT01 / UBU01 neexistují.
- Repo: nové `cloud-admin-lab` (private → public podle M05-05). Starý scaffold `hybrid-enterprise-lab` bude archivován (M00-02).

## Aktualizace
- 2026-09-22: subscription založena (M00-04); kredit, expirace a termín rozhodnutí viz `docs/trials.md`.
- 2026-09-23: West Europe nepřijímá nové zákazníky (RequestDisallowedByAzure) → výchozí region labu: swedencentral.
- 2026-10-12: M00-08 ověřeno — výsledek NE (nárok na E5 developer sandbox nemám), plán trialů M06 beze změny.

## M00-08 — Partner Program / M365 Developer Program (E5 sandbox)

Ověřeno: 2026-10-12 · zdroje: Microsoft Learn — Microsoft 365 Developer Program a FAQ (aktualizace 2026-09-08), Partner Launch Benefits, ISV Success FAQ

| Cesta k E5 developer sandboxu | Splňuji? |
|---|---|
| Předplatné Visual Studio Professional/Enterprise (osobní) | ne — předplatné nemám |
| POKORNY FLEX v oprávněné úrovni Partner Programu (placený balíček / designace) | ne — POKORNY FLEX žádný placený balíček ani designaci nemá |
| ISV Success (B2B aplikace na prodej v Marketplace) | ne — POKORNY FLEX takovou aplikaci nevyvíjí |
| Smlouva Premier / Unified Support | ne — POKORNY FLEX tuto smlouvu nemá |

- **Výsledek:** NE — na Microsoft 365 E5 developer sandbox nemám nárok.
- **Důvod:** nesplňuji žádnou ze čtyř cest k nároku (tabulka výše). Samotné bezplatné členství v Partner Programu nárok nedává, oprávněné úrovně jsou placené. I s nárokem by sandbox pro admin laby nešel použít (licenční omezení níže).
- **Licenční omezení:** sandbox smí sloužit jen k vývoji aplikací; obnova jen při vývojářské aktivitě (max. 90 dní). Pro admin laby se nehodí.
- **Dopad na M06:** plán trialů beze změny — Business Premium trial (1 měsíc) + Entra ID P2 trial (30 dní) aktivuju až v M06-01.
- **Znovu ověřit, když:** POKORNY FLEX z obchodních důvodů koupí partnerský balíček, nebo získám vlastní předplatné Visual Studio.