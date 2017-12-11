vim_colors "gonzcolors" do
	author "Rickard Andersson"
	notes "gonz' color scheme"

	reset true
	background :dark

	Normal "999", "111" 
	Comment "555"
	Statement "88c"
  PreProc "c4a"
	Delimiter "825"
	Type "393"
	Constant "4b4"
	Identifier "88c"
	LineNr "a00"
  DiffDelete "0a0a0a", "c00"
  DiffAdd "0a0a0a", "0c0"
  DiffChange "0a0a0a", "c0c"
  DiffText "000", "fff"
  ColorColumn "222", "222"
  CursorLine "ccc", "222"

  elixirId "948", "111"

  link :elixirTupleDelimiter, :to => :Delimiter
  link :elixirMapDelimiter, :to => :Delimiter
end
