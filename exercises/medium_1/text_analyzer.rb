TEXT = <<~TEXT
Eiusmod non aute commodo excepteur amet consequat ex elit. Ut excepteur ipsum
enim nulla aliqua fugiat quis dolore do minim non. Ad ex elit nulla commodo
aliqua eiusmod aliqua duis officia excepteur eiusmod veniam. Enim culpa laborum
nisi magna esse nulla ipsum ex consequat. Et enim et quis excepteur tempor ea
sit consequat cupidatat.

Esse commodo magna dolore adipisicing Lorem veniam quis ut labore pariatur quis
aliquip labore ad. Voluptate ullamco aliquip cillum cupidatat id in sint ipsum
pariatur nisi adipisicing exercitation id adipisicing qui. Nulla proident ad
elit dolore exercitation cupidatat mollit consequat enim cupidatat tempor
aliqua ea sunt ex nisi non.

Officia dolore labore non labore irure nisi ad minim consectetur non irure
veniam dolor. Laboris cillum fugiat reprehenderit elit consequat ullamco veniam
commodo.
TEXT

# Using a heredoc rather than reading in a file
class TextAnalyzer
  def process
    yield(TEXT)
  end
end

# Reading in a file
class TextAnalyzer
  def process
    file = File.open('lorem.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process do |text| 
  paragraph_count = text.split("\n\n").size
  puts "#{paragraph_count} paragraphs"
end 

analyzer.process do |text| 
  line_count = text.split("\n").size
  puts "#{line_count} lines"
end

analyzer.process do |text| 
  word_count = text.split(' ').size
  puts "#{word_count} words"
end

