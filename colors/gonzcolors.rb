vim_colors "gonzcolors" do
	author "Rickard Andersson"
	notes "gonz' color scheme"

	reset true
	background :dark

	Normal "bbb", "0a0a0a" 
	Comment "777"
	Statement "bb6acb"
  PreProc "c44"
	Delimiter "825"
	Type "393"
	Constant "4b4"
	Identifier "88c"
	LineNr "a00"
  DiffDelete "0a0a0a", "c00"
  DiffAdd "0a0a0a", "0c0"
  DiffChange "0a0a0a", "c0c"
  DiffText "000", "fff"
  ColorColumn "999", "222"
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
  link :elixirBlock, :to => :elixirKeyword
  link :elixirBlockDefinition, :to => :elixirKeyword
  link :elixirDefine, :to => :elixirKeyword
  link :elixirTupleDelimiter, :to => :Delimiter
  link :elixirMapDelimiter, :to => :Delimiter

  # OCaml #
  ocamlConstructor "47f"
end
