if has("win32")
  command! Config execute ":e ~/AppData/Local/nvim/init.vim"
  command! Reload execute "source ~/AppData/Local/nvim/init.vim"
endif

augroup csharp_commands
  autocmd!
  autocmd FileType cs command! DotnetBuild execute ":Dispatch dotnet build"
  autocmd FileType cs command! DotnetRun execute ":Dispatch dotnet run"
augroup end

augroup rust_commands
  autocmd!
  autocmd FileType rust nnoremap <buffer> <silent><leader>rsf :RustFmt<CR>
  autocmd FileType rust command! CargoCheck execute ":Dispatch cargo check"
  autocmd FileType rust command! CargoBuild execute ":Dispatch cargo build"
  autocmd FileType rust command! CargoRun execute ":Dispatch cargo run"
augroup end

augroup javascript_commands
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <silent><leader>jsf :PrettierAsync<CR>
  autocmd FileType javascript command! NpmBuild execute ":Dispatch npm run build"
  autocmd FileType javascript command! NpmStart execute ":Dispatch npm run start"
augroup end

