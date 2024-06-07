## 个人 dotfiles
我的 dotfiles 设置，常用的有 nvim, tmux, alarcitty,hyprland



推荐字体：` maple-font，Cascadia Code SemiLight `,  `JetBrainsMono Nerd Font`

其中 [maple-font](https://github.com/subframe7536/maple-font) 对中文有支持(合并了 Nerd Font 和 中文字体，现在只需一个字体就可以适用所有**编码**场景)



常用的命令:

1. Linux/Mac

   ```bash
   cp -R ~/dotfiles/nvim ~/.config/ -- 从 dotfile 复制 Nvim 配置
   rm -r ~/.config/nvim  -- rm既可以删除文件又可以删除文件夹; -r 是向下递归，不管有多少级目录，一并删除
   ```

   

2. 

### Neovim 
配置了一些基本的 lsp, completion, neo-tree 等等。

常用 `:healthcheck` 用来检查

除了在 keymap 文件中设置的一些映射外，其他常用的映射如下：

| 按键       | 模式  | 描述                                  |
| ---------- | :---- | ------------------------------------- |
| <leader>cf | n , v | 格式化代码                            |
| <leader>qq | n     | 退出nvim                              |
| <leader>tn | n     | 用 telescope 打开 notify 消息         |
| <leader>ms | n     | 打开 Mason (用于管理 language server) |

#### coding

| 按键       | 模式 | 描述          |
| ---------- | ---- | ------------- |
| gcc        | n    | 注释          |
| gza + 符号 | v    | surround      |
| gzd        | v    | 删除 surround |
|            |      |               |



#### buffer

| 按键       | 模式 | 描述                   |
| ---------- | ---- | ---------------------- |
| shift + x  | n    | 关闭当前 buffer        |
| shift + h  | n    | 移动到 previous buffer |
| shift + l  | n    | 移动到 next buffer     |
| <leader>bo | n    | 关闭当前意外buffer     |
|            |      |                        |
|            |      |                        |







---





### Alacritty

自定义的快捷键（可以在 alacritty.toml 中设置 ）

官网配置参数 [链接](https://alacritty.org/config-alacritty.html){:target="_blank"}

| 按键     | action |
| -------- | ------ |
| Ctrl + c | Copy   |
| Ctrl + v | Paste  |
|          |        |

