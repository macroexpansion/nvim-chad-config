# NvChad Config

 ## Installation
 - Install [NvChad](https://nvchad.com/docs/quickstart/install)
 - Clone this repo to `.config/nvim` folder
 ```bash
 cd ~/.config/nvim/lua
 git clone git@github.com:macroexpansion/nvim-chad-config.git .
 ```

## add this at the top of `.config/nvim/init.lua`
```lua
require("configs.augment").setup_augment_workspace()
```
