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
          url_image: 'data:image/png;base64,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',
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
