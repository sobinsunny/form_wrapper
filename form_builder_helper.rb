module FormBuilderHelper

    def validated_form_tag(attr = {:type => "text_box" })

      html = ''
      html << "<div class='form_container align_left'>"
      html << create_label(attr)

      if attr[:type] == 'checkbox'
        html << check_box_tag("#{attr[:form_name]}[#{attr[:field]}]", "#{attr[:form_name]}[#{attr[:value]}]", :class => 'text_field', :required => '', :attr[:pattern] => attr[:pattern], :placeholder => attr[:name])
      elsif attr[:type] == 'text_area'
        html << create_text_area_input(attr)
      else
        html << create_input(attr)
      end
      html << "</div>"
      html << "</div>"
      html.html_safe
    end


     def create_input attr
       #TODO line length reduce
        local_html=""
        local_html << "<input id = '#{attr[:form_name]}_#{attr[:field]}' name='#{attr[:form_name]}[#{attr[:field]}]' type='#{attr[:type].downcase}' value='#{attr[:value]}',pattern='#{attr[:pattern]}' required = 'true'  placeholder = '#{attr[:name].capitalize}'/>"
     end

     def create_text_area_input(attr)
       local_html << text_area_tag("#{attr[:form_name]}[#{attr[:field]}]", "#{attr[:form_name]}[#{attr[:value]}]", :class => 'text_field', :required => '', :attr[:pattern] => attr[:pattern], :placeholder => attr[:name],:rows=>1)
     end

    def create_label(attr)
      local_html  =  ""
      local_html  << "<div class ='form_label_div'>"
      local_html  << label_tag("#{attr[:form_name]}_#{attr[:field]}", attr[:name].capitalize, :class => 'left inline')
      local_html  << "</div>"
    end

end

ActionController::Base.send :include,FormBuilderHelper

