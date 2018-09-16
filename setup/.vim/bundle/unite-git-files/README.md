# unite-git-files

Unite sources which gather candidates from your git repository.  
This is forked from [yuku-t/unite-git](https://github.com/yuku-t/unite-git)

## git\_files

Fork of git\_cached. It invokes `git ls-files`.  
  
If you are not in git repository, this source fallbacks to `find . -type f`.
This is the feature which is different from git\_cached.

```
:Unite git_files
```

# Licence

MIT License
