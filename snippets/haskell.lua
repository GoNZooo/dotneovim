return {
  parse("xth", "{-# LANGUAGE TemplateHaskell #-}"),
  parse("xsd", "{-# LANGUAGE StrictData #-}"),
  parse("xqq", "{-# LANGUAGE QuasiQuotes #-}"),
  parse("module", "module ${1:Module} where"),
  parse("iq", "import qualified ${1:RIO.Map} as ${2:Map}"),
}
