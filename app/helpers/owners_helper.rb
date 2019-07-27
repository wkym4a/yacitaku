module OwnersHelper

  def get_account_type_name(type)

    case type
    when 0
      return "普通預金"
    when 1
      return "当座預金"
    else
      return "想定外データ"
    end
  end
end
