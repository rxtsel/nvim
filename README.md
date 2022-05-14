# Neovim Customization :skull:

![image](https://user-images.githubusercontent.com/85462420/168401029-61fcefa1-329c-47cc-84eb-9ae64486908f.png)
<details>
<summary>Galley</summary>
  
![image](https://user-images.githubusercontent.com/85462420/168401015-ea480f24-a3c6-4aab-8c50-2a4ec43dc607.png)
  
 ![image](https://user-images.githubusercontent.com/85462420/168401685-d617161b-ddef-415d-b302-f9c544d77a53.png)

 </details>

## Requiriments:

#### [Packer](https://github.com/wbthomason/packer.nvim) for Unix, Linux Installation:
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
        ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
#### Packer for Windows Powershell Installation:
```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

Compiler C for windows:
```
choco install mingw
```
---

#### Others:

```bash
sudo pacman -S ripgrep xsel gcc ueberzug pdftoppm ffmpegthumbnailer tree-sitter luajit
```

Install language-servers manually
```bash
sudo npm i -g eslint typescript eslint-language-server typescript-language-server diagnostic-languageserver
```

Install for formatter with null-ls
```bash
pip install black

yay -S stylua-bin
```
