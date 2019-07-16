echo 'filetype go'
" インデントはタブにする
set noexpandtab

call plug#begin('~/.vim/plugged')
    " syntax check
    " https://kashewnuts.github.io/2018/12/02/bp_advent_calender.html#w0rp-ale-linter-fixer
    Plug 'w0rp/ale'

    """"""""""""""""""""""""""""""
    " w0rp/aleの設定
    """"""""""""""""""""""""""""""
    " ファイル保存時にLinterを実行する
    let g:ale_lint_on_save = 1
    " テキスト変更時にはLinterを実行しない
    let g:ale_lint_on_text_changed = 'never'
    " Linter(コードチェックツール)の設定
    let g:ale_linters = {
    \   'go': ['gofmt'],
    \}
    " ファイル保存時にはFixerを実行しない
    let g:ale_fix_on_save = 0
    " テキスト変更時にはFixerを実行しない
    let g:ale_fix_on_text_changed = 'never'
    " Fixer(コード整形ツール)の設定
    let b:ale_fixers = {
    \   'go': ['gofmt'],
    \}
    " 余分な空白があるときは警告表示
    let g:ale_warn_about_trailing_whitespace = 0
    " ALE実行時にでる目印行を常に表示
    let g:ale_sign_column_always = 1
    let g:go_highlight_debug = 1
call plug#end()
