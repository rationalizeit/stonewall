# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{stonewall}
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["bokmann"]
  s.date = %q{2010-12-22}
  s.description = %q{The acl from StoneWall, now as a shiny new gem!}
  s.email = %q{dbock@codesherpas.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "design_notes.txt",
    "lib/rails/active_record.rb",
    "lib/stonewall.rb",
    "lib/stonewall/access_controller.rb",
    "lib/stonewall/access_violation_exception.rb",
    "lib/stonewall/helpers.rb",
    "lib/stonewall/parser.rb",
    "lib/stonewall/stonewall.rb",
    "lib/stonewall/user_extensions.rb",
    "test/helper.rb",
    "test/test_access_controller.rb",
    "test/test_active_record_extensions.rb",
    "test/test_guarded_class.rb",
    "test/test_guarded_collection.rb",
    "test/test_helpers.rb",
    "test/test_parser.rb",
    "test/test_stonewall.rb",
    "test/test_user_extensions.rb"
  ]
  s.homepage = %q{http://github.com/bokmann/stonewall}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{extracting the acl constructs from stonepath}
  s.test_files = [
    "test/helper.rb",
    "test/test_access_controller.rb",
    "test/test_active_record_extensions.rb",
    "test/test_guarded_class.rb",
    "test/test_guarded_collection.rb",
    "test/test_helpers.rb",
    "test/test_parser.rb",
    "test/test_stonewall.rb",
    "test/test_user_extensions.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.0.0", "< 2.4.0"])
      s.add_runtime_dependency(%q<sentient_user>, [">= 0.1.0"])
      s.add_development_dependency(%q<shoulda>, [">= 2.11.3"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.0.0", "< 2.4.0"])
      s.add_dependency(%q<sentient_user>, [">= 0.1.0"])
      s.add_dependency(%q<shoulda>, [">= 2.11.3"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.0.0", "< 2.4.0"])
    s.add_dependency(%q<sentient_user>, [">= 0.1.0"])
    s.add_dependency(%q<shoulda>, [">= 2.11.3"])
  end
end

