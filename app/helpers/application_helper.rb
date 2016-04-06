module ApplicationHelper
  def current_user?(user)
    current_user.id == user.id
  end

  # def add_date_unit(str)
  #       if str =~ /(<select.+?<\/select>).+ ?(<select.+?<\/select>).+ ?(<select.+?<\/select>)/m ($1 + "年\n" + $2 + "月\n" + $3 + "日\n" + $`).html_safe
  #       else
  #           str
  #       end
  # end
  def add_date_unit(str)
    if str =~ /(<select.+?<\/select>).+?(<select.+?<\/select>).+
        ?(<select.+?<\/select>)/m
        ($1 + "年\n" + $2 + "月\n" + $3 + "日\n" + $').html_safe
        else
        str
        end
  end
end
