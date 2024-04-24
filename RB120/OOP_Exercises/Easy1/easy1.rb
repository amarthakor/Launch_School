=begin

Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
  end

  def empty_line
  end

  def message_line
    "| #{@message} |"
  end
end


Complete this class so that the test cases shown below work as intended. 
You are free to add any methods or instance variables you need. 
However, do not make the implementation details public.

You may assume that the input will always fit in your terminal window.

Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

banner = Banner.new('')
puts banner
+--+
|  |
|  |
|  |
+--+

Problem: Given an incomplete classBanner, complete the class to the specifications

Rules
- Can add any methods or instance variables needed
- Implementaiton details must not be public
- Assume input will always fit in terminal window
- Need to create top line which mirrors bottom lime
  - Top line consists of start + and end +
  - In between + are '-' * the size of the message
- Need to create 2nd line which mirros 4th line
  - Has 2 characters, start '|' and end '|'
  - Whitespace * the size of the message in between '|'
    - |            |
- Need to create middle line
  - Message gets placed here
  - Appears to start and end with '|'
  - Appears to have a whitespace before and after the message
    - | #{message} |

=end

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :message

  def horizontal_rule
    "+" + "-" * (message.size + 2) + "+"
  end

  def empty_line
    "|" + ' ' * (message.size + 2) + "|"
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new("To boldly go where no one has gone before.")
puts banner

banner = Banner.new('')
puts banner