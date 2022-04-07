use {
    'vimwiki/vimwiki',
    config = function()
        vim.g.vimwiki_list = {
            {
                path = '/home/weakphish/Developer/Notes',
                syntax = 'markdown',
                ext = '.md',
            }
        }
    end
}
