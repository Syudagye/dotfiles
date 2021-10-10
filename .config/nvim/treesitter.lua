require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "cpp",
    "css",
    "dockerfile",
    "glsl",
    "go",
    "haskell",
    "html",
    "java",
    "javascript",
    "json",
    "kotlin",
    "latex",
    "lua",
    "python",
    "regex",
    "rust",
    "scss",
    "svelte",
    "toml",
    "typescript",
    "vim",
    "yaml",
}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    additional_vim_regex_highlighting = false,
    enable = true
  },
  indent = {
    enable = true
  }
}
