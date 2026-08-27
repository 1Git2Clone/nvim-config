local function get_flake_root()
  local cwd = vim.fn.getcwd()
  local root = vim.fn.findfile("flake.nix", cwd .. ";")
  -- vim.fn.findfile returns a string (or empty), but LSP may think it's string[].
  -- Force string and guard against empty.
  if type(root) == "string" and root ~= "" then
    return vim.fn.fnamemodify(root, ":h")
  end
  return cwd
end

local function get_nixos_expr()
  local flake_dir = get_flake_root()
  return string.format('(builtins.getFlake "%s").nixosConfigurations.my-server.options', flake_dir)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = {
          cmd = { "nixd" },
          settings = {
            nixd = {
              nixpkgs = {
                expr = "import <nixpkgs> { }",
              },
              options = {
                nixos = {
                  expr = get_nixos_expr(),
                },
              },
            },
          },
        },
      },
    },
  },
}
