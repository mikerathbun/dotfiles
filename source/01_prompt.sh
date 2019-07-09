# This is the file which configures the bash prompts.
if [[ "${#__PROMPT_DEFAULT[@]}" == 0 ]]; then
  __PROMPT_DEFAULT=("$PS1" "$PS2" "$PS3" "$PS4")
fi


# The default prompt
function prompt_default() {
  unset PROMPT_COMMAND
  for i in {1..4}; do
    eval "PS$i='${__PROMPT_DEFAULT[i-1]}'"
  done
}

# A simple prompt
function prompt_zero() {
  prompt_default
  PS1='$ '
}


