# The following list contains the names of individuals 
# who are pioneers in the field of computing or that 
# have had a significant influence on the field. The 
# names are in an encrypted form, though, using a 
# simple (and incredibly weak) form of encryption 
# called Rot13.

# Need to add 13 to each index to get correct letter
# if current letter index is greater than 13, subtract 13
# from index and return the element at correspomding idx

# Write a program that deciphers and prints each of these names .

ALPHABET = ('a'..'z').to_a

def decrypter(name)
  name = name.downcase.split
  
  name.map do |half_name|
    half_name.chars.map do |letter|
      if !ALPHABET.include?(letter)
        letter
      else
        idx = ALPHABET.index(letter)
        idx <= 12 ? ALPHABET[idx + 13] : ALPHABET[idx - 13]
      end
    end.join.capitalize
  end.join(' ')
end

puts decrypter "Nqn Ybirynpr"
puts decrypter "Tenpr Ubccre"
puts decrypter "Nqryr Tbyqfgvar"
puts decrypter "Nyna Ghevat"
puts decrypter "Puneyrf Onoontr"
puts decrypter "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv"
puts decrypter "Wbua Ngnanfbss"
puts decrypter "Ybvf Unvog"
puts decrypter "Pynhqr Funaaba"
puts decrypter "Fgrir Wbof"
puts decrypter "Ovyy Tngrf"
puts decrypter "Gvz Orearef-Yrr"
puts decrypter "Fgrir Jbmavnx"
puts decrypter "Xbaenq Mhfr"
puts decrypter "Fve Nagbal Ubner"
puts decrypter "Zneiva Zvafxl"
puts decrypter "Lhxvuveb Zngfhzbgb"
puts decrypter "Unllvz Fybavzfxv"
puts decrypter "Tregehqr Oynapu"