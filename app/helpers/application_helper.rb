module ApplicationHelper
  def br_date(date)
    date.strftime('%d/%m/%Y')
  end

  def ambiente_rails
    ambiente = Rails.env
    if ambiente.development?
      'Desenvolvimento'
    elsif ambiente.production?
      'Produção'
    else
      'Testes'
    end
  end
end
