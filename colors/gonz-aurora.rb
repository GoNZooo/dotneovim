vim_colors "gonzcolors" do
	author "Rickard Andersson"
	notes "gonz' color scheme"

	reset true
	background :dark

	Normal "ececec", "23212e" 
	Comment "777"
	Statement "e12977"
  Include "c5e400"
  PreProc "c44"
	Delimiter "825"
	Type "47f"
  Constant "5f9cff"
	String "ffb700"
  Function "c5e400"
	Identifier "88c"
	LineNr "a00"
  DiffDelete "0a0a0a", "c00"
  DiffAdd "0a0a0a", "0c0"
  DiffChange "0a0a0a", "c0c"
  DiffText "000", "fff"
  ColorColumn "000", "111"
  CursorLine "ccc", "222"
  MatchParen "000", "c3c"
  Search "fff", "00a"

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
  link :elixirBlock, :to => :elixirKeyword
  link :elixirBlockDefinition, :to => :elixirKeyword
  link :elixirDefine, :to => :elixirKeyword
  link :elixirTupleDelimiter, :to => :Delimiter
  link :elixirMapDelimiter, :to => :Delimiter

  # OCaml #
  link :ocamlConstructor, :to => :Type
end
