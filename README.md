# VOSTOK

**Soviet-grade neon theme for Neovim + OpenCode.** Pure OLED black, super-saturated syntax, Tron-blue delimiters. Built for scannability — including ADHD brains.

Based on [Scoria](https://github.com/Zyplos/scoria) by Zyplos (OLED black + red VSCode theme), pushed to full neon saturation with a Tron-blue punctuation family.

## Screenshots

Neovim (TypeScript):

![Vostok in Neovim](./screenshots/nvim.png)

OpenCode TUI (shell commands with tree-sitter highlight):

![Vostok in OpenCode](./screenshots/opencode.png)

## Palette

| Role | Hex | Notes |
|---|---|---|
| Background | `#000000` | Absolute black, everywhere |
| Variable / property | `#ff0000` | The reddest red there is |
| Keyword | `#f352ff` | Neon magenta |
| Type / class | `#ffb81a` | Neon gold |
| String | `#7bff57` | Neon green |
| Function | `#5cb6ff` | Neon blue |
| Operator / regex | `#1aefff` | Neon cyan |
| Number / constant | `#ffa34c` | Tron orange |
| Text / punctuation base | `#a4b0c6` | Readable gray-blue |
| Delimiters `; , . :` | `#00d5ff` | Tron blue |
| UI accent | `#ff3e3e` | Scoria red |
| Cursor (editor) | `#ffd300` | Yellow block |

## Neovim

Standalone colorscheme, zero dependencies. Copy the file:

```sh
mkdir -p ~/.config/nvim/colors
cp nvim/colors/vostok.lua ~/.config/nvim/colors/
```

Then activate (LazyVim example — `lua/plugins/theme.lua`):

```lua
return {
  {
    name = "vostok",
    dir = vim.fn.stdpath("config"),
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("vostok")
    end,
  },
}
```

Or plain init.lua: `vim.cmd.colorscheme("vostok")`.

Rainbow brackets (fire ramp, like Scoria) pair well with [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim):

```lua
{ "HiPhish/rainbow-delimiters.nvim", event = "BufReadPost" }
```

## OpenCode

```sh
mkdir -p ~/.config/opencode/themes
cp opencode/vostok.json ~/.config/opencode/themes/
```

Activate in `~/.config/opencode/tui.json`:

```json
{
  "$schema": "https://opencode.ai/tui.json",
  "theme": "vostok"
}
```

Or switch live with `/theme`.

Bonus: per-mode colors in `~/.config/opencode/opencode.json` — red build, Tron-blue plan:

```json
{
  "agent": {
    "build": { "color": "#ff0000" },
    "plan": { "color": "#00d5ff" }
  }
}
```

## Why these choices

- **Few hues, max separation** — each syntax category owns one hue; color-coding with ≤6 categories reduces cognitive load instead of adding noise.
- **No blue as semantic carrier** — blue-on-black is the worst contrast pair and blue/red saturation discrimination is the weakest link in low-dopamine color vision (see: retinal dopaminergic hypothesis of ADHD).
- **Warm spectrum carries meaning** (red→orange→gold fire ramp as an attention gradient); cool colors reserved for strings and metadata.
- **Structure stays visible** — delimiters and brackets are never dimmed into the background.

## Credits

- Base theme: [Scoria](https://github.com/Zyplos/scoria) by [Zyplos](https://github.com/Zyplos) (MIT) — syntax soul is One Dark, UI shell is OLED black + `#ff3e3e`.
- Neon adaptation, OpenCode port, and mode colors: [Data338](https://github.com/Data338).

## License

MIT — see [LICENSE](./LICENSE).
