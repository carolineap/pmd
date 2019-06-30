rm -rf dump
mkdir dump
cd dump/

wget https://github.com/arangodb/example-datasets/raw/master/Graphs/IMDB/dump/imdb_edges.data.json
wget https://raw.githubusercontent.com/arangodb/example-datasets/master/Graphs/IMDB/dump/imdb_edges.structure.json
wget https://github.com/arangodb/example-datasets/raw/master/Graphs/IMDB/dump/imdb_vertices.data.json
wget https://raw.githubusercontent.com/arangodb/example-datasets/master/Graphs/IMDB/dump/imdb_vertices.structure.json

cd ../

curl -X POST --header 'accept: application/json' --data-binary @- --dump - http://localhost:8529/_api/gharial <<EOF
{
  "name" : "imdb",

  "edgeDefinitions" : [
    {
      "collection" : "imdb_edges",
      "from" : [
        "imdb_vertices"
      ],
      "to" : [
        "imdb_vertices"
      ]
    }
  ],
  "options" : {
    "replicationFactor" : 3,
    "numberOfShards" : 2
   }
}
EOF
START=`date +%s`
echo "Starting restore..."
arangorestore --server.password '' dump
END=`date +%s`
echo "Restore took: $((END - START)) seconds"


