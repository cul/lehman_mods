assets = []

map = {}
open('leh_map.txt') do |f|
	f.each do |l|
		l.strip!
		p = l.split(',')
		map[p[1]] = p[0]
	end
end

open('asset-manifest.txt') do |f|
	f.each do |l|
		l.strip!
		assets << l unless map.delete(l)
	end
end

open('unloaded.txt', 'w') do |f|
	assets.each {|x| f.print("#{x}\n")}
end
