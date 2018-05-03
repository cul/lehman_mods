require 'nokogiri'

fields = Hash.new { |hash, key| hash[key] = 0 }

Nokogiri::XML(File.read('lehman_solr.xml')).css('doc').each do |doc|
  doc_fields = Hash.new { |hash, key| hash[key] = [] }
  doc.css('field').each do |field|
    doc_fields[field[:name]] << field.text
  end
  doc_fields.each do |field, values|
    fields[field] = values.length if values.length > fields[field]
  end
  if doc_fields['unitdate_iso'] == doc_fields['file_unitdate']
    puts "undated: #{doc_fields['document_id']} #{doc_fields['file_unitdate_display'].first}"
  else
    unless doc_fields['unitdate_iso'].first.start_with? doc_fields['file_unitdate'].first
      puts "date mismatch: #{doc_fields['document_id']}"
    end
  end
end

puts fields.inspect