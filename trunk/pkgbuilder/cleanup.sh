
for i in `find -type f -name '*.build'` ; do
    echo "cleanup $i file"
    sed -i -e '/^# \$Header:.*/d' $i
done