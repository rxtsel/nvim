return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "thenbe/neotest-playwright",
    },
    opts = {
      adapters = {
        ["neotest-vitest"] = {},
        ["neotest-jest"] = {},
        ["neotest-playwright"] = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        },
      },
    },
  },
}
