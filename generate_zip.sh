#!/bin/bash

echo make sure the server is running on port 3000

node_modules/.bin/stylus public/stylesheets
node_modules/.bin/coffee -c public/javascripts

curl localhost:3000 |
  sed -e 's/\/music/.\/public\/music/g' \
      -e 's/\/javascripts/.\/public\/javascripts/g' \
      -e 's/\/stylesheets/.\/public\/stylesheets/g' > index.html

rm express.zip
ln -s . express
zip express.zip express/index.html $(find express/public | grep -v wav)

rm index.html
rm express
