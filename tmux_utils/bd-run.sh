#!/usr/bin/env sh
# AUTHOR: bikashd4332 (@gmail|twitter|youtube|github)
# DESC:   launch other fzf scripts in tmux
# DEMO:   https://youtu.be/41JxYe70Xwo
# REQD:   bind-key for tmux
#         $EDITOR ~/.tmux.conf
#         # tmux -V >= 3.2+
#         bind-key Tab capture-pane \; save-buffer /tmp/tmux-buffer \; delete-buffer \; display-popup -w 80% -h 60% -E "/path/to/fzf-speed"
#
#         # tmux -V < 3.2
#         bind-key Tab capture-pane \; save-buffer /tmp/tmux-buffer \; delete-buffer \; split-window -Z "/path/to/fzf-speed"
#         bind-key Tab capture-pane \; save-buffer /tmp/tmux-buffer \; delete-buffer \; split-window "/path/to/fzf-speed"

DIR="${0%/*}"
SELECTED="$(find "$DIR" -maxdepth 1 -type f -exec basename {} \; | sort | grep '^_' | sed 's@\.@ @g' | column -s ',' -t |  fzf -e -i --delimiter _ --with-nth='2..' --prompt="bd-run: " --info=default --layout=reverse --tiebreak=index | cut -d ' ' -f1)"
eval "${DIR}/${SELECTED},*"
