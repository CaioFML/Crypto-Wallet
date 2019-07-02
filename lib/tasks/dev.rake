namespace :dev do
  desc 'Configura o ambiente de desenvolvimento.'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Apagando BD...') { `rails db:drop` }
      show_spinner('Criando BD...') { `rails db:create` }
      show_spinner('Migrando BD...') { `rails db:migrate` }
      show_spinner('Populando BD...') { `rails db:seed` }
    else
      puts 'Você não esta no ambiente de desenvolvimento!!!'
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
