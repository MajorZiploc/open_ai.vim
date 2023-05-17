# vim_open_ai

Use to hit open ai models for various common dev tasks

---

## Options

```vim
" required for access to the open ai api
let $OPENAI_API_KEY="YOUR_API_KEY" |
" model to use for query (Default: "text-davinci-003")
let vim_open_ai_model="text-davinci-003" |
" The maximum number of tokens to generate in the completion. (Default: "16")
let vim_open_ai_max_tokens="16" |
" What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. (Default: "1")
let vim_open_ai_max_temperature="1" |
```

## Recommended Keybindings

The t register is used to get the selected_text and use in the Run command

```vim
```
