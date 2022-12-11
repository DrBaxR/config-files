require('bufferline').setup {
    options = {
        mode = "buffers",
        indicator = {
            style = 'none'
        },
        modified_icon = 'C',
        buffer_close_icon = '',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "left",
                separator = false,
            }
        },
        color_icons = false,
        show_buffer_icons = false,
    }
}
