# Nákladové pojistky labu (M00-05)

Poslední aktualizace: 2026-09-23

## Budget

| Položka | Hodnota |
|---|---|
| Název | budget-lab-monthly |
| Scope | lab subscription | fakturační účet (na Free Trial subscription budget nejde; po upgradu přesunout na subscription)
| Částka | 30 USD / měsíc (měsíční reset) |
| Alerty | Actual 50 %, 80 %, 100 %; Forecasted 100 % |
| Příjemci | lab e-mail + osobní e-mail (azure-noreply@microsoft.com mezi bezpečnými odesílateli) |
| Test doručení | 2026-09-23: testovací budget 1 EUR s alertem Actual 1 %, zdroj ACI 1 vCPU / 1 GB cca 45 min ve swedencentral — výsledek: doručeno 2026-09-24 do doručené pošty (ne spam); test proběhl na úrovni fakturačního účtu; testovací budget smazán |

## Alert nezastaví útratu

Budget jen posílá upozornění — zdroje nevypne a útratu nezastaví. Navíc má zpoždění: data o nákladech přicházejí za 8–24 h, budget se vyhodnocuje jednou denně, takže alert může dorazit až den či dva po vzniku nákladu. Útratu zastaví jen ruční brzdy níže.

## Ruční brzdy

1. **Auto-shutdown u každé VM** — nastavit při vytvoření VM (VM → Auto-shutdown, např. 22:00, časové pásmo Vídeň/Berlín). Vypnutá a dealokovaná VM neplatí za výpočetní výkon, ale disky a statické veřejné IP adresy se platí dál — nepotřebné mazat.
2. **Úklid po každém labu** — každý lab ve vlastní resource group; po skončení `az group delete --name <rg> --yes`, ověření `az resource list -o table` (prázdné nebo jen vědomě ponechané zdroje) a druhý den kontrola Cost analysis.
3. **Jen B-series VM** — burstable VM jsou nejlevnější pro zátěž, která většinu času nic nedělá, což je typický lab. Vždy nejmenší velikost, která stačí.
4. **Limit útraty free účtu** — do 2026-10-21 (nebo do upgradu) tvrdě zastaví útratu na výši kreditu. Po upgradu na Pay-As-You-Go zmizí a zbývá jen budget a body 1–3.
5. **Region** — laby ve swedencentral; West Europe nepřijímá nové zákazníky.