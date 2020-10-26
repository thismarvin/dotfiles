command! Config execute ":e ~/AppData/Local/nvim/init.vim"
command! Reload execute "source ~/AppData/Local/nvim/init.vim"

command! DotnetBuild execute ":Dispatch dotnet build"
command! DotnetRun execute ":Dispatch dotnet run"

command! CargoFormat execute ":Dispatch cargo fmt"
command! CargoBuild execute ":Dispatch cargo build"
command! CargoRun execute ":Dispatch cargo run"

command! NpmBuild execute ":Dispatch npm run build"
command! NpmStart execute ":Dispatch npm run start"

