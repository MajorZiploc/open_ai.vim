command! VimOpenAiScratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

function! VimOpenAiRun(...)
  let run_type = get(a:, 1, '')
  let debug = get(a:, 2, 'false')
  let debug_label = "DEBUG-> "
  let _default_file_type = "text"
endfunction
