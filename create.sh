curl -X POST --header 'accept: application/json' --data-binary @- --dump - http://localhost:8529/_api/gharial <<EOF
{ 
  "name" : "people", 
  
  "edgeDefinitions" : [ 
    { 
      "collection" : "users_edges", 
      "from" : [ 
        "users" 
      ], 
      "to" : [ 
        "users" 
      ] 
    } 
  ], 
  "options" : { 
    "replicationFactor" : 3, 
    "numberOfShards" : 2
   } 
}
EOF


curl -X POST --header 'accept: application/json' --data-binary  '@names.json' --dump - 'http://localhost:8529/_api/import?collection=users&type=documents'



