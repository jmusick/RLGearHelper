# RL Gear Helper

A World of Warcraft addon designed for Raid Leaders to quickly look up trinket tier ratings for every class specialization across the **Midnight** expansion raids.

## Features

- **Trinket Browser** — Browse all raid trinkets organised by raid instance.
- **Tier Ratings** — Each trinket lists which specs it is rated S, A, B, C, or D for, colour-coded for fast scanning.
- **Spec Icons** — Every specialisation entry displays its class icon alongside the spec name.
- **Minimap Button** — A draggable minimap button to open/close the window. Supports **LibDataBroker / LibDBIcon** if present; falls back to a built-in button automatically.
- **Resizable & Movable Window** — Drag the title bar to reposition and use the resize grip (bottom-right corner) to adjust the window size.
- **Persistent Layout** — Window position and size are saved between sessions via `SavedVariables`.

## Supported Raids

| Raid | Trinkets |
|------|----------|
| The Dreamrift | 2 |
| The Voidspire | 9 |
| March on Quel'Danas | 6 |

## Tier Key

| Tier | Colour | Meaning |
|------|--------|---------|
| **S** | Orange | Best in Slot |
| **A** | Purple | Strong |
| **B** | Blue | Good |
| **C** | Green | Situational |
| **D** | Grey | Weak / Avoid |

## Installation

1. Download or clone this repository.
2. Copy the `RLGearHelper` folder into your WoW AddOns directory:
   ```
   World of Warcraft\_retail_\Interface\AddOns\RLGearHelper\
   ```
3. Launch WoW and enable **RL Gear Helper** on the AddOns screen.

## Usage

- Click the **minimap button** to open or close the window.
- Use the **raid buttons** at the top of the window to filter trinkets by raid.
- Click any **trinket** in the list to see a full breakdown of spec tier ratings in the right panel.

### Slash Commands

| Command | Action |
|---------|--------|
| `/rlgh` | Toggle the main window |
| `/rlgearhelper` | Toggle the main window |

## Optional Dependencies

- **LibDataBroker-1.1** + **LibDBIcon-1.0** — When present, the minimap button is managed by these libraries and works with any minimap button manager (e.g., Broker2FuBar, Bazooka).

## Version

**1.1.0** — Interface 12.0.0.1 (Midnight)
