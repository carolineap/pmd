ArangoDB - Testes

Para executar single instance

```
arangodb --starter.mode=single

cd single_instance/

sh create.sh

```

Para executar cenários com 3 coordenadores, 3 db server e 3 agentes

```
arangodb --starter.local --starter.data-dir=./localdata

cd cluster/

sh create.sh

```


