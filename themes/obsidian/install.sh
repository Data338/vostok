#!/usr/bin/env bash
# Instala o pacote "Vostok" num vault do Obsidian:
#   - tema (theme.css + manifest.json)  -> .obsidian/themes/Vostok/
#   - snippets (vostok-ui, Tiling WM)   -> .obsidian/snippets/
#   - configs do vault (templates)      -> .obsidian/*.json   (SÓ cria se não existir)
#
# Uso:  ./install.sh /caminho/do/vault
# Depois: reinicie o Obsidian.  (A moldura/decoração é regra do WM — ver kwin/.)
set -euo pipefail

VAULT="${1:?uso: ./install.sh /caminho/do/vault}"
HERE="$(cd "$(dirname "$0")" && pwd)"
O="$VAULT/.obsidian"

[ -d "$O" ] || { echo "erro: '$VAULT' não parece um vault do Obsidian (sem .obsidian/)"; exit 1; }

mkdir -p "$O/themes/Vostok" "$O/snippets"

# 1) tema
cp "$HERE/theme.css" "$HERE/manifest.json" "$O/themes/Vostok/"

# 2) snippets
cp "$HERE/snippets/"*.css "$O/snippets/"

# 3) configs — NUNCA sobrescreve o que já existe (preserva seus ajustes)
for f in appearance.json app.json hotkeys.json community-plugins.json; do
  if [ -f "$O/$f" ]; then
    echo "mantido (já existe): .obsidian/$f  — veja vault-config/$f p/ comparar"
  else
    cp "$HERE/vault-config/$f" "$O/$f"
    echo "criado: .obsidian/$f"
  fi
done

echo
echo "OK. Tema+snippets instalados em $O."
echo "Fallback: tema copiado (não symlink). Se preferir symlink p/ editar o repo ao vivo:"
echo "  rm -rf \"$O/themes/Vostok\" && ln -s \"$HERE\" \"$O/themes/Vostok\""
echo "Reinicie o Obsidian."
