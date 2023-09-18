module ApplicationHelper

  include Pagy::Frontend
  
    def format_date_french(date)
        date.strftime('%d/%m/%Y') if date.present?
      end
end
