local M = {}

local DEFAULT_OPTS = {
  colors = {
    "Black",
    "DarkRed",
    "DarkGreen",
    "DarkYellow",
    "DarkBlue",
    "DarkMagenta",
    "DarkCyan",
    "LightGray",
    "DarkGray",
    "Red",
    "Green",
    "Yellow",
    "Blue",
    "Magenta",
    "Cyan",
    "White",
  },
  highlights = {
    Normal = { fg = 7, bg = 0 },
    NormalNC = "Normal",
    NormalFloat = "Normal",
    Conceal = { fg = 4 },
    NonText = { fg = 8 },
    EndOfBuffer = "NonText",
    SpecialKey = "NonText",
    Whitespace = "NonText",
    Visual = { bg = 8 },
    SnippetTabstop = "Visual",
    Search = { fg = 0, bg = 4, bold = true },
    IncSearch = { fg = 0, bg = 6, bold = true },
    CurSearch = "IncSearch",
    Substitute = { fg = 0, bg = 1, bold = true },
    MatchParen = { underline = true },
    MsgArea = "Normal",
    MoreMsg = { fg = 4 },
    ModeMsg = { fg = 4 },
    WarningMsg = { fg = 3, bold = true },
    ErrorMsg = { fg = 1, bold = true },
    Question = { fg = 14 },
    Title = { fg = 13 },
    Cursor = { fg = 0, bg = 15 },
    lCursor = "Cursor",
    CursorIM = "Cursor",
    TermCursor = { reverse = true },
    TermCursorNC = "TermCursor",
    CursorLine = { bg = 8 },
    CursorColumn = "CursorLine",
    ColorColumn = "CursorLine",
    QuickFixLine = "CursorLine",
    StatusLine = { fg = 15, bg = 8 },
    StatusLineNC = { fg = 12, bg = 8 },
    TabLine = "StatusLineNC",
    TabLineSel = { fg = 15, bg = 8, bold = true },
    TabLineFill = "StatusLine",
    WinBar = "StatusLine",
    WinBarNC = "StatusLineNC",
    WinSeparator = "StatusLine",
    FloatBorder = "Normal",
    FloatTitle = { fg = 7, bg = 0, bold = true },
    FloatFooter = "FloatTitle",
    DiffAdd = { fg = 0, bg = 2, bold = true },
    DiffDelete = { fg = 0, bg = 1, bold = true },
    DiffChange = { fg = 0, bg = 4 },
    DiffText = { fg = 0, bg = 6, bold = true },
    SignColumn = { bg = 8 },
    CursorLineSign = "SignColumn",
    FoldColumn = { fg = 12, bg = 8 },
    CursorLineFold = "FoldColumn",
    Folded = { fg = 12, bg = 8 },
    LineNr = { fg = 12, bg = 8 },
    LineNrAbove = "LineNr",
    LineNrBelow = "LineNr",
    CursorLineNr = { fg = 15, bg = 8, bold = true },
    Pmenu = { fg = 15, bg = 8 },
    PmenuSel = { fg = 8, bg = 15, bold = true },
    PmenuKind = "Pmenu",
    PmenuKindSel = "PmenuSel",
    PmenuExtra = "Pmenu",
    PmenuExtraSel = "PmenuSel",
    PmenuSbar = "Pmenu",
    PmenuThumb = "PmenuSel",
    SpellBad = { fg = 9, bold = true, undercurl = true },
    SpellCap = { fg = 12, bold = true, undercurl = true },
    SpellLocal = { fg = 14, bold = true, undercurl = true },
    SpellRare = { fg = 13, bold = true, undercurl = true },
    Comment = { fg = 4 },
    Constant = { fg = 3 },
    String = "Constant",
    Character = "Constant",
    Number = "Constant",
    Boolean = "Constant",
    Float = "Constant",
    Identifier = { fg = 6 },
    Function = "Identifier",
    Statement = { fg = 5 },
    Conditional = "Statement",
    Repeat = "Statement",
    Label = "Statement",
    Operator = "Statement",
    Keyword = "Statement",
    Exception = "Statement",
    Underlined = { fg = 6, underline = true },
    Ignore = { fg = 0 },
    Error = { fg = 0, bg = 1, bold = true },
    Todo = { fg = 0, bg = 3, bold = true },
    PreProc = { fg = 4 },
    Include = "PreProc",
    Define = "PreProc",
    Macro = "PreProc",
    PreCondit = "PreProc",
    Type = { fg = 2 },
    StorageClass = "Type",
    Structure = "Type",
    Typedef = "Type",
    Special = { fg = 2, bold = true },
    SpecialChar = "Special",
    Tag = "Special",
    Delimiter = "Special",
    SpecialComment = "Special",
    Debug = "Special",
  },
}

local user_opts = {}

M.setup = function(opts)
  if type(opts) == "table" then
    user_opts = opts
  end
end

M.load = function()
  vim.cmd([[hi clear]])
  vim.g.colors_name = "color16"

  user_opts = user_opts or {}

  local colors = user_opts.colors or DEFAULT_OPTS.colors
  local highlights = vim.tbl_extend("force", DEFAULT_OPTS.highlights, user_opts.highlights or {})

  vim.g.terminal_color_0 = colors[1]
  vim.g.terminal_color_1 = colors[2]
  vim.g.terminal_color_2 = colors[3]
  vim.g.terminal_color_3 = colors[4]
  vim.g.terminal_color_4 = colors[5]
  vim.g.terminal_color_5 = colors[6]
  vim.g.terminal_color_6 = colors[7]
  vim.g.terminal_color_7 = colors[8]
  vim.g.terminal_color_8 = colors[9]
  vim.g.terminal_color_9 = colors[10]
  vim.g.terminal_color_10 = colors[11]
  vim.g.terminal_color_11 = colors[12]
  vim.g.terminal_color_12 = colors[13]
  vim.g.terminal_color_13 = colors[14]
  vim.g.terminal_color_14 = colors[15]
  vim.g.terminal_color_15 = colors[16]
  vim.g.terminal_color_background = colors[1]
  vim.g.terminal_color_foreground = colors[8]

  for group, config in pairs(highlights) do
    if type(config) == "string" then
      config = { link = config }
    end
    if type(config) == "table" then
      if type(config.fg) == "number" then
        config.ctermfg = config.fg
        config.fg = colors[config.ctermfg + 1]
      end
      if type(config.bg) == "number" then
        config.ctermbg = config.bg
        config.bg = colors[config.ctermbg + 1]
      end
      vim.api.nvim_set_hl(0, group, config)
    end
  end
end

return M
