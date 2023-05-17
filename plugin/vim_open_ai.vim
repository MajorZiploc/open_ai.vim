command! VimOpenAiScratch new | setlocal bt=nofile bh=wipe nobl noswapfile nu

function! VimOpenAiRun(...)
  let run_type = get(a:, 1, '')
  let debug = get(a:, 2, 'false')
  let model_type = get(g:, 'vim_open_ai_model', 'text-davinci-003')
  let max_tokens = get(g:, 'vim_open_ai_max_tokens', '16')
  let temperature = get(g:, 'vim_open_ai_max_temperature', '1')
  let number_of_choices = 1
  let debug_label = "DEBUG-> "
  let _default_file_type = "log"
  let _should_bottom_split = 1
  " assumes the selected text will be yanked into the t register prior to VimOpenAiRun
  let prompt = @t
  let _command = 'curl https://api.openai.com/v1/completions -H "Content-Type: application/json" -H "Authorization: Bearer ' . $OPENAI_API_KEY . '" '
  let _command = _command . '-d ' . "'" . '{ model": ' . '"' . model_type
        \ . '", "max_tokens": ' . max_tokens
        \ . ', "temperature": ' . temperature
        \ . ', "prompt": ' . '"' . prompt
        \ . '", "n": ' . number_of_choices
        \ . ' }'
  if (debug != 'true')
    let g:vim_openai_query_results = system(_command)
    if (trim(prompt) == '')
      echohl WarningMsg
      echo "No prompt stored in the t register!"
      echohl None
    elseif (_should_bottom_split)
      set splitbelow
      horizontal belowright VimOpenAiScratch
      put =g:vim_openai_query_results
      let &filetype = _file_type
      execute "normal! ggdd"
      set splitbelow!
    else
      put =g:vim_openai_query_results
    endif
  else
    echo debug_label "run_type: " run_type
    echo debug_label "_command: " _command
    echo debug_label "_should_bottom_split: " _should_bottom_split
  endif

endfunction
