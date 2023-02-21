#inicia o servidor ssh
/usr/sbin/sshd
# instala as dependencias do Yarn
yarn install
# Instala as Gems
bundle check || bundle install
# Realiza as migrations no banco
bundle exec rails db:create
bundle exec rails db:migrate
# Compila os assets
bundle exec rails assets:precompile
# Roda nosso servidor
bundle exec puma -C config/puma.rb
