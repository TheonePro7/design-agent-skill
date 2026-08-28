# Design Agent Skill — Make Any AI Agent "Usable AND Good-Looking"

> Install one skill and your agent instantly gets **world-class designer** standards: reusable across projects, no retraining, with hard guardrails.
> Works with **Claude Code / DSH (DeepSeek Harness) / Hermes / Codex**.

## This isn't "a pile of docs" — it's rules your agent can actually follow

Most AI UI work fails because the model has no *executable* judgment standard. This skill distills a top design team's **knowledge + workflow + red lines** into rules an agent can follow directly, backed by **4 hard gates** that stop it from improvising.

```
[Similar projects]  Give you a doc dump → agent still mangles the UI
[This skill]       Distilled rules + gates → agent asks for a reference, holds back decoration, uses real data
```

## 🎬 Before / After (30-sec Demo)

> [Insert GIF here] Same prompt: "Make this page look more premium"
> **Without**: adds gradients, glows, emoji, fake data
> **With**: asks which system to reference → follows the type scale → uses existing assets → real chart data

---

## What you get (batteries included)

| Module | Contents |
|---|---|
| 🧠 Design principles | Gestalt / typography / color / interaction / accessibility (consensus) |
| 🔍 Reference anatomy | Linear / Stripe / Vercel / Claude — 4 distilled design systems |
| 📦 Asset library | Icon / chart / motion / component selection guide ("never hand-roll what exists") |
| 🗂 Bucket index | 54 design-system buckets (A–H, 8 scenarios) |
| 📐 Project spec | One `DESIGN.md` per project + feedback loop |
| 🚧 **GATE 0–3** | **Hard guardrails against AI going off the rails** |

### The Gates (the biggest difference from a normal skill)
- **GATE 0 · Before starting**: must confirm the reference system; no full redesign without confirmation
- **GATE 1 · Prototype**: ship 1 sample first, get sign-off, then scale
- **GATE 2 · Assets**: use what's in the library — never hand-roll
- **GATE 3 · Data**: no fake data (`Math.sin()`-style charts are the worst offense)

---

## Install (3 steps, pick your platform)

### Claude Code
```bash
git clone https://github.com/TheonePro7/design-agent-skill.git
cd design-agent-skill && bash install.sh
```
> Copies `skills/designer/` (with the self-contained `resources/` knowledge base) to `~/.claude/skills/designer/`.

### DSH (DeepSeek Harness)
```bash
bash install-dsh.sh
# Installs to the DSH user skill root ~/.agents/skills/designer/
```

### Hermes
```bash
bash install-hermes.sh          # install from current dir
bash install-hermes.sh --update # pull latest from GitHub
```
> Hermes uses a different skill format (`references/` not `resources/`), so this repo ships a **separate Hermes package** at `hermes/designer/`.

---

## Design philosophy (the rules it enforces)
1. **Reference first**: "premium / nice-looking" → ask which system, don't guess
2. **Restraint**: no gradients, no colored glows, no decorative pseudo-elements, no emoji icons
3. **No half-baked**: a plain color card / icon-less input reads as "lazy"
4. **Assets first**: use what's in the asset index
5. **Real data**: no fake chart data (most serious mistake)

---

## Teams with
Design's **upstream is the product manager** → pair with [`product-manager-skill`](https://github.com/TheonePro7/product-manager-skill): first define "which fields, for whom, what experience", then "how to make it look good".

---

**⭐ Star it if it helps; issues & PRs welcome to make it even more professional.**
