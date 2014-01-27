" Detect Twig filetype
autocmd BufNewFile,BufRead *.twig set expandtab shiftwidth=4 tabstop=4 softtabstop=4 foldmethod=marker foldmarker=block,endblock foldlevel=0
autocmd BufNewFile,BufRead *.twig UltiSnipsAddFiletypes jinja2.html<CR>

autocmd BufNewFile,BufRead *.html.twig set filetype=htmljinja
autocmd BufNewFile,BufRead *.xml.twig set filetype=xml.jinja2
autocmd BufNewFile,BufRead *.txt.twig set filetype=text.jinja2
