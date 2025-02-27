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
    Conceal = { fg = 4, underline = true },
    NonText = { fg = 8 },
    SpecialKey = "NonText",
    Whitespace = "NonText",
    Visual = { bg = 8 },
    Search = "Visual",
    CurSearch = "Search",
    IncSearch = "Search",
    Substitute = "Search",
    MatchParen = { underline = true },
    MsgArea = "Normal",
    MoreMsg = { fg = 4 },
    ModeMsg = { fg = 4 },
    WarningMsg = { fg = 11, bold = true },
    ErrorMsg = { fg = 9, bold = true },
    Question = { fg = 13 },
    Title = { fg = 13 },
    Cursor = { link = "Normal", reverse = true },
    ColorColumn = { bg = 8 },
    CursorColumn = { bg = 8 },
    CursorLine = { bg = 8 },
    QuickFixLine = "CursorLine",
    WinSeparator = { fg = 8, bg = 8 },
    StatusLine = { fg = 15, bg = 8 },
    StatusLineNC = { fg = 12, bg = 8 },
    TabLine = "StatusLineNC",
    TabLineSel = "StatusLine",
    TabLineFill = "StatusLine",
    FloatBorder = { fg = 7, bg = 0, bold = true },
    FloatTitle = "FloatBorder",
    DiffAdd = { fg = 10, bg = 8, bold = true },
    DiffDelete = { fg = 9, bg = 8, bold = true },
    DiffChange = { bg = 8 },
    DiffText = { fg = 11, bg = 8, bold = true },
    FoldColumn = { fg = 4, bg = 8 },
    Folded = "FoldColumn",
    CursorLineFold = "FoldColumn",
    SignColumn = { fg = 4, bg = 8 },
    CursorLineSign = "SignColumn",
    LineNr = { fg = 4, bg = 8 },
    LineNrAbove = "LineNr",
    LineNrBelow = "LineNr",
    CursorLineNr = "LineNr",
    Pmenu = { fg = 0, bg = 5, bold = true },
    PmenuSel = { fg = 0, bg = 13, bold = true },
    PmenuKind = { fg = 0, bg = 13, bold = true },
    PmenuKindSel = { fg = 0, bg = 13, bold = true },
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
    Directory = { fg = 6 },
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
