sql = File.read('isucon8q-initial-dataset.sql')

sql.gsub!('(id, nickname, login_name, pass_hash) VALUES', '(id, nickname, login_name, pass_hash, password) VALUES')
sql.gsub!(/\(\d+,[^,]+, "(?<name>[^",]+)", "[^",]{64}"\)/) do |str|
  name = Regexp.last_match[:name]
  password = "#{name}#{name.reverse}"

  str.sub(/\)\z/, ", \"#{password}\")")
end

File.write('isucon8q-initial-dataset-password.sql', sql)
