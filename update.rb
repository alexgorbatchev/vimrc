#!/usr/bin/env ruby

git_bundles = [ 
  # [ "git://github.com/astashov/vim-ruby-debugger.git" , :plugin ],
  # [ "git://github.com/tpope/vim-cucumber.git"         , :syntax ],
  [ "git://github.com/msanders/snipmate.vim.git"        , :plugin ],
  [ "git://github.com/timcharper/textile.vim.git"       , :syntax ],
  [ "git://github.com/vim-scripts/fugitive.vim.git"     , :plugin ],
  # [ "git://github.com/tpope/vim-git.git"              , :plugin ],
  # [ "git://github.com/motemen/git-vim.git"            , :plugin ],
  [ "git://github.com/tpope/vim-haml.git"               , :syntax ],
  [ "git://github.com/tpope/vim-markdown.git"           , :syntax ],
  # [ "git://github.com/tpope/vim-rails.git"            , :plugin ],
  [ "git://github.com/tpope/vim-repeat.git"             , :plugin ],
  [ "git://github.com/tpope/vim-surround.git"           , :plugin ],
  [ "git://github.com/tpope/vim-vividchalk.git"         , :colors ],
  [ "git://github.com/nelstrom/vim-blackboard.git"      , :colors ],
  [ "git://github.com/godlygeek/tabular.git"            , :plugin ],
  [ "git://github.com/tsaleh/vim-shoulda.git"           , :plugin ],
  [ "git://github.com/tsaleh/vim-supertab.git"          , :plugin ],
  [ "git://github.com/tsaleh/vim-tcomment.git"          , :plugin ],
  [ "git://github.com/vim-ruby/vim-ruby.git"            , :syntax ],
  # [ "git://github.com/sjbach/lusty.git"               , :plugin ],
  [ "git://github.com/rson/vim-conque.git"              , :plugin ],
  [ "git://github.com/vim-scripts/YankRing.vim.git"     , :plugin ],
  [ "git://github.com/vim-scripts/Flex-4.git"           , :syntax ],
  [ "git://github.com/kchmck/vim-coffee-script.git"     , :syntax ],
  [ "git://github.com/wavded/vim-stylus.git"            , :syntax ],
  [ "git://github.com/statianzo/vim-jade.git"           , :syntax ],
]

vim_org_scripts = [
  [ "indexedsearch", "7062",   :plugin ],
  [ "l9",            "13948",  :plugin, :zip ],
  [ "fuzzyfinder",   "13961",  :plugin, :zip ],
  [ "jquery",        "12107",  :syntax ],
  [ "javascript",    "10728",  :syntax ],
  [ "actionscript",  "10123",  :syntax ],
  [ "molokai",       "9750",   :colors ],
  [ "zenburn",       "14110",  :colors ],
]

require 'fileutils'
require 'open-uri'

bundles_dir = File.join(File.dirname(__FILE__), "bundle")

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)"
Dir["*"].each {|d| FileUtils.rm_rf d }

git_bundles.each do |url, script_type|
  dir = "#{script_type}-#{url.split('/').last.gsub(/(^vim-)|(-vim)|(\.vim)|(\.git$)/, '')}"
  puts "  Unpacking #{url} into #{dir}"
  `git clone #{url} #{dir}`
  FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type, *actions|
  dirname = "#{script_type}-#{name}"
  is_zip = actions.include?(:zip)
  is_vimball = actions.include?(:vimball)

  local_file = if is_zip or is_vimball
    File.join(dirname, name + (is_vimball ? ".vba" : ".zip"))
  else
    File.join(dirname, script_type.to_s, "#{name}.vim")
  end
 
  puts "  Downloading #{name}"

  FileUtils.mkdir_p(File.dirname(local_file))
  File.open(local_file, "w") do |file|
    file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
  end
  
  if is_zip 
    puts "  Unzipping #{local_file}"
    `unzip "#{local_file}" -d "#{File.dirname(local_file)}"`
    `rm #{local_file}`
  end

  # if is_vimball
    # puts "  VimBall #{local_file}"
    # `vim -c 'so %' -c 'q' #{local_file}`
    # # `rm #{local_file}`
  # end
end

