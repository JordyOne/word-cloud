require 'json'

def count_words(data_hash)
  h = Hash.new(0)
  data_hash.each_key do |name|
    data_hash[name].each do |line|
      line.downcase.scan(/\w+/) do |w|
        if h.has_key?(w)
          h[w][:count] += 1
          h[w][:people].push(name)
        else
          h[w] = {:count => 1, :people => [name]}
        end
      end
    end
  end
    h
end


file = File.read('data/quotes.json')
data_hash = JSON.parse(file)


puts count_words(data_hash)
