vim_colors "gonz-aurora" do
  author "Rickard Andersson"
  notes "gonz' color scheme"

  reset true
  background :dark

  Normal "ececec", "23212e" 
  Comment "46f2f2"
  Statement "e12977"
  Include "c5e400"
  PreProc "c44"
  Delimiter "f967e7"
  Type "47f"
  Constant "5f9cff"
  String "ffb700"
  Function "c5e400"
  Identifier "88c"
  LineNr "444"
  DiffDelete "0a0a0a", "c00"
  DiffAdd "0a0a0a", "0c0"
  DiffChange "0a0a0a", "c0c"
  DiffText "000", "fff"
  ColorColumn "ececec", "33313e"
  CursorLine "ccc", "222"
  MatchParen "000", "c3c"
  Search "fff", "00a"
  Visual "000", "7b26cb"
  Folded "3a3", "555"
  FoldColumn "0a0", "333"
  Whitespace "404040"
  NonText "33313e"

  Todo "cc4" # NeomakeWarning is linked to this.

  # autocomplete menu
  Pmenu "fff", "444"
  PmenuSel "444", "fff"
  
  # ALE
  link :ALEWarning, :to => :Underlined
  link :ALEError, :to => :Underlined
  
  # Language specific
  
  ##########
  # Elixir #
  ##########
  link :elixirKeyword, :to => :Statement
  link :elixirInclude, :to => :elixirKeyword
  link :elixirModuleDefine, :to => :elixirKeyword
  link :elixirPrivateDefine, :to => :elixirKeyword
  link :elixirStructDefine, :to => :elixirKeyword
  link :elixirBlock, :to => :elixirKeyword
  link :elixirBlockDefinition, :to => :elixirKeyword
  link :elixirDefine, :to => :elixirKeyword
  link :elixirTupleDelimiter, :to => :Delimiter
  link :elixirMapDelimiter, :to => :Delimiter
  
  # OCaml #
  link :ocamlConstructor, :to => :Type
end
