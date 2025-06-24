# Network Functions
weather() { curl -s "wttr.in/${1:-}" | head -17; }

# Git functions
gblog() {
  local branch
  branch=$(git branch --all | sed 's/^[* ] //' | fzf) || return
  git log --oneline --graph --decorate "$branch"
}

