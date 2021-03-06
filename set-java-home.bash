asdf_update_java_home() {
  local java_path
  java_path="$(asdf which java)"
  if [[ -n "${java_path}" ]]; then
    export JAVA_HOME
   JAVA_HOME="$(dirname "$(dirname "$(realpath "${java_path}")")")"
  fi
}

prompt_command() {
  if [[ "${PWD}" == "${LAST_PWD}" ]]; then
    return
  fi
  LAST_PWD="${PWD}"
  asdf_update_java_home
}

export PROMPT_COMMAND="${PROMPT_COMMAND:+${PROMPT_COMMAND}; prompt_command}"
export PROMPT_COMMAND="${PROMPT_COMMAND:-prompt_command}"
