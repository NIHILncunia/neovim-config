return {
  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    opts = {
      pre_hook = function()
        local ok, integration = pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
        if ok then
          return integration.create_pre_hook()()
        end
      end,
    }
  }
}
