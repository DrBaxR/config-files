#!/bin/bash
# source this script to use
cw() {
    cd $(find $HOME/work -maxdepth 3 -type d | fzf)
}
