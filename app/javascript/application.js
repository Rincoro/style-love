// Entry point for the build script in your package.json
//= require jquery
//= require @nathanvda/cocoon
//= require ./src/cocoon
//= require ./src/preview
import './cocoon'
import './preview'
import "@hotwired/turbo-rails"
import "./controllers"