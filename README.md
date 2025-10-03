# Godot 2D Platformer (Learning Project)

> [Play online](https://kaeri-gg.github.io/godot-basics/release/)

This is my first **Godot Engine** project, created while learning in the  
**Basics of Game Development** course for my **MSc in Digital Learning Games** at **Tallinn University (2025)**.  

<img width="569" height="314" alt="image" src="https://github.com/user-attachments/assets/bd5b07a5-ec41-4740-aa26-110273153263" />

The project is inspired by classic platformers like *Super Mario*, but it is still **incomplete**.  
I’m using this project mainly to explore the fundamentals of Godot and 2D game development.  


## 🎮 Current Features
- Player movement (run, jump, dash)
- Coin collection
- Enemies (basic interaction)
- Moving platforms
- Basic background setup
- Pixel art retro style


## 📂 How to Open the Project
1. Make sure you have **Godot Engine** installed (version 4.x recommended).  
   👉 [Download Godot](https://godotengine.org/download)
2. Clone this repository:
   ```bash
   git clone <repo-url>
3. Open the project by importing or clicking the project.gd file.

# 🎨 Credits

All assets in this project have been **repackaged and/or modified by Brackeys**.  
License: **Creative Commons Zero (CC0)**


## 🕹️ Sprites

**analogStudios_**
- [Knight](https://analogstudios.itch.io/camelot)  
- [Slime](https://analogstudios.itch.io/dungeonsprites)  
- [Platforms & Coin](https://analogstudios.itch.io/four-seasons-platformer-sprites)  

**RottingPixels**
- [World Tileset & Fruit](https://rottingpixels.itch.io/four-seasons-platformer-tileset-16x16free)  


## 🔊 Sounds & Music
- **Brackeys**  
- **Asbjørn Thirslund**  
- **Sofia Thirslund**


## 🔤 Fonts
- **Jayvee Enaguas – HarvettFox96**  
  - [Pixel Operator](https://www.dafont.com/pixel-operator.font?l[]=10&l[]=1)  


## 📜 License
All listed assets are under **CC0** license.  
Free to use, modify, and distribute.

## 🌐 GitHub Pages Deployment

This project is configured for automatic deployment to GitHub Pages. Here's everything you need to know:

### 🚀 **Play the Game Online**
[**🎮 Play Now on GitHub Pages →**](https://your-username.github.io/godot-basics/)

### 📋 **Deployment Setup**

**Prerequisites:**
- Repository must be public (for free GitHub Pages)
- GitHub Pages must be enabled in repository settings

**Setup Steps:**
1. Go to your repository **Settings** → **Pages**
2. Set **Source** to "Deploy from a branch"
3. Set **Branch** to `main` (root folder)
4. The game will auto-deploy on every push to `main` branch

### ⚙️ **Export Configuration (Important!)**

For Godot web exports to work on GitHub Pages, specific settings are required:

#### **In Godot Export Settings:**
1. **Project** → **Export** → Select **"Web"** preset
2. **Critical Settings** (must be disabled):
   - ✅ **Thread Support**: `OFF`
   - ✅ **Extensions Support**: `OFF`
3. **Export** your game to `index.html`

#### **Audio Bus Fix:**
All `AudioStreamPlayer` nodes must use the default **Master** bus only.

❌ **Remove these from .tscn files:**
```
bus = &"Music"
bus = &"SFX"
bus = &"Sound"
```

✅ **Use default bus (no bus line needed):**
```
[node name="AudioStreamPlayer2D" type="AudioStreamPlayer2D"]
stream = ExtResource("1_audio")
autoplay = true
```

### 🔧 **Troubleshooting Common Errors**

#### **Error: `SharedArrayBuffer transfer requires crossOriginIsolated`**
**Cause:** Threading is enabled in export settings  
**Fix:** Disable **Thread Support** in Godot export settings and re-export

#### **Error: `invalid bus index "-1"`**
**Cause:** Audio nodes reference non-existent audio buses  
**Fix:** Remove all `bus = &"BusName"` lines from scene files

#### **Error: `The following features required to run Godot projects on the Web are missing`**
**Cause:** Cross-Origin Isolation headers missing  
**Fix:** Ensure Thread Support is disabled (GitHub Pages doesn't support custom headers)

### 📝 **Post-Export Verification**

After exporting, verify your `index.html` contains:

```javascript
const GODOT_THREADS_ENABLED = false;
```
```javascript
"ensureCrossOriginIsolationHeaders": false
```

### 📁 **Required Files for Deployment**

Ensure these files are in your repository root:
- ✅ `index.html` (main game file)
- ✅ `index.js` (game engine)
- ✅ `index.wasm` (compiled game)
- ✅ `index.pck` (game assets)
- ✅ `index.icon.png` (favicon)
- ✅ `index.png` (loading splash)
- ✅ `.nojekyll` (disables Jekyll processing)
- ✅ `.github/workflows/deploy.yml` (auto-deployment)

### 🔄 **Automatic Deployment Workflow**

The repository includes a GitHub Actions workflow that:
1. **Triggers** on every push to `main` branch
2. **Deploys** all files to GitHub Pages automatically
3. **Updates** the live game within minutes

**Manual deployment trigger:** Go to **Actions** tab → **Deploy to GitHub Pages** → **Run workflow**

### 💡 **Development Tips**

**Local Testing:**
```bash
npx http-server --cert ~/cert.pem --key ~/key.pem --tls -o .
```

Run once if certs are not present (use gitHub bash)
```bash
openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem
```

**Export Checklist:**
- [ ] Thread Support disabled
- [ ] Extensions Support disabled  
- [ ] No custom audio buses used
- [ ] All files exported to repository root
- [ ] Local testing successful
- [ ] Committed and pushed to main branch

**Deployment Status:** Check the **Actions** tab for deployment progress and any errors.
