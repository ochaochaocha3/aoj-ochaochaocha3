# AOJ 1101 A Simple Offline Text Editor

class TextEditor
  def initialize(text)
    @text = text
    @cursor = 0
  end

  def to_s
    text_before_cursor + "^" + text_after_cursor
  end

  def inspect
    %Q|#<TextEditor:0x#{"%x".%(object_id)} "#{to_s}">|
  end

  def forward_char
    @cursor += 1 if @cursor < @text.length
    self
  end

  def forward_word
    if @cursor < @text.length
      m = /^ +/.match(text_after_cursor)
      @cursor += m[0].length if m
    end

    if @cursor < @text.length
      m = /^[^ ]+/.match(text_after_cursor)
      @cursor += m[0].length if m
    end

    self
  end

  def backward_char
    @cursor -= 1 if @cursor > 0
    self
  end

  def backward_word
    if @cursor > 0
      last_blank_pos = text_before_cursor.sub(/\s+$/, "").rindex(" ")
      if last_blank_pos
        @cursor = last_blank_pos + 1
      else
        @cursor = 0
      end
    end

    self
  end

  def insert(text)
    @text = text_before_cursor + text + text_after_cursor
    @cursor += text.length

    self
  end

  def delete_char
    unless @cursor == @text.length
      @text = text_before_cursor + text_after_cursor[1..-1]
    end

    self
  end

  def delete_word
    if @cursor < @text.length
      @text = text_before_cursor +
        text_after_cursor.sub(/ *[^ ]+/, "")
    end

    self
  end

  private
  def text_before_cursor
    if @cursor.zero?
      ""
    else
      @text[0..(@cursor - 1)]
    end
  end

  def text_after_cursor
    if @cursor == @text.length
      ""
    else
      @text[@cursor..-1]
    end
  end
end

n_texts = gets.to_i
n_texts.times do
  t = TextEditor.new(gets.chomp)

  n_commands = gets.to_i
  n_commands.times do
    command, argument = gets.chomp.split(" ", 2)
    argument.sub!(/^ +/, "")

    case command
    when "forward"
      case argument
      when "char"
        t.forward_char
      when "word"
        t.forward_word
      end
    when "backward"
      case argument
      when "char"
        t.backward_char
      when "word"
        t.backward_word
      end
    when "insert"
      m = /^"(.*)"/.match(argument)
      t.insert m[1] if m
    when "delete"
      case argument
      when "char"
        t.delete_char
      when "word"
        t.delete_word
      end
    end
  end

  puts t.to_s
end
