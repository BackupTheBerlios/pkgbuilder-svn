oldversion=3.3.2
newversion=3.4.0

for d in `find -type d -name 'kde*' -maxdepth 1` ; do 
    pkgname=`basename $d`
    oldfile=$pkgname/$pkgname-$oldversion.build
    if [ -f $oldfile ] ; then
        svn copy $oldfile $pkgname/$pkgname-$newversion.build 
    fi
done
