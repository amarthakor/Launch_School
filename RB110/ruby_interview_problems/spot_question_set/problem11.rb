=begin
Write a function that when given a URL as a string, parses out just the 
domain name and returns it as a string. 
4:10pm

For example:
domain_name("http://github.com/carbonfive/raygun") == "github"
domain_name("http://www.zombie-bites.com") == "zombie-bites"
domain_name("https://www.cnet.com") == "cnet"

Problem: Given a string, return a modified string

Rules:
1) Given string is a URL addres
2) Return string is just the domain name
  - i.e., everything between '//', 'www' and '.com' 

- Need to figure out how to deal with string that has www 
  or // or both
- Need to stop gathering chars once .com is reached

- Maybe replace every occurrence of 'http', 'https', 'www', '//', '.com', and all
    '.' because some domains dont end in '.com',  with spaces? then split string?

- Do we need to modify given string or can we create new string?

Algorithm:
- MODIFY string such that
  - REPLACE all occurrences of any substrings that are used to begin a domain name
    - replace those with a ' '
  - substrings can be 'https:', 'http:', '.', 'www', '//'
- CONVERT the string into an array
- RETURN the first element in the array
=end



def domain_name(url)
    url = url.gsub('.', ' ')
    url = url.gsub('//', ' ')
    url = url.gsub('https:', ' ')
    url = url.gsub('www', ' ')
    url = url.gsub('http:', ' ')

  url.split[0]
end



p domain_name("http://google.com") == "google"
p domain_name("http://google.co.jp") == "google"
p domain_name("www.xakep.ru") == "xakep"
p domain_name("https://youtube.com") == "youtube"
p domain_name("icann.org") == 'icann'
p domain_name("http://www.codewars.com/kata/") == 'codewars'