
update rbenv versions : 

```bash
cd ~/.vim/bundle/Command-T/ruby/command-t
git pull origin master
rbenv install --list
```

note the versions of ruby listed don't necessarily show the patch numbers D:

rebuild command-t

```bash
cd ~/.vim/bundle/Command-T/ruby/command-t
make clean
ruby extconf.rb
make
```

