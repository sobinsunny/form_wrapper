require 'json'
module FormBuilderHelper

  def validated_form_tag(attr = {:type => "text_box" })
    html = ''
    html << "<div class='form_container align_left'>"
    html << create_label(attr)
    if attr[:type] == 'checkbox'
      html << check_box_tag("#{attr[:form_name]}[#{attr[:field]}]", "true", :class => 'text_field', :required => '', :pattern => attr[:pattern], :placeholder => attr[:name])
    elsif attr[:type] == 'text_area'
      html << create_text_area_input(attr)
    elsif
      html <<  attr[:type] == 'select_box'
    else
      html << create_input(attr)
    end
    html << "</div>"
    html << "</div>"
    html.html_safe
  end


  def build_validated_select(attr={})
    html = ""
    html << "<div class='small-9 columns'>"
    html << select_tag("#{attr[:form_name]}[#{attr[:field]}]", options_for_select(attr[:options]), {:multiple => attr[:multiple]})
    html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"
    html.html_safe
  end


  def create_input attr
    #TODO line length reduce
    attr[:pattern]= select_pattern(attr[:validation])
    local_html=""
    local_html << "<input id = '#{attr[:form_name]}_#{attr[:field]}' name='#{attr[:form_name]}[#{attr[:field]}]' type='#{attr[:type].downcase}' value='#{attr[:value]}',pattern='#{attr[:pattern]}' required = 'true'  placeholder = '#{attr[:field].capitalize}',min=#{attr[:min]} max=#{attr[:max]}/>"
    local_html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"
  end

  def create_text_area_input(attr)

    local_html  = ''
    local_html << text_area_tag("#{attr[:form_name]}[#{attr[:field]}]", "", :class => 'text_field', :required => '', :pattern => attr[:pattern], :placeholder => attr[:name],:rows=>1)
    local_html << "<small class='error'>#{attr[:error].blank? ? '' : attr[:error] }</small>"

  end

  def create_label(attr)
    local_html  =  ""
    local_html  << "<div class ='form_label_div'>"
    local_html  << label_tag("#{attr[:form_name]}_#{attr[:field]}", attr[:name].capitalize, :class => 'left inline')
    local_html  << "</div>"
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

  def select_pattern(feild)
    pattern=''
    if feild=='url'
      pattern = 'https?://.+'
    elsif feild ='email'
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
   html.html_safe
 end


end





