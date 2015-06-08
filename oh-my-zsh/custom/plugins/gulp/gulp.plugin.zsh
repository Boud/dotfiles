function _gulp_completion() {
  # Grab tasks
  compls=$(gulp --tasks-simple)
  completions=(${=compls})
  compadd -- $completions
}

compdef _gulp_completion gulp