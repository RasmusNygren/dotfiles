return {
    parse({trig = "ife", name = "if err", dscr = "insert if err != nil statement" }, [[
    if err != nil {
        return err
    }
    ]]),
    s({ trig = "ifew", name = "If err wrapped", dscr = "insert if err != nil, wrap error in return" }, {
        t("if err != nil {"),
        t({ "", "  return fmt.Errorf(\""}),
        i(1, "msg"),
        t(": %w\", err)"),
        t({ "", "}" })
    }),
}
