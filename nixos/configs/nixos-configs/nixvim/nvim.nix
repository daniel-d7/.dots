{ pkgs, ... }:

{
  imports = [
    ./keymaps.nix
    ./nvim-cmp.nix
    ./lsp.nix
    ./bufferline.nix
    ./telescope.nix
    ./neo-tree.nix
    ./prettier.nix
    ./lsp-servers.nix
    ./treesitter.nix
    ./autopairs.nix
    ./whichkey.nix
    ./dashboard.nix
    ./efmls.nix
    ./lsp-format.nix
    ./conform.nix
  ];
  programs = {
    nixvim = {
      enable = true;
      globals.mapleader = " ";
      clipboard.providers.wl-copy.enable = true;

      options = {
        number = true;
        relativenumber = false;
        shiftwidth = 2;
      };
      plugins = {
        nix.enable = true;

        lsp-lines.enable = true;
        lspkind.enable = true;

        neogit.enable = true;
        cmp-zsh.enable = true;
        noice.enable = true;
        nvim-colorizer.enable = true;
        luasnip.enable = true;
        rust-tools.enable = true;

        notify = {
          enable = true;
          #backgroundColour = "#000000";
          timeout = 2000;
          fps = 120;
          stages = "fade";
        };

        airline = {
          enable = true;
          #powerline = true;
          settings = {
            theme = "catppuccin";
          };
        };
      };

      #autoCmd = [
      #  {
      #    event = [ "BufWrite" ];
      #    pattern = [ "" ];
      #    command = "lua require('conform').format({ lsp_fallback = true, async = false, timeout_ms = 500 })<CR>";
      #  }
      #];

      extraPlugins = with pkgs.vimPlugins; [
        telescope-ui-select-nvim
        #vim-autoformat
        vim-jsbeautify

      ];

      extraConfigLua =
        ''if vim.g.neovide then'' + "\n" +
        ''vim.o.guifont = "Hurmit Nerd Font:h14"'' + "\n" +

        ''vim.keymap.set('n', '<C-S-s>', ':w<CR>') -- Save'' + "\n" +
        ''vim.keymap.set('v', '<C-S-c>', '"+y') -- Copy'' + "\n" +
        ''vim.keymap.set('n', '<C-S-v>', '"+P') -- Paste normal mode'' + "\n" +
        ''vim.keymap.set('v', '<C-S-v>', '"+P') -- Paste visual mode'' + "\n" +
        ''vim.keymap.set('c', '<C-S-v>', '<C-R>+') -- Paste command mode'' + "\n" +
        ''vim.keymap.set('i', '<C-S-v>', '<ESC>l"+Pli') -- Paste insert mode'' + "\n" +
        "end";


      #colorschemes.kanagawa = {
      #  enable = true;
      #  terminalColors = true;
      #};

      #colorschemes.ayu = {
      #  enable = true;
      #  mirage = true;
      #};

      colorschemes.catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          transparentBackground = false;
        };
      };

    };
  };
}