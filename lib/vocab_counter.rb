class VocabCounter

  def initialize
    @count = Hash.new(0)
  end

  def count(line)
    line.downcase!
    line.gsub!(/[^a-z0-9']/, ' ')
    line.gsub!(/\s'|'\s/, ' ')
    line.split(/\s+/).each do |term|
      @count[term.to_sym] += 1
    end
  end

  def report
    out = ""
    @count.sort { |a,b| b[1] <=> a[1] }.each do |k,v|
      out << "#{k.to_s},#{v}\n"
    end
    out
  end

end

