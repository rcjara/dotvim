" save and send to the build command
nmap ,r :w<cr>\|:execute "!write-cmd './build_run.rb " . expand("%") . "'"<cr>\|<cr>k
