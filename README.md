# CodeLikeClock.widget

A stylish Übersicht widget that displays the current time and date in a code-like format, inspired by developer aesthetics. It uses a monospaced font and color-coded syntax using colors from the Catppuccin Frappe palette ([see palette](https://catppuccin.com/palette/)) to make your desktop look like a modern IDE.

## Features
- Shows year, month, day, weekday, hour, minute, and second
- Displays day progress as a percentage
- Supports multiple languages (English, German, Dutch)
- 12h/24h clock format toggle
- Customizable appearance with Hack Nerd Font Mono

## Installation

### Instructions
1. Download or clone this repository.
2. Place the `CodeLikeClock.widget` folder in your Übersicht widgets directory (usually `~/Library/Application Support/Übersicht/widgets/`).
3. Make sure the font file `HackNerdFontMono-Regular.ttf` is present in the widget folder.
4. Enable the widget in Übersicht.

## Customization

### Change 24h to 12h Clock Format
By default, the widget uses a 24-hour clock. To switch to a 12-hour (AM/PM) format:
1. Open `index.coffee` in the widget folder.
2. Find the line:
	```coffeescript
	clock12h = false
	```
3. Change it to:
	```coffeescript
	clock12h = true
	```
4. Save the file and refresh the widget in Übersicht.

### Change or Add Language
The widget supports multiple languages for weekdays and months. To change the language:
1. Open `index.coffee` in the widget folder.
2. At the top, find the `settings` object and set your desired language code (e.g., `'en'`, `'de'`, `'nl'`):
	```coffeescript
	settings =
		 lang: 'en'  # Change 'en' to your language code
	```
3. To add a new language, add a new entry to the `locale` object with your translations for `weekdays` and `months`.
4. Set `settings.lang` to your new language code.
5. Save the file and refresh the widget in Übersicht.

### Widget Appearance
![Screenshot of Widget](Screenshots/Screenshot%20of%20Widget.png)

### CPU Usage
![Screenshot of Cpu Usage](Screenshots/Screenshot%20of%20Cpu%20Usage.png)

If you enjoy coding or just like the look of code editors, this widget is made for you! I created it to bring a bit of developer style to your desktop, and I hope you have as much fun using it as I did making it.
