# def combine_anagrams(words)
#   hash = {}
#   words.each do |word|
#     tmp = word.downcase.chars.sort.join
#     if hash[tmp]
#       hash[word] = tmp
#     else
#       hash[word] = tmp
#     end
#   end
#   hash
# end

# ola = ['Cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# puts "#{combine_anagrams(ola)}"



def combine_anagrams(words)
	hash = {}
	words.each do |word|
		string_to_compare = word.downcase.chars.sort.join
		if hash[string_to_compare]
			hash[string_to_compare].push(word)
		else
			hash[string_to_compare] = [word]
		end
	end
	combined_anagram = []
	hash.each do |key, value|
		combined_anagram.push(value)
	end
	return combined_anagram
end
input = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] 
puts "#{combine_anagrams(input)}"


# def is_anagram(w1, w2)
# 	w1.downcase.split("").sort.join == w2.downcase.split("").sort.join
# end
# def combine_anagrams(words)
# 	result = Array.new;
# 	array = Array.new;
# 	i = 0;
# 	j = i+1;
# 	while words.length > 0
# 		array << words[i];
# 		#print words;
# 		while j < words.length
# 			found_anagram = false;
# 			if is_anagram(words[i], words[j])
# 				#print "anagram je";
# 				found_anagram = true;
# 				array << words[j];
# 				words.delete_at(j);
# 			end
# 			if found_anagram == false
# 				j+= 1;
# 			end
# 		end
# 		#print array;
# 		words.delete(words[i]);
# 		result<<array;
# 		array = [];
# 		j = 1;
# 	end
# 	print result
# 	return result
# end 
# s = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
# combine_anagrams(s)