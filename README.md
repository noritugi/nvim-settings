# Neovim設定ファイル

主にWindowsでの[Neovide](https://neovide.dev)で使うことを想定した設定ファイル群。

## 初期設定
リポジトリクローン
```
git clone https://github.com/noritugi/nvim-settings.git $HOME/.config/nvim
```

ジャンクション作成

```
New-Item -ItemType Junction -Path "$HOME\AppData\Local\nvim" -Target "$HOME\.config\nvim"
```

### 必要なもの

* neovim
* lazygit
* lua51
* luarocks
* deno
* ripgrep
* gcc
* make
* zoxide

すべてscoopでインストールできる。Neovideもインストールできる。
```
scoop install neovim lazygit lua51 luarocks deno ripgrep gcc make zoxide neovide
```

[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)にて、Windows Powershellではなく、  
[PowerShell 7+](https://github.com/powershell/powershell)を前提としているため、これをインストールする。

## Lazygit
Git関係の設定が必要になる。``~/.gitconfig``になければ以下コマンドを実行する。
```
git config --global core.editor nvim
```
Lazygitの設定ファイルの場所は以下コマンドでわかる。
```
lazygit --print-config-dir
```
その中にある``config.yml``を編集する。``edit_nvim_remote.ps1``はこのリポジトリにあるのでそれを指定する。
```yaml
os:
  edit: 'pwsh -NoProfile -File "$PathToScript\edit_nvim_remote.ps1" {{filename}} '
  editAtLine: 'pwsh -NoProfile -File "$PathToScript\edit_nvim_remote.ps1" {{filename}} {{line}} '
  openDirInEditor: 'pwsh -NoProfile -File "$PathToScript\edit_nvim_remote.ps1" {{dir}}'
```
詳しくは以下URLを参照のこと。

* https://github.com/jesseduffield/lazygit/issues/3467#issuecomment-3393095703

これでlazygit上でeキーで編集、CキーでnvimにてCOMMIT_EDITMSGの編集ができる。

## LSP関連

* lua-language-server

今後増える予定。

## SKK
辞書ファイルは ``~/.skk`` 配下に置く。  
``update_skk_dict.ps1`` で辞書ファイルを更新する。  
``update_skk_multi_dict.ps1`` もあるが、今のところ ``SKK-JISYO.L`` のみローカル環境で使用する。  

### ユーザー辞書
ユーザー辞書は ``~/.skk/user/SKK-JISYO.user`` として作成されるため、 ``~/.skk/user`` をバックアップなり、  
オンラインストレージのフォルダにジャンクションを作る等しておく。
```
New-Item -ItemType Junction -Path "C:\path\to\home\.skk\user" -Target "C:\path\to\storage\user"
```
## telescope
キーバインド一覧

| キー           | 内容               |
| ------------ | ---------------- |
| `<leader>ff` | find files       |
| `<leader>fg` | live grep        |
| `<leader>fb` | buffers          |
| `<leader>fr` | recent files     |
| `<leader>fp` | projects         |
| `<leader>fe` | file browser     |
| `<leader>fE` | file browser cwd |
| `<leader>fz` | zoxide jump      |
| `<leader>fs` | session search   |
| `<leader>fw` | session save     |
| `<leader>fW` | session delete   |

## telescope-file-browser
デフォルトのキーバインド

[telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim#mappings)より

| Insert / Normal | fb_actions           | Description                                                                      |
| --------------- | -------------------- | -------------------------------------------------------------------------------- |
| `<A-c>/c`       | create               | Create file/folder at current `path` (trailing path separator creates folder)    |
| `<S-CR>`        | create_from_prompt   | Create and open file/folder from prompt (trailing path separator creates folder) |
| `<A-r>/r`       | rename               | Rename multi-selected files/folders                                              |
| `<A-m>/m`       | move                 | Move multi-selected files/folders to current `path`                              |
| `<A-y>/y`       | copy                 | Copy (multi-)selected files/folders to current `path`                            |
| `<A-d>/d`       | remove               | Delete (multi-)selected files/folders                                            |
| `<C-o>/o`       | open                 | Open file/folder with default system application                                 |
| `<C-g>/g`       | goto_parent_dir      | Go to parent directory                                                           |
| `<C-e>/e`       | goto_home_dir        | Go to home directory                                                             |
| `<C-w>/w`       | goto_cwd             | Go to current working directory (cwd)                                            |
| `<C-t>/t`       | change_cwd           | Change nvim's cwd to selected folder/file(parent)                                |
| `<C-f>/f`       | toggle_browser       | Toggle between file and folder browser                                           |
| `<C-h>/h`       | toggle_hidden        | Toggle hidden files/folders                                                      |
| `<C-s>/s`       | toggle_all           | Toggle all entries ignoring `./` and `../`                                       |
| `<Tab>`         | see `telescope.nvim` | Toggle selection and move to next selection                                      |
| `<S-Tab>`       | see `telescope.nvim` | Toggle selection and move to prev selection                                      |
| `<bs>/`         | backspace            | With an empty prompt, goes to parent dir. Otherwise acts normally                |

## nvim-surround
[nvim-surround usage](https://github.com/kylechui/nvim-surround#rocket-usage)

```help
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    surr*ound_words             ysiw(           ( surround_words )
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```
