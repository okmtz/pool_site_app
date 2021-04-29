# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "world-flags"
  s.version = "0.6.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Kristian Mandrup"]
  s.date = "2014-04-16"
  s.description = "Use world flag icons in your Rails app"
  s.email = "kmandrup@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "config/countries/locale_countries.en.json",
    "config/languages/locale_languages.en.json",
    "config/locale_map/locale_to_country_code.json",
    "db/GeoIP.dat",
    "lib/generators/world_flags/GeoIP.dat",
    "lib/generators/world_flags/geoip_generator.rb",
    "lib/generators/world_flags/init_generator.rb",
    "lib/generators/world_flags/publicize_generator.rb",
    "lib/generators/world_flags/templates/world_flags.erb",
    "lib/world-flags.rb",
    "lib/world_flags/core_ext.rb",
    "lib/world_flags/countries.rb",
    "lib/world_flags/helper/all.rb",
    "lib/world_flags/helper/browser.rb",
    "lib/world_flags/helper/geo.rb",
    "lib/world_flags/helper/locale.rb",
    "lib/world_flags/helper/view.rb",
    "lib/world_flags/helper/view/util.rb",
    "lib/world_flags/helpers.rb",
    "lib/world_flags/languages.rb",
    "lib/world_flags/rack_locale.rb",
    "lib/world_flags/rails/engine.rb",
    "lib/world_flags/tools/resize_css.rb",
    "lib/world_flags/util.rb",
    "lib/world_flags/util/config.rb",
    "lib/world_flags/util/country.rb",
    "lib/world_flags/util/language.rb",
    "lib/world_flags/util/name_enabler.rb",
    "sandbox/country_codes_table.html",
    "sandbox/extract_codes.rb",
    "sandbox/languages_country_extract.rb",
    "sandbox/languages_table.txt",
    "sandbox/official_languages.html",
    "sandbox/official_languages.txt",
    "spec/data/GeoIP.dat",
    "spec/spec_helper.rb",
    "spec/world_flags/config_spec.rb",
    "spec/world_flags/country_spec.rb",
    "spec/world_flags/helper/locale_spec.rb",
    "spec/world_flags/helper/util_spec.rb",
    "spec/world_flags/helper/view_spec.rb",
    "spec/world_flags/json/json_countries_spec.rb",
    "spec/world_flags/json/json_languages_spec.rb",
    "spec/world_flags/json/locale_flag_spec.rb",
    "spec/world_flags/language_spec.rb",
    "app/assets/images/flags/flags16.png",
    "app/assets/images/flags/flags16_semi.png",
    "app/assets/images/flags/flags24.png",
    "app/assets/images/flags/flags24_semi.png",
    "app/assets/images/flags/flags32.png",
    "app/assets/images/flags/flags32_semi.png",
    "app/assets/images/flags/flags48.png",
    "app/assets/images/flags/flags48_semi.png",
    "app/assets/images/flags/flags64.png",
    "app/assets/images/flags/flags64_semi.png",
    "app/assets/javascripts/world_flags/url_helper.js",
    "app/assets/stylesheets/flags/basic.css",
    "app/assets/stylesheets/flags/basic.scss.css",
    "app/assets/stylesheets/flags/flags16.css.erb",
    "app/assets/stylesheets/flags/flags16.css.scss.erb",
    "app/assets/stylesheets/flags/flags24.css.erb",
    "app/assets/stylesheets/flags/flags24.css.scss.erb",
    "app/assets/stylesheets/flags/flags32.css.erb",
    "app/assets/stylesheets/flags/flags32.css.scss.erb",
    "app/assets/stylesheets/flags/flags48.css.erb",
    "app/assets/stylesheets/flags/flags48.css.scss.erb",
    "app/assets/stylesheets/flags/flags64.css.scss.erb",
    "world-flags.gemspec"
  ]
  s.homepage = "http://github.com/kristianmandrup/world-flags"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.0"
  s.summary = "World flags as sprites"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hashie>, [">= 1.2"])
      s.add_runtime_dependency(%q<i18n>, [">= 0.6"])
      s.add_development_dependency(%q<rspec>, [">= 2.8.0"])
      s.add_development_dependency(%q<rdoc>, [">= 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_development_dependency(%q<simplecov>, [">= 0.5"])
    else
      s.add_dependency(%q<hashie>, [">= 1.2"])
      s.add_dependency(%q<i18n>, [">= 0.6"])
      s.add_dependency(%q<rspec>, [">= 2.8.0"])
      s.add_dependency(%q<rdoc>, [">= 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.1.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.3"])
      s.add_dependency(%q<simplecov>, [">= 0.5"])
    end
  else
    s.add_dependency(%q<hashie>, [">= 1.2"])
    s.add_dependency(%q<i18n>, [">= 0.6"])
    s.add_dependency(%q<rspec>, [">= 2.8.0"])
    s.add_dependency(%q<rdoc>, [">= 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.1.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.3"])
    s.add_dependency(%q<simplecov>, [">= 0.5"])
  end
end
