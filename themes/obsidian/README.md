# Vostok — Obsidian (dark OLED + chrome "zen")

Tema **dark (OLED)** para Obsidian — irmão do Vostok do [opencode](https://opencode.ai)
e do Neovim — **mais** um pacote de "sem chrome" (estilo Zen/tiling) pra rodar
sem barra de topo, sem moldura, sem status bar e sem ribbon, tudo por atalho.

Feito/pensado pra **KDE Plasma no Wayland**, mas o tema/snippets são agnósticos de WM.

## Componentes

| Peça | O que faz |
|---|---|
| `theme.css` + `manifest.json` | o tema **Vostok** (paleta, rampa de títulos, glow, code) |
| `snippets/vostok-ui.css` | esconde a **status bar** |
| `snippets/Tiling WM.css` | mata **titlebar/botões/chevrons/faixa de abas/cabeçalho da nota** e **recupera o espaço** (zera o `padding-top` do app-container em frameless) |
| `vault-config/*.json` | templates de config do vault (aparência, hotkeys, app, plugins) |
| `kwin/` | regra do KWin pra tirar a **moldura da janela** (decoração) |
| `install.sh` | instala tema+snippets+config num vault |

## Instalação

```sh
git clone https://github.com/Data338/vostok.git
cd vostok/themes/obsidian
./install.sh /caminho/do/vault      # NUNCA sobrescreve configs existentes
```

Depois:
1. Reinicie o Obsidian.
2. Settings → Aparência → Tema: **Vostok**; e **Estilo da janela: Escondido**.
3. Settings → Aparência → Fragmentos CSS: ligue **vostok-ui** e **Tiling WM**.
4. (Opcional, recomendado) instale o plugin **Style Settings** — aparecem os knobs do tema e do Tiling WM.
5. KWin (sem moldura): ver `kwin/README.md`.

## Atalhos custom (o "esqueminha zen")

Os chevrons de colapsar foram escondidos — os painéis são pelos atalhos
(`.obsidian/hotkeys.json`):

| Atalho | Ação |
|---|---|
| `Ctrl+Shift+L` | Alternar **sidebar esquerda** (explorer/busca) |
| `Ctrl+Shift+R` | Alternar **sidebar direita** (backlinks/outline) |
| `Ctrl+Shift+B` | Mostrar/esconder a **ribbon** (escondida por padrão) |
| `Ctrl+E` | Alternar edição ↔ leitura |
| `Ctrl+O` / `Ctrl+P` / `Ctrl+G` | busca rápida / paleta / grafo |

## Sobrevive a updates? (política)

**Sim — e não precisa pinar o Obsidian.** Detalhe por peça:

| Peça | Sobrevive update? |
|---|---|
| Tema / snippets / hotkeys | ✅ arquivos no `.obsidian/` — update não mexe |
| KWin (noborder) | ✅ config do WM; `wmclass` é estável |
| Plugin Style Settings | ✅ (é plugin; auto-atualiza) |
| **Seletores CSS** | ⚠️ o arquivo sobrevive, mas um *major* do Obsidian pode renomear classes e aí o snippet "some" silenciosamente |

Recomendação: **não pinar**. Só, depois de um update **grande** do Obsidian, re-conferir
os seletores direto no CSS do app (não em fórum velho):

```sh
ASAR=$(find /var/lib/flatpak/app/md.obsidian.Obsidian -name obsidian.asar | head -1)
strings -n 6 "$ASAR" | grep -oE '\.(titlebar|workspace-tab-header-container|view-header|app-container|sidebar-toggle-button|status-bar)[a-z-]*' | sort | uniq -c
```

Se algum nome mudou, ajusta o `Snippets/Tiling WM.css` e comita.

## Créditos

- **Base do tema:** [Scoria](https://github.com/Zyplos/scoria) (MIT) — shell OLED + `#ff3e3e`; alma de sintaxe One Dark.
- **Snippet "Tiling WM":** [ToYoNiX/obsidian-tiling-wm](https://github.com/ToYoNiX/obsidian-tiling-wm) (classes lidas do CSS do próprio Obsidian).
- Neon + port Obsidian: [Data338](https://github.com/Data338).

## Licença

MIT — ver `../../LICENSE`.
