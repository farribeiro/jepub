module Jekyll
class Img < Liquid::Tag
	Syntax = /^\s*([^\s]+)\s+(\d+)\s+(\d+)\s+([^\s]+)\s+(.*) /

	def initialize(tagName, markup, tokens)
		super

		if markup =~ Syntax then
			@path = $1
			@width = $2.to_i
			@height = $3.to_i
			@class = $4
			@surl = Jekyll.configuration({})['url']

			# if $5.nil? then
			# 	@caption = " "
			# else
			@caption = $5
			# end
		end
	end

	def render(context)
		"
		<img class=\"#{@class}\" alt=\"#{@caption}\" width=\"#{@width}\" height=\"#{@height}\" src=\"#{@surl}/images/#{@path}\" />
		"
	end

	Liquid::Template.register_tag "img", self
end
end
