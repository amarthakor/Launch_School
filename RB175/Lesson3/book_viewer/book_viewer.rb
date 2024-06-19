require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

helpers do

  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end.join
  end

  def highlight(text, term)
    text.gsub(term, "%(<strong>#{term}</strong>)")
  end

end

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do

  if params[:query]
    # each result in this array will be:
    # [ chapter name, chapter index, paragraph index ]
    @results = @contents.each_with_index.each_with_object([]) do |(chapter, index), results|
      text = File.read("data/chp#{index + 1}.txt")
      paragraphs = text.split("\n\n")
      paragraphs.each_with_index do |paragraph, paragraph_index|
        if paragraph.include?(params[:query])
          results << [chapter, index, paragraph, paragraph_index]
        end
      end
    end
  end

  erb :search
end

not_found do
  redirect "/"
end
# require "tilt/erubis"
# require "sinatra"
# require "sinatra/reloader"

# before do
#   @contents = File.readlines("data/toc.txt")
# end

# get "/" do
#   @title = "The Adventures of Sherlock Holmes"

#   erb :home
# end

# get "/chapters/:number" do
#   number = params[:number].to_i
#   chapter_name = @contents[number - 1]

#   redirect "/" unless (1..@contents.size).cover? number

#   @title = "Chapter #{number}: #{chapter_name}"
#   @chapter = File.read("data/chp#{number}.txt")

#   erb :chapter
# end

# get "/show/:name" do
#   params[:name]
# end

# get "/search" do
#   @results = chapters_matching(params[:query])
#   erb :search
# end

# helpers do

#   def in_paragraphs(text)
#     text.split("\n\n").each_with_index.map do |line, index|
#       "<p id=paragraph#{index}>#{line}</p>"
#     end.join
#   end

#   def highlight(text, term)
#     text.gsub(term, %(<strong>#{term}</strong>))
#   end

# end

# not_found do
#   redirect "/"
# end

# def each_chapter
#   @contents.each_with_index do |name, index|
#     number = index + 1
#     contents = File.read("data/chp#{number}.txt")
#     yield number, name, contents
#   end
# end

# def chapters_matching(query)
#   results = []

#   return results unless query

#   each_chapter do |number, name, contents|
#     matches = {}
#     contents.split("\n\n").each_with_index do |paragraph, index|
#       matches[index] = paragraph if paragraph.include?(query)
#     end
#     results << {number: number, name: name, paragraphs: matches} if matches.any?
#   end

#   results
# end