-- Vostok — tema neon Soviet-grade para Neovim.
-- Baseado no Scoria (zyplos/scoria) com saturação turbinada + azul Tron.
-- Sintaxe: variável #ff2a00 | keyword #f352ff | tipo #ffb81a | string #7bff57
--   função #5cb6ff | operador/regex #1aefff | número #ffa34c | texto #a4b0c6
--   delimitadores ;,.: #00d5ff | UI OLED #000 + accent #ff3e3e.
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "vostok"

local p = {
  bg0     = "#000000",
  bg1     = "#0a0a0a",
  bg2     = "#050505",
  sel     = "#571111", -- selection.background #ff3e3ebf solidificado
  fg      = "#ebebeb", -- editor.foreground
  border  = "#444444", -- bordas do Scoria
  borderH = "#ff3e3e", -- bordas de foco / accent
  varR    = "#ff2a00", -- variável — ESCARLATE, inverso exato do Tron #00d5ff
  kwM     = "#f352ff", -- keyword — neon magenta
  typeA   = "#ffb81a", -- tipo — neon dourado
  strG    = "#7bff57", -- string — neon verde
  fnB     = "#5cb6ff", -- função — neon azul
  opC     = "#1aefff", -- operador/regex — neon ciano
  numO    = "#ffa34c", -- número/const — neon laranja Tron
  txtG    = "#a4b0c6", -- punctuation, operador comum (boosted #ABB2BF)
  neon    = "#00d5ff", -- delimitadores ; , . : — azul neon Tron
  cmt     = "#666666", -- comment italic
  cmtD    = "#546178", -- comment escuro (boosted #5C6370)
  errR    = "#f70000", -- error (boosted #e41313)
  warnY   = "#ffd300", -- warning / cursor
  infoB   = "#1a9fff", -- info — neon azul
  hintG   = "#b1b1b1", -- hint
  gitA    = "#21ff85", -- git added — neon verde
  gitU    = "#74d075", -- git untracked (boosted #84c085)
  diffA   = "#0d2a1c",
  diffC   = "#2a240a",
  diffD   = "#2a0d0d",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor / UI (workbench do Scoria) ────────────────────────────────
hl("Normal", { fg = p.fg, bg = p.bg0 })
hl("NormalNC", { fg = p.fg, bg = p.bg0 })
hl("NormalFloat", { fg = p.fg, bg = p.bg1 })
hl("FloatBorder", { fg = p.border, bg = p.bg1 })
hl("FloatTitle", { fg = p.borderH, bg = p.bg1, bold = true })
hl("FloatFooter", { fg = p.cmt, bg = p.bg1 })
hl("Cursor", { fg = p.bg0, bg = p.warnY }) -- editorCursor #ffd300
hl("lCursor", { fg = p.bg0, bg = p.warnY })
hl("CursorIM", { fg = p.bg0, bg = p.warnY })
hl("TermCursor", { fg = p.bg0, bg = p.borderH })
hl("TermCursorNC", { fg = p.bg0, bg = p.cmt })
hl("CursorLine", { bg = "#0d0d0d" })
hl("CursorLineNr", { fg = "#ffffff", bg = p.bg0, bold = true })
hl("CursorColumn", { bg = p.bg1 })
hl("ColorColumn", { bg = "#2d1b1b" })
hl("LineNr", { fg = p.border, bg = p.bg0 })
hl("LineNrAbove", { fg = p.border, bg = p.bg0 })
hl("LineNrBelow", { fg = p.border, bg = p.bg0 })
hl("SignColumn", { bg = p.bg0 })
hl("FoldColumn", { fg = p.border, bg = p.bg0 })
hl("Folded", { fg = p.txtG, bg = p.bg1 })
hl("WinSeparator", { fg = p.border, bg = p.bg0 })
hl("VertSplit", { fg = p.border, bg = p.bg0 })
hl("StatusLine", { fg = "#ffffff", bg = p.bg0 })
hl("StatusLineNC", { fg = p.txtG, bg = p.bg0 })
hl("TabLine", { fg = p.txtG, bg = p.bg0 })
hl("TabLineFill", { bg = p.bg0 })
hl("TabLineSel", { fg = "#ffffff", bg = "#1a0505", bold = true })
hl("WinBar", { fg = p.txtG, bg = p.bg0 })
hl("WinBarNC", { fg = p.cmt, bg = p.bg0 })
hl("MsgArea", { fg = p.fg, bg = p.bg0 })
hl("MsgSeparator", { fg = p.border, bg = p.bg0 })
hl("ModeMsg", { fg = p.fg, bold = true })
hl("MoreMsg", { fg = p.opC })
hl("ErrorMsg", { fg = p.errR, bold = true })
hl("WarningMsg", { fg = p.warnY })
hl("Question", { fg = p.borderH, bold = true })
hl("Directory", { fg = p.fnB })
hl("Title", { fg = "#ffffff", bold = true })
hl("Conceal", { fg = p.cmt })
hl("NonText", { fg = "#242424" })
hl("SpecialKey", { fg = p.cmt })
hl("Whitespace", { fg = "#242424" })
hl("EndOfBuffer", { fg = p.bg0, bg = p.bg0 })
hl("Pmenu", { fg = "#d9d9d9", bg = p.bg2 })
hl("PmenuSel", { fg = "#ffffff", bg = p.sel, bold = true })
hl("PmenuSbar", { bg = p.bg2 })
hl("PmenuThumb", { bg = p.border })
hl("PmenuExtra", { fg = p.cmt, bg = p.bg2 })
hl("PmenuExtraSel", { fg = p.txtG, bg = p.sel })
hl("PmenuKind", { fg = p.kwM, bg = p.bg2 })
hl("PmenuKindSel", { fg = p.kwM, bg = p.sel })
hl("WildMenu", { fg = p.bg0, bg = p.warnY, bold = true })
hl("QuickFixLine", { fg = "#ffffff", bg = p.sel, bold = true })
hl("Visual", { bg = p.sel })
hl("VisualNOS", { bg = p.sel })
hl("MatchParen", { fg = p.warnY, bg = "#29240e", bold = true })

-- ── Busca / diff / spell ─────────────────────────────────────────────
hl("Search", { fg = p.warnY, bg = "#3a2d00" })
hl("IncSearch", { fg = p.bg0, bg = p.warnY, bold = true })
hl("CurSearch", { fg = p.bg0, bg = p.warnY, bold = true })
hl("Substitute", { fg = "#ffffff", bg = p.borderH, bold = true })
hl("DiffAdd", { fg = "#1aff81", bg = p.diffA })
hl("DiffChange", { fg = p.warnY, bg = p.diffC })
hl("DiffDelete", { fg = p.errR, bg = p.diffD })
hl("DiffText", { fg = p.warnY, bg = "#3a2d10", bold = true })
hl("DiffAdded", { fg = "#1aff81" })
hl("DiffRemoved", { fg = p.errR })
hl("DiffFile", { fg = p.numO })
hl("DiffOldFile", { fg = p.errR })
hl("DiffNewFile", { fg = "#1aff81" })
hl("DiffLine", { fg = p.fnB })
hl("DiffIndexLine", { fg = p.numO })
hl("SpellBad", { sp = p.errR, undercurl = true })
hl("SpellCap", { sp = p.warnY, undercurl = true })
hl("SpellRare", { sp = p.kwM, undercurl = true })
hl("SpellLocal", { sp = p.opC, undercurl = true })

-- ── Diagnósticos / LSP UI ────────────────────────────────────────────
hl("DiagnosticError", { fg = p.errR })
hl("DiagnosticWarn", { fg = p.warnY })
hl("DiagnosticInfo", { fg = p.infoB })
hl("DiagnosticHint", { fg = p.hintG })
hl("DiagnosticOk", { fg = "#00b04f" })
hl("DiagnosticUnderlineError", { sp = p.errR, underline = true })
hl("DiagnosticUnderlineWarn", { sp = p.warnY, underline = true })
hl("DiagnosticUnderlineInfo", { sp = p.infoB, underline = true })
hl("DiagnosticUnderlineHint", { sp = p.hintG, underline = true })
hl("DiagnosticUnderlineOk", { sp = "#00b04f", underline = true })
hl("DiagnosticVirtualTextError", { fg = p.errR, bg = p.diffD })
hl("DiagnosticVirtualTextWarn", { fg = p.warnY, bg = p.diffC })
hl("DiagnosticVirtualTextInfo", { fg = p.infoB, bg = p.bg1 })
hl("DiagnosticVirtualTextHint", { fg = p.hintG, bg = p.bg1 })
hl("DiagnosticFloatingError", { fg = p.errR, bg = p.bg1 })
hl("DiagnosticFloatingWarn", { fg = p.warnY, bg = p.bg1 })
hl("DiagnosticFloatingInfo", { fg = p.infoB, bg = p.bg1 })
hl("DiagnosticFloatingHint", { fg = p.hintG, bg = p.bg1 })
hl("DiagnosticSignError", { fg = p.errR, bg = p.bg0 })
hl("DiagnosticSignWarn", { fg = p.warnY, bg = p.bg0 })
hl("DiagnosticSignInfo", { fg = p.infoB, bg = p.bg0 })
hl("DiagnosticSignHint", { fg = p.hintG, bg = p.bg0 })
hl("LspInlayHint", { fg = "#b77979", bg = "#190a0a" })
hl("LspReferenceText", { bg = "#331414" })
hl("LspReferenceRead", { bg = "#331414" })
hl("LspReferenceWrite", { bg = "#3a1a1a" })
hl("LspCodeLens", { fg = "#d09191" })
hl("LspCodeLensSeparator", { fg = "#d09191" })
hl("LspSignatureActiveParameter", { fg = p.warnY, bg = "#3a2d00", bold = true })
hl("SnippetTabstop", { bg = "#2a1408" })
hl("healthError", { fg = p.errR })
hl("healthSuccess", { fg = "#1aff81" })
hl("healthWarning", { fg = p.warnY })

-- ── Sintaxe legada ───────────────────────────────────────────────────
hl("Comment", { fg = p.cmt, italic = true })
hl("Constant", { fg = p.numO })
hl("String", { fg = p.strG })
hl("Character", { fg = p.strG })
hl("Number", { fg = p.numO })
hl("Boolean", { fg = p.numO })
hl("Float", { fg = p.numO })
hl("Identifier", { fg = p.varR })
hl("Function", { fg = p.fnB })
hl("Statement", { fg = p.kwM })
hl("Conditional", { fg = p.kwM })
hl("Repeat", { fg = p.kwM })
hl("Label", { fg = p.fnB })
hl("Operator", { fg = p.txtG })
hl("Keyword", { fg = p.kwM })
hl("Exception", { fg = p.kwM })
hl("PreProc", { fg = p.kwM })
hl("Include", { fg = p.kwM })
hl("Define", { fg = p.kwM })
hl("Macro", { fg = p.kwM })
hl("PreCondit", { fg = p.kwM })
hl("Type", { fg = p.typeA })
hl("StorageClass", { fg = p.kwM })
hl("Structure", { fg = p.typeA })
hl("Typedef", { fg = p.typeA })
hl("Special", { fg = p.opC })
hl("SpecialChar", { fg = p.opC })
hl("SpecialComment", { fg = p.cmtD })
hl("Tag", { fg = p.varR })
hl("Delimiter", { fg = p.neon })
hl("Debug", { fg = p.errR })
hl("Underlined", { fg = p.kwM, underline = true })
hl("Ignore", { fg = p.border })
hl("Error", { fg = "#ffffff", bg = p.errR })
hl("Todo", { fg = p.numO, bold = true })
hl("Added", { fg = "#00b04f" })
hl("Changed", { fg = p.typeA })
hl("Removed", { fg = p.varR })

-- ── Treesitter (tokenColors do Scoria, turbinados) ───────────────────
local ts = {
  ["@comment"] = { fg = p.cmt, italic = true },
  ["@comment.todo"] = { fg = p.numO, bold = true },
  ["@comment.error"] = { fg = p.errR },
  ["@comment.warning"] = { fg = p.warnY },
  ["@comment.note"] = { fg = p.opC },
  ["@comment.hint"] = { fg = p.hintG },
  ["@comment.info"] = { fg = p.infoB },
  ["@error"] = { fg = "#ffffff", bg = p.errR },
  ["@keyword"] = { fg = p.kwM },
  ["@keyword.function"] = { fg = p.kwM },
  ["@keyword.return"] = { fg = p.kwM },
  ["@keyword.import"] = { fg = p.kwM },
  ["@keyword.repeat"] = { fg = p.kwM },
  ["@keyword.conditional"] = { fg = p.kwM },
  ["@keyword.exception"] = { fg = p.kwM },
  ["@keyword.debug"] = { fg = p.kwM },
  ["@keyword.directive"] = { fg = p.kwM },
  ["@keyword.coroutine"] = { fg = p.kwM },
  ["@keyword.operator"] = { fg = p.txtG },
  ["@keyword.storage"] = { fg = p.kwM },
  ["@keyword.type"] = { fg = p.kwM },
  ["@conditional"] = { fg = p.kwM },
  ["@repeat"] = { fg = p.kwM },
  ["@exception"] = { fg = p.kwM },
  ["@include"] = { fg = p.kwM },
  ["@debug"] = { fg = p.kwM },
  ["@define"] = { fg = p.kwM },
  ["@variable"] = { fg = p.varR },
  ["@variable.builtin"] = { fg = p.typeA },
  ["@variable.member"] = { fg = p.varR },
  ["@variable.parameter"] = { fg = p.varR, italic = true },
  ["@variable.parameter.reference"] = { fg = p.varR, italic = true },
  ["@constant"] = { fg = p.numO },
  ["@constant.builtin"] = { fg = p.numO },
  ["@constant.macro"] = { fg = p.numO },
  ["@constant.member"] = { fg = p.numO },
  ["@macro"] = { fg = p.kwM },
  ["@number"] = { fg = p.numO },
  ["@number.float"] = { fg = p.numO },
  ["@float"] = { fg = p.numO },
  ["@boolean"] = { fg = p.numO },
  ["@character"] = { fg = p.strG },
  ["@character.special"] = { fg = p.opC },
  ["@string"] = { fg = p.strG },
  ["@string.documentation"] = { fg = p.strG },
  ["@string.escape"] = { fg = p.opC },
  ["@string.regexp"] = { fg = p.opC },
  ["@string.regex"] = { fg = p.opC },
  ["@string.special"] = { fg = p.strG },
  ["@string.special.url"] = { fg = p.fnB, underline = true },
  ["@string.special.path"] = { fg = p.strG },
  ["@string.special.symbol"] = { fg = p.opC },
  ["@function"] = { fg = p.fnB },
  ["@function.call"] = { fg = p.fnB },
  ["@function.builtin"] = { fg = p.opC },
  ["@function.macro"] = { fg = p.fnB },
  ["@function.method"] = { fg = p.fnB },
  ["@function.method.call"] = { fg = p.fnB },
  ["@method"] = { fg = p.fnB },
  ["@method.call"] = { fg = p.fnB },
  ["@constructor"] = { fg = p.typeA },
  ["@type"] = { fg = p.typeA },
  ["@type.builtin"] = { fg = p.typeA },
  ["@type.definition"] = { fg = p.typeA },
  ["@type.qualifier"] = { fg = p.typeA },
  ["@storageclass"] = { fg = p.kwM },
  ["@namespace"] = { fg = p.typeA },
  ["@module"] = { fg = p.typeA },
  ["@module.builtin"] = { fg = p.typeA },
  ["@symbol"] = { fg = p.typeA },
  ["@label"] = { fg = p.fnB },
  ["@property"] = { fg = p.varR },
  ["@field"] = { fg = p.varR },
  ["@attribute"] = { fg = p.numO, italic = true },
  ["@annotation"] = { fg = p.opC },
  ["@parameter"] = { fg = p.varR, italic = true },
  ["@parameter.reference"] = { fg = p.varR, italic = true },
  ["@argument"] = { fg = p.varR, italic = true },
  ["@operator"] = { fg = p.txtG },
  ["@punctuation"] = { fg = p.neon },
  ["@punctuation.bracket"] = { fg = p.txtG },
  ["@punctuation.delimiter"] = { fg = p.neon },
  ["@punctuation.special"] = { fg = p.kwM },
  ["@tag"] = { fg = p.varR },
  ["@tag.attribute"] = { fg = p.numO },
  ["@tag.builtin"] = { fg = p.varR },
  ["@tag.delimiter"] = { fg = p.txtG },
  ["@markup.heading"] = { fg = p.varR, bold = true },
  ["@markup.heading.1"] = { fg = p.varR, bold = true },
  ["@markup.heading.2"] = { fg = p.numO, bold = true },
  ["@markup.heading.3"] = { fg = p.typeA, bold = true },
  ["@markup.heading.4"] = { fg = p.strG, bold = true },
  ["@markup.heading.5"] = { fg = p.fnB, bold = true },
  ["@markup.heading.6"] = { fg = p.kwM, bold = true },
  ["@markup.strong"] = { fg = p.numO, bold = true },
  ["@markup.italic"] = { fg = p.kwM, italic = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"] = { fg = p.kwM, underline = true },
  ["@markup.quote"] = { fg = p.cmtD, italic = true },
  ["@markup.math"] = { fg = p.opC },
  ["@markup.environment"] = { fg = p.kwM },
  ["@markup.environment.name"] = { fg = p.kwM },
  ["@markup.raw"] = { fg = p.strG },
  ["@markup.raw.block"] = { fg = p.strG },
  ["@markup.link"] = { fg = p.kwM, underline = true },
  ["@markup.link.label"] = { fg = p.fnB },
  ["@markup.link.url"] = { fg = p.kwM, underline = true },
  ["@markup.list"] = { fg = p.varR },
  ["@markup.list.checked"] = { fg = p.strG },
  ["@markup.list.unchecked"] = { fg = p.numO },
  ["@diff.plus"] = { fg = "#1aff81" },
  ["@diff.minus"] = { fg = p.varR },
  ["@diff.delta"] = { fg = p.typeA },
  ["@spell"] = {},
  ["@nospell"] = {},
  ["@conceal"] = { fg = p.cmt },
}
for group, opts in pairs(ts) do
  hl(group, opts)
end

-- ── LSP semantic tokens ──────────────────────────────────────────────
local lsp = {
  ["@lsp.type.namespace"] = { fg = p.typeA },
  ["@lsp.type.type"] = { fg = p.typeA },
  ["@lsp.type.class"] = { fg = p.typeA },
  ["@lsp.type.enum"] = { fg = p.typeA },
  ["@lsp.type.interface"] = { fg = p.typeA },
  ["@lsp.type.struct"] = { fg = p.typeA },
  ["@lsp.type.typeAlias"] = { fg = p.typeA },
  ["@lsp.type.builtinType"] = { fg = p.typeA },
  ["@lsp.type.primitiveType"] = { fg = p.typeA },
  ["@lsp.type.generic"] = { fg = p.typeA },
  ["@lsp.type.typeParameter"] = { fg = p.txtG },
  ["@lsp.type.parameter"] = { fg = p.varR, italic = true },
  ["@lsp.type.variable"] = { fg = p.varR },
  ["@lsp.type.property"] = { fg = p.varR },
  ["@lsp.type.enumMember"] = { fg = p.numO },
  ["@lsp.type.event"] = { fg = p.fnB },
  ["@lsp.type.function"] = { fg = p.fnB },
  ["@lsp.type.method"] = { fg = p.fnB },
  ["@lsp.type.macro"] = { fg = p.kwM },
  ["@lsp.type.decorator"] = { fg = p.opC },
  ["@lsp.type.keyword"] = { fg = p.kwM },
  ["@lsp.type.modifier"] = { fg = p.kwM },
  ["@lsp.type.comment"] = { fg = p.cmt, italic = true },
  ["@lsp.type.string"] = { fg = p.strG },
  ["@lsp.type.number"] = { fg = p.numO },
  ["@lsp.type.regexp"] = { fg = p.opC },
  ["@lsp.type.operator"] = { fg = p.txtG },
  ["@lsp.type.label"] = { fg = p.fnB },
  ["@lsp.type.selfKeyword"] = { fg = p.typeA },
  ["@lsp.type.boolean"] = { fg = p.numO },
  ["@lsp.mod.declaration"] = { bold = true },
  ["@lsp.mod.definition"] = { bold = true },
  ["@lsp.mod.readonly"] = { italic = true },
  ["@lsp.mod.static"] = { bold = true },
  ["@lsp.mod.deprecated"] = { strikethrough = true },
  ["@lsp.mod.abstract"] = { italic = true },
  ["@lsp.mod.async"] = { italic = true },
  ["@lsp.mod.modification"] = { underline = true },
  ["@lsp.mod.documentation"] = { fg = p.strG },
  ["@lsp.mod.defaultLibrary"] = { bold = true },
  ["@lsp.mod.local"] = {},
}
for group, opts in pairs(lsp) do
  hl(group, opts)
end
vim.lsp.semantic_tokens.enable = true

-- ── Rainbow-delimiters: rampa fire do próprio Scoria ─────────────────
hl("RainbowRed", { fg = "#ff3e3e" })
hl("RainbowOrange", { fg = "#ff6010" })
hl("RainbowYellow", { fg = "#ff9d1d" })
hl("RainbowPurple", { fg = "#ffbf1f" })
hl("RainbowTeal", { fg = "#ffd300" })

-- ── Plugins: Telescope ───────────────────────────────────────────────
hl("TelescopeNormal", { fg = p.fg, bg = p.bg0 })
hl("TelescopeBorder", { fg = p.border, bg = p.bg0 })
hl("TelescopePromptBorder", { fg = p.borderH, bg = p.bg0 })
hl("TelescopePreviewBorder", { fg = p.border, bg = p.bg0 })
hl("TelescopeResultsBorder", { fg = p.border, bg = p.bg0 })
hl("TelescopePromptTitle", { fg = p.borderH, bg = p.bg0, bold = true })
hl("TelescopePreviewTitle", { fg = p.numO, bg = p.bg0, bold = true })
hl("TelescopeResultsTitle", { fg = p.kwM, bg = p.bg0, bold = true })
hl("TelescopePromptCounter", { fg = p.cmt })
hl("TelescopePromptPrefix", { fg = p.borderH, bold = true })
hl("TelescopeSelection", { fg = "#ffffff", bg = p.sel })
hl("TelescopeSelectionCaret", { fg = p.borderH, bg = p.sel })
hl("TelescopeMatching", { fg = p.warnY, bold = true })
hl("TelescopeMultiSelection", { fg = p.strG })
hl("TelescopeMultiIcon", { fg = p.strG })
hl("TelescopePreviewLine", { bg = p.sel })
hl("TelescopePreviewMatch", { fg = p.bg0, bg = p.warnY, bold = true })
hl("TelescopeResultsMethod", { fg = p.fnB })
hl("TelescopeResultsFunction", { fg = p.fnB })
hl("TelescopeResultsVariable", { fg = p.varR })
hl("TelescopeResultsConstant", { fg = p.numO })
hl("TelescopeResultsField", { fg = p.varR })
hl("TelescopeResultsClass", { fg = p.typeA })

-- ── Plugins: NvimTree ────────────────────────────────────────────────
hl("NvimTreeNormal", { fg = "#bababa", bg = p.bg0 })
hl("NvimTreeNormalNC", { fg = "#bababa", bg = p.bg0 })
hl("NvimTreeEndOfBuffer", { fg = p.bg0, bg = p.bg0 })
hl("NvimTreeRootFolder", { fg = "#ffffff", bold = true })
hl("NvimTreeFolderIcon", { fg = "#ffffff" })
hl("NvimTreeFolderName", { fg = "#bababa" })
hl("NvimTreeOpenedFolderName", { fg = "#ffffff", bold = true })
hl("NvimTreeOpenedFile", { fg = "#ffffff", bold = true })
hl("NvimTreeIndentMarker", { fg = p.border })
hl("NvimTreeGitNew", { fg = p.gitA })
hl("NvimTreeGitStaged", { fg = p.gitA })
hl("NvimTreeGitDirty", { fg = p.warnY })
hl("NvimTreeGitDeleted", { fg = p.errR })
hl("NvimTreeGitRenamed", { fg = p.numO })
hl("NvimTreeGitMerge", { fg = p.numO })
hl("NvimTreeGitIgnored", { fg = "#8c8c8c" })
hl("NvimTreeSymlink", { fg = p.opC })
hl("NvimTreeExecFile", { fg = p.strG, bold = true })
hl("NvimTreeSpecialFile", { fg = p.numO, underline = true })
hl("NvimTreeImageFile", { fg = p.kwM })
hl("NvimTreeCursorLine", { bg = p.sel })
hl("NvimTreeWinSeparator", { fg = p.border, bg = p.bg0 })

-- ── Plugins: GitSigns ────────────────────────────────────────────────
hl("GitSignsAdd", { fg = p.gitA, bg = p.bg0 })
hl("GitSignsChange", { fg = p.warnY, bg = p.bg0 })
hl("GitSignsDelete", { fg = p.errR, bg = p.bg0 })
hl("GitSignsChangedelete", { fg = p.numO, bg = p.bg0 })
hl("GitSignsTopdelete", { fg = p.errR, bg = p.bg0 })
hl("GitSignsUntracked", { fg = p.cmt, bg = p.bg0 })
hl("GitSignsAddNr", { fg = p.gitA })
hl("GitSignsChangeNr", { fg = p.warnY })
hl("GitSignsDeleteNr", { fg = p.errR })
hl("GitSignsAddLn", { bg = p.diffA })
hl("GitSignsChangeLn", { bg = p.diffC })
hl("GitSignsDeleteLn", { bg = p.diffD })
hl("GitSignsCurrentLineBlame", { fg = "#b77979", italic = true })

-- ── Plugins: BlinkCmp / Noice / RenderMarkdown / Snacks ──────────────
hl("BlinkCmpMenu", { fg = "#d9d9d9", bg = p.bg2 })
hl("BlinkCmpMenuBorder", { fg = p.border, bg = p.bg2 })
hl("BlinkCmpMenuSelection", { fg = "#ffffff", bg = p.sel, bold = true })
hl("BlinkCmpScrollBarThumb", { bg = p.border })
hl("BlinkCmpScrollBarGutter", { bg = p.bg2 })
hl("BlinkCmpLabel", { fg = "#d9d9d9" })
hl("BlinkCmpLabelDeprecated", { fg = p.cmt, strikethrough = true })
hl("BlinkCmpLabelMatch", { fg = p.borderH, bold = true })
hl("BlinkCmpLabelDetail", { fg = p.cmt })
hl("BlinkCmpLabelDescription", { fg = p.cmt })
hl("BlinkCmpKind", { fg = p.kwM })
hl("BlinkCmpKindFunction", { fg = p.fnB })
hl("BlinkCmpKindMethod", { fg = p.fnB })
hl("BlinkCmpKindVariable", { fg = p.varR })
hl("BlinkCmpKindClass", { fg = p.typeA })
hl("BlinkCmpKindKeyword", { fg = p.kwM })
hl("BlinkCmpKindSnippet", { fg = p.strG })
hl("BlinkCmpKindFile", { fg = p.typeA })
hl("BlinkCmpSource", { fg = p.cmt })
hl("BlinkCmpGhostText", { fg = p.border })
hl("NoiceCmdlinePopup", { fg = p.fg, bg = p.bg1 })
hl("NoiceCmdlinePopupBorder", { fg = p.borderH, bg = p.bg1 })
hl("NoiceCmdlineIcon", { fg = p.borderH })
hl("NoiceConfirm", { fg = p.fg, bg = p.bg1 })
hl("NoiceConfirmBorder", { fg = p.borderH, bg = p.bg1 })
hl("RenderMarkdownH1", { fg = p.varR, bold = true })
hl("RenderMarkdownH2", { fg = p.numO, bold = true })
hl("RenderMarkdownH3", { fg = p.typeA, bold = true })
hl("RenderMarkdownH4", { fg = p.strG, bold = true })
hl("RenderMarkdownH5", { fg = p.fnB, bold = true })
hl("RenderMarkdownH6", { fg = p.kwM, bold = true })
hl("RenderMarkdownCode", { bg = p.bg1 })
hl("RenderMarkdownCodeInline", { fg = p.strG, bg = p.bg1 })
hl("RenderMarkdownBullet", { fg = p.varR })
hl("RenderMarkdownCheckboxUnchecked", { fg = p.numO })
hl("RenderMarkdownCheckboxChecked", { fg = p.strG })
hl("RenderMarkdownQuote", { fg = p.numO })
hl("RenderMarkdownTableHead", { fg = p.varR, bold = true })
hl("RenderMarkdownTableRow", { fg = p.fg })
hl("RenderMarkdownLink", { fg = p.kwM, underline = true })
hl("RenderMarkdownSuccess", { fg = p.strG })
hl("RenderMarkdownWarn", { fg = p.warnY })
hl("RenderMarkdownError", { fg = p.errR })
hl("SnacksPicker", { fg = p.fg, bg = p.bg0 })
hl("SnacksPickerBorder", { fg = p.border, bg = p.bg0 })
hl("SnacksPickerPrompt", { fg = p.fg, bg = p.bg0 })
hl("SnacksPickerTitle", { fg = p.borderH, bold = true })
hl("SnacksPickerMatch", { fg = p.warnY, bold = true })
hl("SnacksPickerSelected", { fg = "#ffffff", bg = p.sel })
hl("SnacksPickerDir", { fg = p.typeA })
hl("SnacksPickerFile", { fg = p.fg })
hl("SnacksPickerTotals", { fg = p.cmt })
hl("SnacksDashboardHeader", { fg = p.borderH })
hl("SnacksDashboardDesc", { fg = p.fg })
hl("SnacksDashboardIcon", { fg = p.numO })
hl("SnacksDashboardKey", { fg = p.warnY, bold = true })
hl("SnacksDashboardDir", { fg = p.cmt })
hl("SnacksDashboardFooter", { fg = p.cmt })
hl("SnacksIndent", { fg = "#242424" })
hl("SnacksIndentScope", { fg = p.borderH })
hl("SnacksNotifierInfo", { fg = p.infoB, bg = p.bg1 })
hl("SnacksNotifierWarn", { fg = p.warnY, bg = p.bg1 })
hl("SnacksNotifierError", { fg = p.errR, bg = p.bg1 })
hl("SnacksNotifierDebug", { fg = p.cmt, bg = p.bg1 })
hl("SnacksNotifierTrace", { fg = p.cmt, bg = p.bg1 })

-- ── Terminal ANSI (cores do próprio Scoria, turbinadas) ──────────────
vim.g.terminal_color_0 = "#2c2c2c"
vim.g.terminal_color_1 = "#f40a0a"
vim.g.terminal_color_2 = "#00c97c"
vim.g.terminal_color_3 = "#f5f500"
vim.g.terminal_color_4 = "#0070ec"
vim.g.terminal_color_5 = "#dc1fdc"
vim.g.terminal_color_6 = "#00b2de"
vim.g.terminal_color_7 = "#e5e5e5"
vim.g.terminal_color_8 = "#555555"
vim.g.terminal_color_9 = "#ff3e3e"
vim.g.terminal_color_10 = "#00f492"
vim.g.terminal_color_11 = "#ffff39"
vim.g.terminal_color_12 = "#268dff"
vim.g.terminal_color_13 = "#f056f0"
vim.g.terminal_color_14 = "#05ceff"
vim.g.terminal_color_15 = "#ffffff"
