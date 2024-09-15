module Jekyll
  class Link < Liquid::Tag
    def initialize(tag_name, input, tokens)
      super
      @input = input
    end

    def render(_context)
      params = split_params(@input)
      title = params[0].strip
      link = params[1].strip

      output = "[**#{title}**](#{link}){:target='_blank'}"
      return output
    end

    def split_params(params)
      params.split(' | ')
    end
  end
end

Liquid::Template.register_tag('link', Jekyll::Link)
