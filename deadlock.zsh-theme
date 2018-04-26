### User tweakable options
# show a long description of the git status, e.g. 'modified' or only symbols
DEADLOCK_GIT_STATUS_LONG_DESCRIPTION=${DEADLOCK_GIT_STATUS_LONG_DESCRIPTION:="true"}
# show the 'username@hostname' always or only when on remote machines
DEADLOCK_USER_HOST_ALWAYS="${DEADLOCK_USER_HOST_ALWAYS:=true}"

local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_symbol='$'

if [[ "$DEADLOCK_USER_HOST_ALWAYS" == "true" || -n $SSH_CONNECTION ]]; then
    if [[ $UID -eq 0 ]]; then
        local user_host='%{$terminfo[bold]$fg[red]%}%n@%m%{$reset_color%}'
        $user_symbol='#'
    else
        local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
    fi
fi

if [[ -n $SSH_CONNECTION ]]; then
    local ssh_connection='%{$fg_bold[red]%} (ssh)%{$reset_color%}'
fi

### directory
if [[ ! -w "${PWD}" ]]; then
    local cur_dir_writable='%{$fg_bold[red]%}✗%{$reset_color%}'
fi
local current_dir='$cur_dir_writable %{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'

### git
local git_branch='$(git_prompt_info) $(git_prompt_status)%{$reset_color%}'

# showing dirty/clean is redundant, given the individual symbols below. So avoid that noise
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
if [[ "$DEADLOCK_GIT_STATUS_LONG_DESCRIPTION" == "true" ]]; then
    ZSH_THEME_GIT_PROMPT_ADDED="%F{green}✓added%f)"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}✶modified%f)"
    ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✗deleted%f)"
    ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}↝renamed%f)"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}unmerged%f)"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan}✩untracked%f)"
    ZSH_THEME_GIT_PROMPT_AHEAD="%F{red}⇡ahead%f)"
    ZSH_THEME_GIT_PROMPT_BEHIND="%F{green}⇣behind%f)"
    ZSH_THEME_GIT_PROMPT_STASHED="%F{green}↱stashed%f)"
    ZSH_THEME_GIT_PROMPT_DIVERGED="%F{green}⤱diverged%f)"
else
    ZSH_THEME_GIT_PROMPT_ADDED="%F{green}✓%f)"
    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}✶%f)"
    ZSH_THEME_GIT_PROMPT_DELETED="%F{red}✗%f)"
    ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}↝%f)"
    ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}%f)"
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{cyan}✩%f)"
    ZSH_THEME_GIT_PROMPT_AHEAD="%F{red}⇡%f)"
    ZSH_THEME_GIT_PROMPT_BEHIND="%F{green}⇣%f)"
    ZSH_THEME_GIT_PROMPT_STASHED="%F{green}↱%f)"
    ZSH_THEME_GIT_PROMPT_DIVERGED="%F{green}⤱%f)"
fi
ZSH_THEME_GIT_PROMPT_PREFIX="(%{git:$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="›%{$reset_color%}"
### end git

# prevent percentage showing up if output doesn't end with a newline
export PROMPT_EOL_MARK=''

### build complete prompt
PROMPT="╭─${ssh_connection} ${user_host} ${current_dir} ${git_branch}
╰─%B${user_symbol}%b "
RPS1="%B${return_code}%b"
