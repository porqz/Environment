if [ "$(whoami)" = "root" ]; then
	NCOLOR="red";
	local username="%n@";
else
	local username="";
fi

PROMPT="${username}%{$fg[$NCOLOR]%}%c%{$fg[black]%}:%{$reset_color%} "
RPROMPT='$(git_prompt_info) %{$reset_color%} %*'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}⤙ %{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$reset_color%}✏"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"

