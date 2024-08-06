return {
  -- this is meant to make Neovim act like IntelliJ. JDTLS is installed in lsp-config.lua
  -- This is the configuration for JDTLS neovim plugin that makes things easier to work with
  {
    "mfussenegger/nvim-jdtls",
    config = function()
      -- If you started neovim within  '~/dev/xy/project-1' this would resolve to 'project-1'
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
      local workspace_dir = os.getenv('HOME') .. '/.nvim_workspaces/' .. project_name

      -- make the directory if it doesn't exist already
      vim.fn.mkdir(workspace_dir, 'p')

      -- santity check
      print('starting jdtls with workspaces files located: ' .. workspace_dir)

      -- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
      local config = {
        -- The command that starts the language server
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {

          -- 💀
          'java', -- or '/path/to/java17_or_newer/bin/java'
          -- depends on if `java` is in your $PATH env variable and if it points to the right version.

          '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          '-Dosgi.bundles.defaultStartLevel=4',
          '-Declipse.product=org.eclipse.jdt.ls.core.product',
          '-Dlog.protocol=true',
          '-Dlog.level=ALL',
          '-Xmx1g',
          '--add-modules=ALL-SYSTEM',
          '--add-opens', 'java.base/java.util=ALL-UNNAMED',
          '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

          -- 💀
          '-jar', '$HOME/.local/share/nvim/mason/bin/jdtls/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
          -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
          -- Must point to the                                                     Change this to
          -- eclipse.jdt.ls installation                                           the actual version


          -- 💀
          '-configuration', '$HOME/.local/share/nvim/mason/bin/jdtls/config_mac',
          -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
          -- Must point to the                      Change to one of `linux`, `win` or `mac`
          -- eclipse.jdt.ls installation            Depending on your system.


          -- 💀
          -- See `data directory configuration` section in the README
          '-data', workspace_dir,
        },

        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options.
        settings = {
          java = {
          }
        },

        -- Language server `initializationOptions`
        -- You need to extend the `bundles` with paths to jar files
        -- if you want to use additional eclipse.jdt.ls plugins.
        --
        -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
        init_options = {
          bundles = {}
        },
      }
      -- This starts a new client & server,
      -- or attaches to an existing client & server depending on the `root_dir`.
      require('jdtls').start_or_attach(config)
    end
  }
}
