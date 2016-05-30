require 'json'
module FormBuilderHelper

  def validated_form_tag(attr = {:type => "text_box" })
    html = ''
    if attr[:type] == 'checkbox'
      html << create_checkbox(attr)
    elsif attr[:type] == 'text_area'
      html << create_text_area_input(attr)
    elsif  attr[:type] == 'select_box'
      html << build_validated_select(attr)
    elsif attr[:type] == 'radio'
      html <<  create_radio_button(attr)
    else
      html << create_input(attr)
    end
    html.html_safe
  end

  def create_radio_button attr
    html_local = ''
    html_local << radio_button_tag(attr[:field], attr[:value], attr[:checked] = false,:class=>attr[:class])
  end

  def create_checkbox attr
      local_html = ''
      local_html << "<div class='check_box'>"
      local_html << create_label(attr)
      local_html << check_box_tag("#{attr[:form_name]}[#{attr[:field]}]", "true", :class => 'text_field', :required => '', :pattern => attr[:pattern], :placeholder => attr[:feild])
      local_html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"
      local_html << '</div>'
  end

  def add_button
    local_html = ''
    local_html << '<input name="commit" value="Create" type="submit">'
  end

  def build_validated_select(attr={})
    html = ""
    html << create_label(attr)
    html << select_tag("#{attr[:form_name]}[#{attr[:field]}]", options_for_select(attr[:options]), {:multiple => attr[:multiple]})
    html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"
    html.html_safe
  end


  def create_input attr
    #TODO line length reduce
    attr[:pattern]= select_pattern(attr[:field])
    local_html = ''
    local_html << create_label(attr)
    local_html << "<div class='form-group'>"
    local_html << "<input id = '#{attr[:form_name]}_#{attr[:field]}' name='#{attr[:form_name]}[#{attr[:field]}]' type='#{attr[:type].downcase}' value='#{attr[:value]}',pattern='#{attr[:pattern]}' required = 'true'  placeholder = '#{attr[:field].capitalize}',min=#{attr[:min]} max=#{attr[:max]}/>"
    local_html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"
    local_html << "</div>"
  end

  def create_text_area_input(attr)
    local_html  = ''
    local_html << text_area_tag("#{attr[:form_name]}[#{attr[:field]}]", "", :class => 'text_field', :required => '', :pattern => attr[:pattern], :placeholder => attr[:name],:rows=>1)
    local_html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"

  end

  def create_label(attr)
    local_html  =  ""
    local_html  << label_tag("#{attr[:form_name]}_#{attr[:field]}", attr[:field].capitalize, :class => 'left inline')
  end

  def make_form_elements(json)
    html = ""
    begin
      json_data = JSON.parse(json)
      html << create_form_elements(json_data)
      html.html_safe
    rescue JSON::ParserError => e
      html <<  "Invalid json format"
    end
   html.html_safe
  end

  def select_pattern(field)
    pattern=''
    if field=='url'
      pattern = 'https?://.+'
    elsif field ='email'
      pattern = '[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$'
    end
    pattern
  end


 def create_form_elements(json)
   html = ''
   form_data = {:form_name=>json["form_name"]}
   json["elements"].each  do |key,value|
       attr = {}
       attr = HashWithIndifferentAccess.new value
       attr.merge!(form_data)
       html <<  validated_form_tag(attr)
   end
   html << add_button
   html.html_safe
 end
end
