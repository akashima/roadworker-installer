#!/bin/zsh

# rvenv installing
echo it installing rbenv now...
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
echo 'export PATH="$HOME/.rbenv/bin/:$PATH"' >> ~/.zshrc
source ~/.zshrc
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
cd ~/.rbenv/plugins
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

# rvenv specify version
echo it installing ruby now...
rbenv install -l
rbenv install 2.4.3
rbenv global 2.4.3
eval "$(rbenv init -)"

# roadworker install
echo roadworker use middle ware...
sudo yum install git make gcc libxml2-devel libxslt-devel libpcap-devel ruby-devel

echo roadworker installing...
gem search roadworker -r
gem install roadworker --no-rdoc --no-ri

echo end install.
