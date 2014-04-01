module ApplicationHelper
  renderer = Redcarpet::Render::HTML.new
  extensions = {fenced_code_blocks: true}
  redcarpet = Redcarpet::Markdown.new(renderer, extensions)
  #(redcarpet.render text).html_safe     #FIXME undefined local variable or method 'text'
end

