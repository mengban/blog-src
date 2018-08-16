
xcopy hexo\* myrepo\blog-src /s
cd myrepo\blog-src
git add -A
git commit -m "add by onekey_bat"
git push
pause