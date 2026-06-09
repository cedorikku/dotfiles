return {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      analysis = {
        diagnosticSecurityOverrides = {
          reportUnusedImport = 'none',
          reportUnusedVariable = 'none',
          reportUnusedFunction = 'none',
          reportUnusedExpression = 'none',
          reportUndefinedVariable = 'none',
        },
      },
    },
  },
}
