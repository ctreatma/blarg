SETTINGS = YAML::load(ERB.new(IO.read(File.join(Rails.root, 'config', 'settings.yml'))).result)
