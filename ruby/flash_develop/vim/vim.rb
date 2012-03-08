module VIM
  def self.cursor_word
    VIM::evaluate('expand("<cword>")')
  end

  def self.cursor_sentence
    VIM::evaluate('expand("<cWORD>")')
  end

  def self.input(question, default)
    VIM::evaluate("input(\"#{question}\", \"#{default}\")")
  end

  def self.input_list(question, options, return_type = :si)
    # s  ... Return one selected element
    # si ... Return the index of the selected element
    # m  ... Return a list of selected elements
    # mi ... Return a list of indexes
    VIM::evaluate("tlib#input#List('#{return_type}',\"#{question}\", [#{options.collect {|opt| "'#{opt}'" }.join(',')}]) -1")
  end

  def self.pwd
    VIM::evaluate('getcwd()')
  end

  def self.open(path)
    VIM::command("open #{path}")
  end

  def self.echoerr(str)
    VIM::command("echoerr(\"#{str}\")")
  end

  def self.file_readable?(path)
    VIM::evaluate("file_readable('#{path}')") == 1
  end
end
