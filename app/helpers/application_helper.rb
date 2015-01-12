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
    @transmission = ['manual','automatic']
  end
  def seat
    @seat = ['2','4','6']
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
  # def year
  #   @year = [Date.current.year,:end_year => 1920]
  # end

end
