# Toki — Wearable DIY

Guide d'assemblage du device d'enregistrement BLE.

---

## Composants

| Composant | Spécifications | Prix approx. |
|---|---|---|
| **Seeed XIAO nRF52840** | ARM Cortex-M4 64MHz, BLE 5.0, NFC, JST 1.25, 21×17.5mm | ~10€ |
| **INMP441** | I²S 24-bit, omnidirectionnel, SNR 61 dBA, 1.4mA, 1.8–3.3V | ~2€ (x3) |
| **LiPo 1000mAh JST 1.25** | 3.7V, 102050 (10×20×50mm), protection intégrée | ~8€ |

**Total : ~20€**

---

## Schéma de câblage

```
INMP441          XIAO nRF52840
-------          -------------
VCC    ────────→  3.3V
GND    ────────→  GND
SCK    ────────→  D8  (I²S clock)
WS     ────────→  D7  (I²S word select)
SD     ────────→  D6  (I²S data)
L/R    ────────→  GND (canal gauche)

Batterie LiPo → connecteur JST 1.25 du XIAO (vérifier polarité !)
```

**Code couleur des fils conseillé :**
- Rouge → VCC / 3.3V
- Noir → GND
- Jaune → SCK (D8)
- Bleu → WS (D7)
- Vert → SD (D6)

---

## Dimensions assemblées

```
XIAO    : 21 × 17.5 × 5 mm
INMP441 : 15 × 18 mm
LiPo    : 10 × 20 × 50 mm

Assemblé (estimé) : ~55 × 22 × 15 mm
                    ≈ taille d'une grosse clé USB
```

---

## Autonomie

| Mode | Consommation | Autonomie (1000mAh) |
|---|---|---|
| BLE streaming continu | ~22 mA | ~45h théoriques |
| Usage réel (variation BLE) | ~25–30 mA | ~30–40h |

Largement suffisant pour 24h+ en continu.

---

## Setup firmware

```bash
# 1. Installer le firmware Omi sur le XIAO
# Télécharger le .uf2 depuis les releases Omi
# Brancher le XIAO en USB-C, double-clic sur le bouton reset → mode bootloader
# Copier le .uf2 dans le lecteur qui apparaît

# 2. Pairer avec l'app Toki
# Ouvrir Toki → Settings → Device Settings → Scan
```

> Le firmware Omi standard tourne sur le XIAO nRF52840 sans modification.
> La différence est uniquement côté app et backend.

---

## Notes d'assemblage

- **Polarité JST** : vérifier impérativement que le + (rouge) correspond au + du connecteur XIAO avant de brancher la batterie. Si inversé → échanger les fils dans le connecteur (outil : épingle ou coupe-papier fin).
- **Breadboard** : recommandé pour tester le câblage avant de souder (~2€ sur AliExpress).
- **Boîtier** : impression 3D ou boîtier plastique universel ~3€. Dimensions intérieures min : 60×25×20mm.

---

*Mis à jour : 2026-03-27*
