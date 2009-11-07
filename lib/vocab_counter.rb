class VocabCounter

  def self.count(input)
    input.downcase!
    input.gsub!(/[^a-z0-9']/, ' ')
    input.gsub!(/\s'|'\s/, ' ')
    count = Hash.new(0)
    input.split(/\s+/).each do |term|
      count[term.to_sym] += 1
    end

    out = ""
    count.sort { |a,b| b[1] <=> a[1] }.each do |k,v|
      out << "#{k.to_s},#{v}\n"
    end
    out
  end

end

