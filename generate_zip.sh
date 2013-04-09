curl localhost:3000 |
  sed -e 's/\/music/public\/music/g' \
      -e 's/\/javascripts/\/public\/javascripts/g' \
      -e 's/\/stylesheetss/\/public\/stylesheetss/g' > index.html

rm express.zip
ln -s . express
zip express.zip express/index.html $(find express/public | grep -v wav)

rm index.html
rm express
