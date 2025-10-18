# Neovim Configuration Guide

## Project Structure
This is a Neovim configuration based on Kickstart.nvim.

## Key Files and Directories
- `init.lua` - Main configuration entry point
- `lua/custom/` - Custom configuration modules
- `lua/custom/opts.lua` - Custom options and settings
- `lua/custom/autocmds.lua` - Custom autocommands (ALWAYS add new autocommands here)
- `lua/custom/plugins/` - Custom plugin configurations
- `lazy-lock.json` - Plugin version lock file (managed by lazy.nvim)

## IMPORTANT: Researching Plugin Information

When working with Neovim plugins, ALWAYS research thoroughly before making changes:

### Before Adding/Modifying a Plugin
1. **Check existing configuration**: Search for any existing plugin configurations in `lua/` directory
2. **Research the plugin documentation**:
   - Look up the plugin's GitHub repository for README and docs
   - Check for breaking changes in recent versions
   - Review the plugin's configuration options and API
3. **Verify dependencies**: Check what other plugins or external tools are required
4. **Check compatibility**: Ensure the plugin works with the current Neovim version

### Research Commands to Use
- Search for existing plugin usage: `grep -r "plugin-name" .`
- Check lazy-lock.json for current plugin versions
- Look for plugin configuration patterns in lua/custom/plugins/
- Review init.lua for how plugins are loaded

### Plugin Configuration Best Practices
- ALWAYS check the plugin's official documentation for:
  - Correct plugin repository path (e.g., 'nvim-telescope/telescope.nvim' not just 'telescope')
  - Required dependencies
  - Configuration function signature (setup() vs config() vs init())
  - Available options and their types
  - Lazy loading recommendations

### Common Plugin Patterns in This Config
- Plugins are managed with lazy.nvim
- Plugin specs typically go in `lua/custom/plugins/` as separate files
- Each plugin file returns a table or array of tables
- Use `opts` for simple configurations, `config` for complex setup

## Common Commands

### Testing Configuration
```bash
# Test the config without affecting your current session
nvim --clean -u init.lua

# Check for errors
nvim +checkhealth
```

### Plugin Management
Neovim uses lazy.nvim for plugin management:
- `:Lazy` - Open plugin manager UI
- `:Lazy sync` - Update all plugins
- `:Lazy install` - Install missing plugins
- `:Lazy update` - Update plugins
- `:Lazy clean` - Remove unused plugins
- `:Lazy log` - View plugin update log
- `:Lazy profile` - Profile plugin load times

### LSP and Treesitter
- `:Mason` - Open Mason UI for LSP/DAP/linter/formatter management
- `:MasonInstall <tool>` - Install a specific tool
- `:TSInstall <language>` - Install Treesitter parser for a language
- `:TSUpdate` - Update Treesitter parsers
- `:LspInfo` - Show LSP client information
- `:LspLog` - View LSP log

## Development Workflow

### Adding a New Plugin
1. **Research first**: Look up the plugin's documentation and examples
2. Create a new file in `lua/custom/plugins/plugin-name.lua`
3. Use the correct plugin specification format:
```lua
return {
  'author/plugin-name',  -- Exact GitHub path
  event = 'VeryLazy',    -- Or other lazy loading event
  dependencies = {
    -- List all required dependencies
  },
  opts = {
    -- Configuration options
  },
  -- OR use config for complex setup
  config = function()
    require('plugin-name').setup({
      -- options
    })
  end,
}
```
4. Restart Neovim or run `:Lazy sync`
5. Check `:Lazy` UI to verify installation

### Modifying Options
Edit `lua/custom/opts.lua` for custom Vim options and settings.

### Adding Autocommands
ALWAYS add new autocommands to `lua/custom/autocmds.lua`. This file is automatically loaded by init.lua and keeps all custom autocommands organized in one place. Examples:
- LSP refresh on new files
- FileType-specific settings
- Custom buffer/window behavior

### Debugging
- Check `:messages` for error messages
- Use `:lua print(vim.inspect(...))` for debugging Lua values
- Review `:checkhealth` output for configuration issues
- Check `:Lazy profile` for slow plugins
- Use `:lua =expression` for quick evaluation

## Git Information
- Main branch: `master`
- Current branch: `master`

## Testing Changes
After making changes:
1. Save the file
2. Either restart Neovim or source the file with `:source %`
3. For plugin changes, run `:Lazy sync`
4. Run `:checkhealth` to verify no errors
5. Test the new functionality

## Common Patterns

### Plugin Configuration with Lazy.nvim
```lua
return {
  -- Simple plugin
  'plugin/name',

  -- Plugin with options
  {
    'plugin/name',
    opts = {
      option1 = value1,
    },
  },

  -- Plugin with dependencies and config
  {
    'plugin/name',
    dependencies = {
      'dependency1',
      'dependency2',
    },
    event = 'BufRead',  -- Lazy load on event
    config = function()
      require('plugin').setup({
        -- configuration
      })
    end,
  },

  -- Plugin with keys (lazy load on keymap)
  {
    'plugin/name',
    keys = {
      { '<leader>p', '<cmd>PluginCommand<cr>', desc = 'Plugin Command' },
    },
  },
}
```

### Keymapping
```lua
-- Basic keymap
vim.keymap.set('n', '<leader>key', '<cmd>Command<cr>', { desc = 'Description' })

-- Function keymap
vim.keymap.set('n', '<leader>key', function()
  -- action
end, { desc = 'Description' })

-- Which-key style (if which-key is installed)
-- Check for which-key plugin before using its API
```

## Research Checklist for Plugin Work
When asked to work with a plugin:
- [ ] Search existing config for the plugin
- [ ] Check lazy-lock.json for current version
- [ ] Look up plugin's GitHub repository
- [ ] Read plugin's README and documentation
- [ ] Check plugin's setup/config requirements
- [ ] Verify all dependencies are available
- [ ] Look for example configurations
- [ ] Check for any breaking changes in recent versions
- [ ] Test changes incrementally with :Lazy reload or restart

## External Resources to Check
- Plugin's GitHub repository (always check the README)
- Neovim documentation (:help)
- Lazy.nvim documentation for plugin spec format
- Kickstart.nvim repository for patterns and examples