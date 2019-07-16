echo 'filetype python'

call plug#begin('~/.vim/plugged')

    " syntax check
    " Plug 'scrooloose/syntastic'
    " https://kashewnuts.github.io/2018/12/02/bp_advent_calender.html#w0rp-ale-linter-fixer
    Plug 'w0rp/ale'

    " Python補完
    " https://kashewnuts.github.io/2019/01/28/move_from_jedivim_to_vimlsp.html
    Plug 'prabirshrestha/vim-lsp'
    Plug 'prabirshrestha/async.vim'

    """"""""""""""""""""""""""""""
    " scrooloose/syntasticの設定
    """"""""""""""""""""""""""""""
    " " Flake8を使う
    " let g:syntastic_python_checkers = ["flake8"]
    " " 一行120文字まで
    " let g:syntastic_python_flake8_args="--max-line-length=120"

    """"""""""""""""""""""""""""""
    " w0rp/aleの設定
    """"""""""""""""""""""""""""""
    " ファイル保存時にLinterを実行する
    let g:ale_lint_on_save = 1
    " テキスト変更時にはLinterを実行しない
    let g:ale_lint_on_text_changed = 'never'
    " Linter(コードチェックツール)の設定
    let g:ale_linters = {
    \   'python': ['flake8'],
    \}
    " ファイル保存時にはFixerを実行しない
    let g:ale_fix_on_save = 0
    " テキスト変更時にはFixerを実行しない
    let g:ale_fix_on_text_changed = 'never'
    " Fixer(コード整形ツール)の設定
    let b:ale_fixers = {
    \   'python': ['autopep8', 'isort'],
    \}
    " 余分な空白があるときは警告表示
    let b:ale_warn_about_trailing_whitespace = 0
    " ALE実行時にでる目印行を常に表示
    let g:ale_sign_column_always = 1

    """"""""""""""""""""""""""""""
    " prabirshrestha/vim-lspの設定
    """"""""""""""""""""""""""""""
	" デバッグ用設定
	let g:lsp_log_verbose = 1  " デバッグ用ログを出力
	let g:lsp_log_file = expand('~/.cache/tmp/vim-lsp.log')  " ログ出力のPATHを設定
	" 言語用Serverの設定
	augroup MyLsp
	  autocmd!
	  " pip install python-language-server
	  if executable('pyls')
		" Python用の設定を記載
		" workspace_configで以下の設定を記載
		" - pycodestyleの設定はALEと重複するので無効にする
		" - jediの定義ジャンプで一部無効になっている設定を有効化
		autocmd User lsp_setup call lsp#register_server({
			\ 'name': 'pyls',
			\ 'cmd': { server_info -> ['pyls'] },
			\ 'whitelist': ['python'],
			\ 'workspace_config': {'pyls': {'plugins': {
			\   'pycodestyle': {'enabled': v:false},
			\   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
			\})
		autocmd FileType python call s:configure_lsp()
	  endif
	augroup END
	" 言語ごとにServerが実行されたらする設定を関数化
	function! s:configure_lsp() abort
	  setlocal omnifunc=lsp#complete  " オムニ補完を有効化
	  " LSP用にマッピング
	  nnoremap <buffer> <C-]> :<C-u>LspDefinition<CR>
	  nnoremap <buffer> gd :<C-u>LspDefinition<CR>
	  nnoremap <buffer> gD :<C-u>LspReferences<CR>
	  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
	  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
	  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
	  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
	  nnoremap <buffer> K :<C-u>LspHover<CR>
	  nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
	  nnoremap <buffer> <F2> :<C-u>LspRename<CR>
	endfunction
	let g:lsp_diagnostics_enabled = 0  " 警告やエラーの表示はALEに任せるのでOFFにする

call plug#end()
