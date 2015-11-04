module ApplicationHelper

	def markdown(text)
    	options = {   
	        :autolink => true, 
	        :space_after_headers => true,
	        :fenced_code_blocks => true,
	        :no_intra_emphasis => true,
	        :hard_wrap => true,
	        :strikethrough =>true
      	}
    	markdown = Redcarpet::Markdown.new(HTMLwithCodeRay,options)
    	markdown.render(h(text)).html_safe
  	end

    class HTMLwithCodeRay < Redcarpet::Render::HTML
    	def block_code(code, language)
      		CodeRay.scan(code, language).div(:tab_width=>2)
    	end
  	end

    def marksub(text)
      str = markdown(text)
      index = str.index(/\n/, 70)
      if index
        str[0, index]
      else
        str
      end
    end  
end
