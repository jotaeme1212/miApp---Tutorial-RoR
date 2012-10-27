# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
MiApp::Application.initialize!

# Agregados nuestros
require 'spreadsheet/excel'
