<img src="Assets/Logo.png" alt="Postbox Logo" style="width:10%; height:auto;" />

### Altitude Office
# PostBox
Postbox is a modern native mail client that connects to any IMAP mail service.
## Features
- **Native Mail Client**: Quick & responsive
- **Modular Design**: Unlimited customisation
- **Modern Interface**: Clean and Intuitive
- **Agnosticity**: Works with any IMAP server
## Getting Started
PostBox is currently under development and not ready yet.
## Contributing
We welcome all and any contribution to the project. Feel free to submit issues or pull requests.
## License
Postbox is released under the GPL2 licence.
# Documentation
## Base Information
| | |
|---|---|
| Language | C++ |
| Framework | Qt 6 |
| Database | SQLite |

## Core Systems
### Themes & Design
Themes are customisable and modular, with each theme defined in its own QML singleton under `qml/Themes`. Default themes will include:
- Dark (Default)
- Light
- High Contrast

All UI should be using the font Geist (https://vercel.com/font). 

#### Branding Colours
|Type|Hex|
|---|---|
|Brand Generic Pink|E067AE|
|Brand Dark Pink|944473|

#### Stylesheet Properties
| Name | Type | Usage|
|---|---|---|
|backgroundColor|Colour|For window backgrounds|
|elementColor|Colour|For non selected UI elements (e.g. non focused pills)|
|focusedColor|Colour|For selected UI elements|
|accentColor|Colour|Chosen accent colour|
|bodyTextColor|Colour|Colour for primary/body text|
|subTextColor|Colour|Colour for secondary text|
|outlineColor|Colour|Optional outline for themes, mostly for high contrast themes|

#### Theme Loading
On startup:
1. Main.cpp loads the QML module `Postbox`.
2. `Theme.qml` exposes a current theme name and maps it to a registered theme singleton.
3. The theme singletons are compiled into the same QML module, so they are discoverable without a manual import path.

On change:
1. `Theme.qml.setTheme(...)` updates the current theme name.
2. Any QML bindings reading `Theme.backgroundColor`, `Theme.accentColor`, and similar properties update automatically.

#### Current Theme Files
- `qml/Theme.qml`: theme manager and public theme API
- `qml/Themes/ThemeDark.qml`: dark theme singleton
- additional theme files should follow the same pattern and be added to the QML module in `CMakeLists.txt`




