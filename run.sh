v=v2.0.2
git ci . -m 'init'
git tag -d $v
git push origin :refs/tags/$v
git tag -a $v -m "Updated $v"
git push origin $v
