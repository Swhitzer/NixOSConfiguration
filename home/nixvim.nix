{ pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;

      shiftwidth = 2;
    };

    plugins = {	
      lsp = {
	enable = true;
	servers = {
	  ts_ls.enable = true;
	  lua_ls.enable = true;
	  nil_ls.enable = true;
	};
      };

      cmp = {
	enable = true;
	autoEnableSources = true;
	settings.sources = [
	{name = "nvim_lsp";}
	{name = "path";}
	{name = "buffer";}
	];
#mapping = {
#  "<CR>" = "cmp.mapping.confirm({ select = true })";
#  "<Tab>" = {
#    action = ''
#      function(fallback)
#        if cmp.visible() then
#          cmp.select_next_item()
#        elseif luasnip.expandable() then
#          luasnip.expand()
#        elseif luasnip.expand_or_jumpable() then
#          luasnip.expand_or_jump()
#        elseif check_backspace() then
#          fallback()
#        else
#          fallback()
#        end
#      end
#    '';
#    modes = [ "i" "s" ];
#  };
#};
      };

      lualine = {
	enable = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = pywal-nvim;
      config = ''lua require('pywal').setup()'';
    }
    ];
  };
}
