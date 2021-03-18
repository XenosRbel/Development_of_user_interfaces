# frozen_string_literal: true

class CheckboxInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    tag_name = "#{@builder.object_name}[#{attribute_name}]"
    template.check_box_tag(tag_name, options["value"] || 1, options["checked"], merged_input_options)
  end

  private

  def input_html_options
    super.merge(class: [:boolean, :optional, "col-sm-2"])
  end
end
