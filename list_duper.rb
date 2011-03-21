# Note: This script only works from a whitelisted IP (e.g. web1.wordnik.com)

%w(rubygems wordnik).each {|lib| require lib}
Wordnik.configure {|c| c.api_key = 'd92d8109432f0ead8000707303d0c6849e23be119a18df853'}

colors = []
lists = %w(
  chromatica
  color
  color-me-mauve
  color-my-words
  color-words-for-shoes 
  colorful-colors  
  colors--2
  colors--5
  colors--7
  colors-fantastic
  colour-me-happy
  crayola-old-style
  names-of-colours
  not-your-normal-colors
)

# Fetch each list and add its words to the colors array
lists.each do |list|
  request = Wordnik::Request.new(:get, "wordList.json/#{list}/words")
  request.response.body.each do |listed_word|
    colors << listed_word['word'].downcase
  end
end


Wordnik.configure do |c|
  c.api_key = '1d3baf57f57254b5c430200e729037e9dea9d87493f3a16b4'
  c.username = 'wordrainbow'
  c.password = 'gomer'
end
Wordnik.authenticate


my_color_list = "colors--9"
# Remove duplicates and alphabetize

colors.uniq.sort.each do |color|
  
  request = Wordnik::Request.new(
    :post,
    "wordList.json/#{my_color_list}/words",
    :body => {:word => color}
  )
  
end