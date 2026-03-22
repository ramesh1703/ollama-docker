#!/bin/bash
# Sourced by other scripts in this directory.
use_docker_desktop_context() {
  if docker context inspect desktop-linux &>/dev/null; then
    docker context use desktop-linux
  else
    docker context use default
  fi
}
