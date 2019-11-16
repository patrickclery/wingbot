class ExportRawData

  # @return String filename created
  def self.call
    # Default to /tmp/tinder_export_2019-11-15
    path     ||= File.join(Rails.root, '/tmp')
    file_location = "#{path}/tinder_export-#{sprintf(Time.now.strftime("%Y-%m-%d"))}.json"

    File.open(file_location, "w") do |f|
      f.puts(RawData.all.map(&:to_json))
    end
    file_location
  end

end
