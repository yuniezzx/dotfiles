## 个人 dotfiles
我的 dotfiles 设置，常用的有 nvim, tmux, alarcitty



推荐字体：` Cascadia Code SemiLight `,  `JetBrainsMono Nerd Font`



常用的命令:

1. Mac

   ```bash
   cp -R ~/dotfiles/nvim ~/.config/ -- 从 dotfile 复制 Nvim 配置
   rm -r ~/.config/nvim  -- rm既可以删除文件又可以删除文件夹; -r 是向下递归，不管有多少级目录，一并删除
   ```

   

2. 

### Neovim 
配置了一些基本的 lsp, completion, neo-tree 等等。

除了在 keymap 文件中设置的一些映射外，其他的映射如下：

| 按键       | 模式  | 描述       |
| ---------- | :---- | ---------- |
| <leader>cf | n , v | 格式化代码 |
| <leader>qq | n     | 退出nvim   |
| gza + 符号 | n , v | surround   |
