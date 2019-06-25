rm -rf dump
mkdir dump
cd dump/

wget https://github.com/arangodb/example-datasets/raw/master/Graphs/IMDB/dump/imdb_edges.data.json
wget https://raw.githubusercontent.com/arangodb/example-datasets/master/Graphs/IMDB/dump/imdb_edges.structure.json
wget https://github.com/arangodb/example-datasets/raw/master/Graphs/IMDB/dump/imdb_vertices.data.json
wget https://raw.githubusercontent.com/arangodb/example-datasets/master/Graphs/IMDB/dump/imdb_vertices.structure.json

cd ../

arangosh --server.password '' --quiet <<EOF
  var db = require('@arangodb').db;
  var gm = require('@arangodb/general-graph');
  db._drop('imdb_vertices');
  db._drop('imdb_edges');
  try {
    // db._graphs.remove('imdb');
    gm._drop('imdb', true);
  } catch (err) {}
  var g = gm._create('imdb');
  g._addVertexCollection('imdb_vertices');
  var rel = gm._relation('imdb_edges', 'imdb_vertices', 'imdb_vertices')
  g._extendEdgeDefinitions(rel);
EOF
START=`date +%s`
echo "Starting restore..."
arangorestore --server.password '' dump
END=`date +%s`
echo "Restore took: $((END - START)) seconds"

