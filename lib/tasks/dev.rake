namespace :dev do
  desc 'Configura o ambiente de desenvolvimento.'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { `rails db:drop` }
      show_spinner('Criando BD...') { `rails db:create` }
      show_spinner('Migrando BD...') { `rails db:migrate` }
      `rails dev:add_mining_type`
      `rails dev:add_coins`
    else
      puts 'Você não esta no ambiente de desenvolvimento!!!'
    end
  end

  desc 'Adiciona moedas no BD.'
  task add_coins: :environment do
    show_spinner('Cadastrando moedas...') do
      coins = [
        {
          description: 'Bitcoin',
          acronym: 'BTC',
          url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png',
          mining_type: MiningType.find_by(acronym: 'PoW')
        },
        {
          description: 'Etherium',
          acronym: 'ETC',
          url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Dash',
          acronym: 'DASH',
          url_image: 'https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'Iota',
          acronym: 'IOT',
          url_image: 'https://miro.medium.com/max/664/1*xo-u5QhLFYUcZwPKdhe8Cg.png',
          mining_type: MiningType.all.sample
        },
        {
          description: 'ZCash',
          acronym: 'ZEC',
          url_image: 'https://z.cash/wp-content/uploads/2019/03/zcash-icon-fullcolor.png',
          mining_type: MiningType.all.sample
        }
      ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end

  desc 'Cadastro dos tipos de mineração.'
  task add_mining_type: :environment do
    show_spinner('Cadastrando tipos de mineração...') do
      mining_types = [
        { description: 'Proof of Work', acronym: 'PoW' },
        { description: 'Proof of Stake', acronym: 'PoS' },
        { description: 'Proof of Capacity', acronym: 'PoC' }
      ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído com sucesso!!!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success(msg_end.to_s)
  end
end
