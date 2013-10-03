local RBENVPATH="$HOME/.rbenv"
local RVMPATH="$HOME/.rvm"

if [[ -d $RBENVPATH ]];then
  PATH="$RBENVPATH/bin:$PATH"
  eval "$(rbenv init -)"
elif [[ -d $RVMPATH ]];then
  PATH="$RVMPATH/bin:$PATH"
else
  return
fi

alias bi="bundle install"
alias bdgem="gem build *.gemspec; gem install *.gem --no-ri --no-rdoc; rbenv rehash"
alias rake="noglob rake"
alias binstubs="gem regenerate_binstubs"
alias coveron="export COVERALLS_RUN_LOCALLY=true"
alias coveroff="unset COVERALLS_RUN_LOCALLY"

