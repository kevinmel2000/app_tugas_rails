module ApplicationHelper
  ALERT_TYPES = [:danger, :info, :success, :warning]

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?

      type = :success if type == :notice
      type = :danger  if [:alert, :error].include?(type)
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
         content_tag(:a, raw("&times;"), class: "close", "data-dismiss" => "alert") +
         msg, class: "alert alert-#{type}")
        flash_messages << text if message
      end
    end

    flash_messages.join("\n").html_safe
  end

  def form_failure_message(resource)
    messages = resource.errors.full_messages.inject([]) {|memo, error| memo << error }
    content_tag(
      :div,
      content_tag(:a, raw("&times;"), class: "close", "data-dismiss" => "alert") +
      messages.join('<br />').html_safe, class: "alert alert-danger"
      ) unless messages.blank?
  end

  def error_on(record, field)
    html = ""
    record.errors[field].each do |error|
      html += %{ <span class="help-block help-error">#{ field.to_s.humanize } #{ error }<span> }
    end if record.errors.include?(field)

    html.html_safe
  end

  def transmission
    @transmission = ['manual','automatic','semi-auto']
  end
  def seat
    @seat = ['1','2','3','4','5','6','7','8','9','10','11','12']
  end
  def door
    @door = ['2','4','5']
  end
  def fuel
    @fuel = ['premium','pertamax','pertamax plus']
  end
  def engine
    @engine = ['intake stroke','compression stroke','combustion stroke','exhaust stroke']
  end
  def fulltank
    @fulltank = ['5 Liter','4 Liter','15 Liter']
  end
  def brand
    @brand = ['Honda','Yamaha','Suzuki','Bajaj','Kawasaki','Scooter','KTM','Ducati']
  end
 

  def color
    @color = ['Black','Brown','red','Yellow','Blue']
  end
  def sim
    @sim = ['One Sim','Dual Sim','Tree Sim']
  end
  def camera
    @camera = (1..32)
  end
   def bathroom
    @bathroom = (1..12)
  end
   def bedroom
    @bedroom = (1..12)
  end
  def certificate
    @certificate = ['SSHM(Sertifikat Hak Milik)','DHGB(Hak Guna Bangun)','TLainnya(PPJB,Girik,Adat,dll))']
  end
  def condition
    @condition = ['Baru','Bekas']
  end
  def catalog_type
    @catalog_type = ['Property','Gadget','Mobil','Motor']
  end

 


  # def year
  #   @year = [Date.current.year,:end_year => 1920]
  # end

end
