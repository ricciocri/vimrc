vimrc
=====

This is my vim configuration to work with Git + Puppet manifests, mostly it's based on some good articles about this that I found online:

1. [Using vim and Debian to do puppet development](https://labs.riseup.net/code/documents/8)
2. [Puppet editing like a pro ](http://jedi.be/blog/2011/12/05/puppet-editing-like-a-pro/)
3. [Using Vim to edit Puppet code](http://crimsonfu.github.io/2012/08/22/vimpuppet.html)

Using this repository you'll enable the following plugins:

- **pathogen**  Makes it super easy to install plugins and runtime files in their own private directories.
- **snipmate.vim** snipMate.vim aims to be an unobtrusive, concise vim script that implements some of TextMate's snippets features in Vim.
- **syntastic** Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any resulting errors to the user. This can be done on demand, or automatically as files are saved. If syntax errors are detected, the user is notified and is happy because they didn't have to compile their code or execute their script to find them.
- **tabular** Sometimes, it's useful to line up text. Naturally, it's nicer to have the computer do this for you, since aligning things by hand quickly becomes unpleasant.
- **vim-puppet** Make vim more Puppet friendly!
- **vim-fugitive** Provides an amazingly deep Git integration for vim.
- **vim-markdown** Syntax highlighting, matching rules and mappings for Markdown

Also you'll find a snippets directory with a custom list of [snippet for Puppet](https://github.com/ricciocri/vimrc/blob/master/snippets/puppet.snippets).

Installation
---

The easiest way it's to clone this repository into your .vim directory (make a backup first if you have something in it).

    git clone https://github.com/ricciocri/vimrc .vim

You should see an output similar to this one:

    Cloning into '.vim'...
    remote: Counting objects: 17, done.
    remote: Compressing objects: 100% (15/15), done.
    remote: Total 17 (delta 1), reused 13 (delta 1)
    Unpacking objects: 100% (17/17), done.

### Install the submodule

Move into the new .vim directory and run this command:

    git pull && git submodule init && git submodule update && git submodule status


This will pull all the submodules used in this bundle.

### vimrc file

Inside the repository there is also the .vimrc file that you have to link in your $HOME, to do this just run the following commands in the terminal

    cd
    ln -s .vim/.vimrc .


Longer Description of the plugin used:
---

This is a longer list of the plugin used in this bundle:

### [Pathogen](https://github.com/tpope/vim-pathogen)

Manage your 'runtimepath' with ease.  In practical terms, pathogen.vim makes it super easy to install plugins and runtime files in their own private directories. 
Pathogen is written by Vim plugin guru Tim Pope, it lets you isolate plugin scripts under their own directories. This means easy installs, uninistalls and upgrades.

So in short with this plugin you just have to install it in the "traditional way" and add this line in the *.vimrc* file

        execute pathogen#infect()

Now any plugins you wish to install can be extracted to a subdirectory under *~/.vim/bundle*, and they will be added to the 'runtimepath'.

### [syntastic](https://github.com/scrooloose/syntastic.git)

Syntastic is a syntax checking plugin that runs files through external syntax checkers and displays any resulting errors to the user. This can be done on demand, or automatically as files are saved. If syntax errors are detected, the user is notified and is happy because they didn't have to compile their code or execute their script to find them.

For puppet Syntastic can run both the command `puppet parser validate` for syntax errors and the command `puppet-lint` that will analyze your manifests and look for deviatins from the Puppet style guide, please note that both command must be present on the machine and available in your path, once you save the file you'll get a screen similar to this if there are some errors:

![syntastic error](http://linuxaria.com/wp-content/uploads/2013/12/syntastic.png "Syntastic screenshot")

Also both checkers are enabled in this configuration, if you want to disable the parser or puppet-lint just edit your .vimrc file and check for that commented directive:

        "To enable Just puppet-lint and disable the parser uncomment next line
        "let g:syntastic_puppet_checkers=['puppetlint']

Uncommenting it will disable the parser, if you want to disable puppet-lint substitute ['puppet'] to ['puppetlint'].

### [vim-puppet](https://github.com/rodjek/vim-puppet.git)

Make vim more Puppet friendly! This plugin provide the following features:

- Formatting based on the latest Puppetlabs Style Guide
- Syntax highlighting
- Automatic => alignment (when the tabular plugin is also installed)

### [tabular](https://github.com/godlygeek/tabular.git)

This plugin it's great to have an automatic alignment of all your => and can be really useful also in other situations, check this [short video](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/) for an introduction to tabular plugin.


### [snipmate.vim](https://github.com/msanders/snipmate.vim.git)

This plugin it's probably my favourite in this bundle, with it you can just type the name of a puppet resource such as file, press the  `tab` key and get you'll get a result like this:


file {
    "filename":
      ensure => "file",
      source => "puppet:///source",
      owner  => "root",
      group  => "root",
      mode   => '0755';

Pressing `tab` again you'll move through the various *stop point* that are defined in the snippet, usually they are the values for the various keys. 
You can manage the snippets editing them directly, they are located in the file ~/.vim/snippets/puppet.snippets

A video it's probably the best way to see this small plugin in action, so check this [small video](http://www.screenr.com/su7), when you see the code appear it means that the operator has pressed the `tab` key.

### [vim-fugitive](https://github.com/tpope/vim-fugitive.git)

Another great plugin, with this you can control directly from vim the status of the file you are editing in git, basically you can give in vim some `Gcommand` and work directly on git, some example are:

- `:Gstatus` that bring up the output of `git status`
- `:Gblame`  brings up an interactive vertical split with `git blame` output. Press enter on a line to edit the commit where the line changed, or o to open it in a split. When you're done, use `:Gedit` in the historic buffer to go back to the work tree version.
- `:Gmove` does a `git mv` on a file and simultaneously renames the buffer.
- `:Gremove` does a `git rm` on a file and simultaneously deletes the buffer.
- `:Gread` is a variant of `git checkout --` filename that operates on the buffer rather than the filename. This means you can use *u* to undo it and you never get any warnings about the file changing outside Vim.
- `:Gwrite` writes to both the work tree and index versions of a file, making it like git add when called from a work tree file and like git checkout when called from the index or a blob in history.

If you are interested I suggest to watch this small video to get an idea of the potential of this great plugin: [Fugitive.vim - a complement to command line git](http://vimcasts.org/episodes/fugitive-vim---a-complement-to-command-line-git/)

### [vim-markdown](https://github.com/plasticboy/vim-markdown)

Syntax highlighting, matching rules and mappings for [Markdown](https://github.com/plasticboy/vim-markdown).

*Options*

Disable Folding

Add the following line to your .vimrc to disable folding.

`let g:vim_markdown_folding_disabled=1`
Set Initial Foldlevel

Add the following line to your .vimrc to set the initial foldlevel. This option defaults to 0 (i.e. all folds are closed) and is ignored if folding is disabled.

`let g:vim_markdown_initial_foldlevel=1`

git submodule
---

This project use `git submodule`, to track some of the vim plugin I used:

- [snipmate.vim](https://github.com/msanders/snipmate.vim.git)
- [syntastic](https://github.com/scrooloose/syntastic.git)
- [tabular](https://github.com/godlygeek/tabular.git)
- [vim-puppet](https://github.com/rodjek/vim-puppet.git)
- [vim-fugitive](https://github.com/tpope/vim-fugitive.git)
- [vim-markdown](https://github.com/plasticboy/vim-markdown)
