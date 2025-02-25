return {
  "mfussenegger/nvim-lint",
  opts = {
    linters = {
      sqlfluff = {
        args = {
          "lint",
          "--format=json",
        },
        ignore_exitcode = true,
        stdin = false,
      },
    },
  },
}
