#!/usr/bin/env ruby

git_bundles = [ 
  # TagBar
  [ "git://github.com/majutsushi/tagbar", :plugin ],

  # NERD tree and plugin to help with tabs
  [ "git://github.com/jistr/vim-nerdtree-tabs.git" , :plugin ],
  [ "git://github.com/scrooloose/nerdtree.git"     , :plugin ],

  # [ "git://github.com/astashov/vim-ruby-debugger.git"  , :plugin ],
  # [ "git://github.com/tpope/vim-git.git"               , :plugin ],
  # [ "git://github.com/motemen/git-vim.git"             , :plugin ],
  # [ "git://github.com/tpope/vim-rails.git"             , :plugin ],
  
  # neocomplcache performs keyword completion by making a cache of keyword in
  # buffer. Because I implemented it by paying own expenses unlike the keyword
  # completion including the Vim composing type, neocomplcache can be customized
  # flexibly. Unfortunately neocomplcache may use more memory than other
  # plugins.
  # [ "git://github.com/Shougo/neocomplcache.git" , :plugin ],

  # snipMate.vim aims to be a concise vim script that implements some of 
  # TextMate's snippets features in Vim (with dependencies).
  [ "git://github.com/garbas/vim-snipmate.git"          , :plugin ],
  [ "git://github.com/MarcWeber/vim-addon-mw-utils.git" , :plugin ],
  [ "git://github.com/tomtom/tlib_vim.git"              , :plugin ],

  # I'm not going to lie to you; fugitive.vim may very well be the best Git
  # wrapper of all time. Check out these features:
  #
  # View any blob, tree, commit, or tag in the repository with :Gedit (and 
  # :Gsplit, :Gvsplit, :Gtabedit, ...). Edit a file in the index and write
  # to it to stage the changes. Use :Gdiff to bring up the staged version 
  # of the file side by side with the working tree version and use Vim's 
  # diff handling capabilities to stage a subset of the file's changes.
  [ "git://github.com/tpope/vim-fugitive.git" , :plugin ],

  # you've ever tried using the "." command after a plugin map you were likely 
  # disappointed to discover it only repeated the last native command inside 
  # that app, rather than the map as a whole.  That disappointment ends today.  
  # Repeat.vim remaps "." in a way that plugins can tap into it. 
  #
  # Support is already present in the following plugins: 
  #
  # surround.vim (vimscript #1697) 
  # speeddating.vim (vimscript #2120) 
  # abolish.vim (vimscript #1545) 
  # unimpaired.vim (vimscript #1590) 
  [ "git://github.com/tpope/vim-repeat.git" , :plugin ],

  # This plugin is a tool for dealing with pairs of "surroundings."  Examples
  # of surroundings include parentheses, quotes, and HTML tags.  They are
  # closely related to what Vim refers to as |text-objects|.  Provided
  # are mappings to allow for removing, changing, and adding surroundings.
  [ "git://github.com/tpope/vim-surround.git" , :plugin ],

  # Sometimes, it's useful to line up text.  Naturally, it's nicer to have the
  # computer do this for you, since aligning things by hand quickly becomes
  # unpleasant.  While there are other plugins for aligning text, the ones I've
  # tried are either impossibly difficult to understand and use, or too simplistic
  # to handle complicated tasks.  This plugin aims to make the easy things easy
  # and the hard things possible, without providing an unnecessarily obtuse
  # interface.  It's still a work in progress, and criticisms are welcome.
  [ "git://github.com/godlygeek/tabular.git" , :plugin ],

  # Supertab aims to provide tab completion to satisfy all your insert completion 
  # needs (:help ins-completion).
  [ "git://github.com/ervandew/supertab.git" , :plugin ],

  # Shows marks
  [ "git://github.com/garbas/vim-showmarks.git", :plugin ],

  [ "git://github.com/vim-scripts/tComment.git"          , :plugin ],
  # [ "git://github.com/sjbach/lusty.git"                , :plugin ],
  [ "git://github.com/vim-scripts/YankRing.vim.git"      , :plugin ],
  [ "git://github.com/vim-scripts/FuzzyFinder.git"       , :plugin ],
  [ "git://github.com/vim-scripts/JavaScript-Indent.git" , :plugin ],

  # This plugin redefines 6 search commands (/,?,n,N,*,#). At every
  # search command, it automatically prints
  #        "At match #N out of M matches".
  # -- the total number of matches (M) and the number(index) of current
  # match (N). This helps to get oriented when searching forward and
  # backward.
  [ "git://github.com/vim-scripts/IndexedSearch.git", :plugin ],

  # l9 is a Vim-script library, which provides some utility functions and commands
  # for programming in Vim.
  [ "git://github.com/vim-scripts/L9.git" , :plugin ],

  [ "git://github.com/jgdavey/vim-railscasts.git" , :colors ],

  [ "git://github.com/timcharper/textile.vim.git"               , :syntax ],
  [ "git://github.com/tpope/vim-cucumber.git"                   , :syntax ],
  [ "git://github.com/tpope/vim-haml.git"                       , :syntax ],
  [ "git://github.com/tpope/vim-markdown.git"                   , :syntax ],
  [ "git://github.com/vim-ruby/vim-ruby.git"                    , :syntax ],
  [ "git://github.com/vim-scripts/Flex-4.git"                   , :syntax ],
  [ "git://github.com/kchmck/vim-coffee-script.git"             , :syntax ],
  [ "git://github.com/wavded/vim-stylus.git"                    , :syntax ],
  [ "git://github.com/statianzo/vim-jade.git"                   , :syntax ],
  [ "git://github.com/vim-scripts/actionscript.vim--Leider.git" , :syntax ],
  [ "git://github.com/othree/javascript-syntax.vim.git"         , :syntax ],
  [ "git://github.com/vim-scripts/jQuery.git"                   , :syntax ],
]

vim_org_scripts = [
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

