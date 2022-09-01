return {
  parse("xth", "{-# LANGUAGE TemplateHaskell #-}"),
  parse("xsd", "{-# LANGUAGE StrictData #-}"),
  parse("xqq", "{-# LANGUAGE QuasiQuotes #-}"),
  parse("module", "module ${1:Module} where"),
  parse("iq", "import qualified ${1:RIO.Map} as ${2:Map}"),
  s("dl", fmt([[{} {}]], {
    c(1, { t "traceM", t "traceShowM" }),
    d(2, function(trace_choice)
      local text = trace_choice[1][1]
      if text == "traceM" then
        return sn(nil, fmt([[(mconcat ["{}: ", tshow {}])]], { rep(1), i(1) }))
      else
        return sn(nil, fmt([[{}]], { i(1) }))
      end
    end,
      { 1 }),
  })),
  s("mc", fmt("mconcat [{}]", { i(1) })),
}
