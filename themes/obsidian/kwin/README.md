# KWin — Obsidian sem moldura (no frame)

Para o efeito "zen" completo, a **decoração da janela** (barra de título + botões
min/max/fechar) precisa sumir. Isso é do **window manager (KWin)**, não do Obsidian.

## Regra (coloca no fim de `~/.config/kwinrulesrc`)

Crie um id único (`uuidgen`) e adicione ao `[General]` (incrementa `count` e
acrescenta o id em `rules=`):

```ini
[<uuid>]
Description=Obsidian sem moldura
noborder=true
noborderrule=2
wmclass=md.obsidian.Obsidian
wmclasscomplete=true
wmclassmatch=2
```

Aplicar **ao vivo**:

```sh
busctl --user call org.kde.KWin /KWin org.kde.KWin reconfigure
```

## Por que `wmclasscomplete=true` (gotcha)

Apps **Electron/flatpak** no Wayland (ex.: Obsidian) costumam ter o
`resourceName` **VAZIO**, com tudo em `resourceClass` (ex.:
`md.obsidian.Obsidian`). Usar `wmclasscomplete=false` faz a regra casar contra
o namespace (vazio) e ela **nunca aplica**. Use `complete=true` + `wmclassmatch=2`
(substring) + `wmclass=<resourceClass>`.

Confirmar a classe da janela sem `qdbus`/`xdotool`: script KWin via
`busctl --user call org.kde.KWin /Scripting org.kde.kwin.Scripting loadScript s <js>`
+ `start`, e capturar com `callDBus(... GetNameOwner ...)` + `dbus-monitor`
(o `print()` do KWin não vaza pro journal).

## Alternativa (sem regra)

`Alt+F3` → *Mover/Redimensionar* continuam funcionando; e o KWin segue
maximizar/minimizar/fechar por atalho (`Meta+Shift`, `Meta+M`, `Alt+F4`).
