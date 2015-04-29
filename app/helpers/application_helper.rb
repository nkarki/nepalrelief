module ApplicationHelper

  def get_model_class_fields(clazz)
    hash = clazz.columns_hash
    hash.each do |key, value|
      puts "key = " + key + " value = " + value.to_s
    end
  end

  def get_foreign_key_collection(clazz)
    associations = clazz.reflect_on_all_associations
    associations = associations.select { |a| a.macro == :belongs_to }
    association_foreign_keys = associations.map(&:foreign_key)
  end

  def get_foreign_key_objects(clazz)
    associations = clazz.reflect_on_all_associations
    associations = associations.select { |a| a.macro == :belongs_to }
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in", id: "flash") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def error_messages(resource)
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger alert-dismissible fade in" role="alert">
        <button type="button" class="close" data-dismiss="alert">
          <span aria-hidden="true">×</span>
          <span class="sr-only">Close</span>
        </button>
        <strong>#{sentence}</strong>
        <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  def is_login?
    current_user != nil
  end

end
