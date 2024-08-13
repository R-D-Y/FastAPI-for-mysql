# FastAPI-for-mysql

## Provide Fastapi with 17 endpoint, and few python scripts who create the DB, create data, and inject this data on the DB

## Description de l'API

L'API que nous avons crée avec FastAPI interagit avec une base de données PostgreSQL. Elle permet d'effectuer des requêtes pour récupérer des informations suivantes:

1. **Servers**
    - `Hostname`
    - `IP`
    - `Region`
    - `Uptodate`
    - `Os`
2. **Containers**
    - `Name`
    - `IP`
    - `UP`
    - `Engine`
    - `Image`
3. **Databases**
    - `Name`
    - `Engine`
    - `Size`
    - `Uptodate`

## Stack utilisée

- **FastAPI** :  framework Python pour créer l'API.
- **psycopg2** : module Python pour la communication avec la base de données PostgreSQL.
- **uvicorn** : serveur ASGI utilisé pour exécuter l'API.
- **typing.List** : spécifier le type de retour des fonctions.
- **datetime.date** : manipuler les dates.
- **pydantic.BaseModel** : définir des modèles de données structurés.

**Ces importations sont essentielles pour le bon fonctionnement de l'API.**

## Comment se connecter à la base de données

La classe `Database` est utilisée pour gérer la connexion à la base de données PostgreSQL. Voici comment cela fonctionne :

1. La classe `Database` est instanciée avec les informations de connexion à la base de données :
    ```python
    db = Database(
        dbname="infrastructure",
        user="postgres",
        password="MyPassword", 
        host="postgres",
        port="1324" 
    )
    ```
    - `dbname` : le nom de la base de données à laquelle se connecter.
    - `user` : le nom d'utilisateur pour la connexion.
    - `password` : le mot de passe pour la connexion (à changer pour votre propre mot de passe).
    - `host` : l'adresse IP ou le nom d'hôte du serveur de la base de données.
    - `port` : le numéro de port sur lequel le serveur de la base de données écoute.

2. Lors de l'exécution de la méthode `execute_query(query)` de la classe `Database`, la connexion à la base de données est établie si elle n'existe pas déjà.
    - La méthode crée une connexion en utilisant les informations fournies lors de l'instanciation de la classe.
    - La connexion est utilisée pour exécuter la requête SQL spécifiée dans `query`.

3. La méthode `execute_query(query)` exécute la requête SQL et retourne les résultats.
    - Un objet `cursor` est créé à partir de la connexion pour exécuter la requête.
    - La méthode `execute(query)` du curseur est utilisée pour exécuter la requête SQL.
    - Les résultats de la requête sont récupérés à l'aide de la méthode `fetchall()` du curseur.
    - Le curseur est ensuite fermé à l'aide de la méthode `close()`.
    - Enfin, les résultats de la requête sont retournés.

4. Une fois que toutes les opérations sur la base de données sont terminées, il est recommandé de fermer la connexion en appelant la méthode `disconnect()` de la classe `Database`.

Il est important de noter que les informations de connexion, y compris le mot de passe, doivent être gérées avec précaution et ne doivent pas être exposées publiquement. Vous pouvez utiliser des méthodes de gestion des secrets appropriées pour sécuriser ces informations.

Assurez-vous de remplacer les valeurs `dbname`, `user`, `password`, `host` et `port` par les informations de connexion appropriées pour votre propre base de données PostgreSQL.




## Comment définir une route (`@route`)

Pour définir une route dans FastAPI, utilisez le décorateur `@app.get` suivi du chemin de l'URL et de la fonction qui gère la requête. Par exemple :

```python
@app.get("/servers", response_model=List[Server])
def get_servers():
    # Code de gestion de la requête
```
Ici, la route `/servers` est définie pour la méthode `HTTP GET` et elle appelle la fonction get_servers() pour traiter la requête.
En utilisant ce endpoint, l'API va aller chercher dans la base de donnée "Infrastructure", toutes les données de la table "servers"



## Exemple concret de l'utilisation de l'API

Analysons ensemble les endpoints suivants:

```python
@app.get("/servers", response_model=List[Server])
def get_servers():
    try:
        query = "SELECT * FROM public.servers;"
        results = db.execute_query(query)

        servers = []
        for row in results:
            server = Server(
                hostname=row[0],
                ip=row[1],
                region=row[2],
                uptodate=row[3],
                os=row[4]
            )
            servers.append(server)
        return servers
    except:
        servers = "error"


@app.get("/servers/hostname", response_model=List[str])
def get_server_hostnames():
    query = "SELECT hostname FROM public.servers;"
    results = db.execute_query(query)

    hostnames = [row[0] for row in results]
    return hostnames
```

### Récupérer tous les serveurs

La route `GET /servers` permet de récupérer tous les serveurs disponibles. Lorsque cette route est appelée, la fonction `get_servers()` est exécutée. Voici comment cela fonctionne :

1. La fonction exécute une requête SQL pour sélectionner tous les enregistrements de la table `public.servers`.
2. Les résultats de la requête sont récupérés à l'aide de `db.execute_query()`.
3. Une liste vide `servers` est créée pour stocker les objets `Server`.
4. Pour chaque ligne de résultats, un objet `Server` est créé en utilisant les valeurs des colonnes `hostname`, `ip`, `region`, `uptodate`, et `os`.
5. L'objet `Server` est ajouté à la liste `servers`.
6. La liste `servers` est renvoyée en réponse à la requête.

### Récupérer les noms d'hôte des serveurs

La route `GET /servers/hostname` permet de récupérer les noms d'hôte de tous les serveurs disponibles. La fonction `get_server_hostnames()` est exécutée lors de l'appel à cette route. Voici comment cela fonctionne :

1. La fonction exécute une requête SQL pour sélectionner la colonne `hostname` de la table `public.servers`.
2. Les résultats de la requête sont récupérés à l'aide de `db.execute_query()`.
3. Les noms d'hôte sont extraits des résultats et stockés dans une liste `hostnames`.
4. La liste `hostnames` est renvoyée en réponse à la requête.

En utilisant ces routes, vous pouvez récupérer différentes informations des serveurs. Par exemple, en appelant la route `GET /servers`, vous obtiendrez la liste complète des serveurs avec toutes leurs propriétés. En revanche, en appelant la route `GET /servers/hostname`, vous obtiendrez uniquement les noms d'hôte des serveurs.

## Réponse de l'API

### Route GET /servers

Si vous appelez la route `GET /servers` avec les données suivantes dans la base de données :

```sql
Hostname, IP, Region, Uptodate, Os
('vm_aws_501', '192.168.10.167', 'eu-west-2', '2023-05-24', 'CentOS8'),
('vm_aws_685', '192.168.10.150', 'eu-west-3', '2023-05-23', 'RHEL7'),
('vm_aws_82', '192.168.10.183', 'eu-west-2', '2023-05-23', 'Windows_server_2012'),
('vm_aws_691', '192.168.10.76', 'eu-west-2', '2023-05-29', 'RHEL7'),
('vm_aws_636', '192.168.10.173', 'eu-south-1', '2023-05-26', 'SUSE12');
```
La réponse de l'API sera une liste d'objets représentant chaque serveur avec leurs informations correspondantes :

|Objet|Hostname|IP|Region|UpToDate|OS|
|-----|--------|--|------|--------|--|
|1|`vm_aws_501`|`192.168.10.167`|`eu-west-2`|`2023-05-24`|`CentOS8`|
|2|`vm_aws_685`|`192.168.10.150`|`eu-west-3`|`2023-05-23`|`RHEL7`|
|3|`vm_aws_82`|`192.168.10.183`|`eu-west-2`|`2023-05-23`|`Windows_server_2012`|
|4|`vm_aws_691`|`192.168.10.76`|`eu-west-2`|`2023-05-29`|`RHEL7`|
|5|`vm_aws_636`|`192.168.10.173`|`eu-south-1`|`2023-05-26`|`SUSE12`|

Chaque objet représente un serveur avec ses propriétés, telles que le nom d'hôte, l'adresse IP, la région, la date de mise à jour et le système d'exploitation.

### Route GET /servers/hostname

Si vous appelez la route `GET /servers/hostname` avec les mêmes données dans la base de données, la réponse de l'API sera une liste des noms d'hôte de tous les serveurs disponibles :

- vm_aws_501
- vm_aws_685
- vm_aws_82
- vm_aws_691
- vm_aws_636

La route `GET /servers/hostname` renvoie uniquement le nom des hôtes des serveurs, sans les autres propriétés.

C'est ainsi que l'API vous fournira les informations demandées en fonction des routes appelée (databases, containers....)
Vous avez donc la possibilité d'effectuer une requête sur la totalité des serveurs et de leurs propriétés, ou bien de ciblé vos recherche sur une propriété spécifique.

## Exemple de call

Par exemple, vous pourriez parfaitement demander:

* La totalité des serveurs, avec leurs propriétés (route /servers)

* La totalité des IP qui appartiennent à des serveurs (route /servers/IP)

# Création de la base de données "Infrastructure"

Ce script SQL permet de créer la base de données "Infrastructure" sur PostgreSQL. Cette base de données est destinée à stocker des informations concernant les serveurs, les conteneurs et les bases de données utilisés dans un environnement d'infrastructure.
Il y aura donc 3 tables, faites de cette façon :

<br/><br/>

<img src="https://zupimages.net/up/23/24/kd12.png" alt="image" width="750px">
<br/><br/>

## Explication concrète 

Le script SQL va créer une base de données "Infrastructure" dans notre PostgreSQL, contenant notre schéma prédéfinit, ainsi que nos différentes tables.
Un second script sera ensuite utilisé pour générer de la data, et l'importer directement dans cette même base.

Nous avons décider de séparer la création de la base, du provisionnement de celle-ci, afin de pourvoir repartir from scratch, d'une base contenant nos tables mais vide pour être prêt à l'emploi.

## Ordre de création

Afin d'être plus précis, voici comment nous avons pensés notre script, et voici de quelle manière il s'exécutera 

1. Création de la base de données "Infrastructure" en utilisant la commande `CREATE DATABASE`.
2. Connexion à la base de données nouvellement créée en utilisant la commande `\connect`.
3. Création du schéma "public" s'il n'existe pas déjà en utilisant la commande `CREATE SCHEMA IF NOT EXISTS`.
4. Configuration des paramètres de session tels que le timeout, le codage client, etc.
5. Définition des options de table par défaut.
6. Création de la table "servers" avec les colonnes `hostname`, `ip`, `region`, `uptodate` et `os` pour stocker les informations sur les serveurs.
7. Création de la table "containers" avec les colonnes `Name`, `ip`, `up`, `engine` et `image` pour stocker les informations sur les conteneurs.
8. Création de la table "databases" avec les colonnes `name`, `engine`, `size` et `uptodate` pour stocker les informations sur les bases de données.



## Structure de la base de données

La base de données comprend les tables suivantes :

### Table "servers"
![image](https://zupimages.net/up/23/24/hjdu.png)

Cette table stocke les informations sur des serveurs utilisés dans l'infrastructure. 

- `hostname` : le nom d'hôte du serveur (type : character varying(25)).
- `ip` : l'adresse IP du serveur (type : character varying(15)).
- `region` : la région où se trouve le serveur (type : character varying(20)).
- `uptodate` : la date de la dernière mise à jour du serveur (type : date).
- `os` : le système d'exploitation du serveur (type : character varying(50)).

### Table "containers"
![image](https://zupimages.net/up/23/24/wzl3.png)

Cette table stocke des informations sur les conteneurs utilisés dans l'infrastructure.

- `Name` : le nom du conteneur (type : character varying(30)).
- `ip` : l'adresse IP du conteneur (type : character varying(15)).
- `up` : un indicateur indiquant si le conteneur est en cours d'exécution (type : boolean).
- `engine` : le moteur de conteneur utilisé (type : character varying(50)).
- `image` : l'image du conteneur (type : character varying(255)).

### Table "databases"
![image](https://zupimages.net/up/23/24/lwyz.png)

Cette table stocke des informations sur les bases de données utilisées dans l'infrastructure.

- `name` : le nom de la base de données (type : character varying(30)).
- `engine` : le moteur de base de données utilisé (type : character varying(50)).
- `size` : la taille de la base de données (type : integer).
- `uptodate` : la date de la dernière mise à jour de la base de données (type : date).




## Génération des valeurs aléatoires

Dans ce script, nous avons créer des fonctions afin de générer des valeurs aléatoires.
Ces valeurs sont utilisées pour remplir les 3 tables de la base de données "infrastructure" créer précédemment 
<br>
Les fonctions garantissent la diversité et l'aléatoire des données insérées, elles ont aussi été créer de façon a être cohérentes.

## Liste des fonctions

2. Les fonctions `generate_servers_region()`, `generate_servers_uptodate()` et `generate_servers_os()` génèrent des valeurs aléatoires pour les colonnes correspondantes de la table "servers".
3. La fonction `generate_containers_name()` génère une valeur aléatoire pour la colonne "Name" de la table "containers".
4. La fonction `generate_containers_image()` génère une valeur aléatoire pour la colonne "Image" de la table "containers".
5. La fonction `generate_databases_name()` génère une valeur aléatoire pour la colonne "Name" de la table "databases".
6. Les fonctions `generate_databases_size()` et `generate_databases_uptodate()` génèrent des valeurs aléatoires pour les colonnes correspondantes de la table "databases".


### Focus sur les différents type de fonction utilisées

Voici la reformulation des parties spécifiques en utilisant le format Markdown :

### `generate_servers_region()`

La fonction `generate_servers_region()` utilise un dictionnaire pour générer une région AWS aléatoire pour la colonne "Region" de la table "servers". Cette approche permet de définir les régions possibles de la table 'servers'. 

```python
def generate_servers_region():
    """Retourne une region AWS aleatoire pour la colonne "Region" de la table"servers" """
    
    regions = ['eu-central-1', 'eu-west-1', 'eu-west-2', 'eu-south-1', 'eu-west-3']
    return random.choice(regions)
```

La fonction utilise la méthode `random.choices()` qui permet de sélectionner aléatoirement un élément d'une liste, nous comprenons que la génération n'est pas aléatoire dans sa création, mais dans un choix spécifique, nous ne créons pas  de région, mais nous demandons à en choisir parmi une sélection.

### `generate_containers_name()`

La fonction `generate_containers_name()` utilise la fonction `random.randint()` pour générer un nom aléatoire pour la colonne "Name" de la table "containers". Le nom est généré en utilisant un format spécifique avec un nombre aléatoire compris entre 1 et 1000, puis utilise un F-string afin de rentrer nos données aléatoire à la suite d'un nom fixe.

```python
def generate_containers_name():
    name = f'DCK{random.randint(1, 1000):02d}'
    return name
```

Le nombre généré aléatoirement est formatté avec deux chiffres à l'aide de ':02d' qui oblige a n'utiliser que 2 décimal et de remplir par des 0, cela qui garantit une longueur fixe du nom. Par exemple, le nom peut être "DCK001" ou "DCK789". Cette approche permet de générer des noms uniques et facilement identifiables pour les conteneurs.

### `generate_databases_uptodate()`

La fonction `generate_databases_uptodate()` génère une valeur aléatoire pour la colonne "Uptodate" de la table "databases". La valeur représente une date aléatoire située entre deux dates prédéfinies.

```python
def generate_databases_uptodate():
    start_date = date(2023, 5, 20)
    end_date = date(2023, 5, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return random_date.strftime('%Y-%m-%d')
```

Notre fonction utilise la bibliothèque `datetime` pour manipuler les dates. Elle génère une date aléatoire en ajoutant un nombre de jours aléatoire entre la date de début et la date de fin. Ensuite, la date est formatée au format 'AAAA-MM-JJ'. Cela permet de générer des dates aléatoires dans une plage spécifique, ce qui est utile pour simuler des mises à jour de bases de données à différentes périodes, nous avons choisi de mettre des dates proche de nos jours afin de rester dans une certaine logique.

### Nous avons pu constater ci-dessus que chacune de ces fonctions utile des techniques différentes afin de générer des données aléatoire, que ce soit de choisir dans une liste, de choisir des nombres aléatoires, ou bien pour prendre des dates dans une plage spécifique.


## Boucle `for` et requêtes d'insertion
à cette étape, nous avons donc créer des fonctions permettant de générer des données de façon aléatoire et cohérente, ici, nous allons voir comment ces données générées, vont servir de **QUERY sql** afin qu'elles puissent être directement injecté dans notre base de donnée.

Notre script utilise donc maintenant une boucle `for` pour générer les requêtes d'insertion pour chaque ligne de chaque table de la BDD infrastructures. Les valeurs aléatoires générées par les fonctions sont utilisées pour construire les requêtes d'insertion.



```python
server_values = (
    f"vm_aws_{random.randint(1, 1000)}",
    f"192.168.10.{random.randint(1, 200)}",
    generate_servers_region(),
    generate_servers_uptodate(),
    generate_servers_os()
)
insert_queries.append(f"INSERT INTO public.servers (hostname, ip, region, uptodate, os) VALUES {server_values};")
```

Ici, `server_values = ()` génère des valeurs aléatoires pour chaque colonne de la table "servers". Par exemple, la colonne "hostname" sera une chaîne de caractères de la forme "vm_aws_" suivie d'un nombre aléatoire entre 1 et 1000 généré par random.randint(1, 1000). De même, les autres colonnes comme "ip" qui aura une base de 192.168.10.x (x étant compris entre 1 et 200), "region" (choix parmi une liste), "uptodate"(choix dans une plage) et "os" (choix parmi une liste) seront également remplies avec des valeurs aléatoires générées par les fonctions correspondantes.
**Ce même type de requête est utilisé pour les tables "containers" et "databases" afin de pouvoir aussi générer des jeux de données.

Les requêtes d'insertion sont ensuite ajoutées à la liste nommé insert_queries.
Cette liste contiendra toutes les requêtes d'insertion générées pour les tables "servers", "containers" et "databases" et permettrons de provisionné notre base de donnée "Infrastructure"

## Concaténation et écriture du contenu

Une fois que toutes les requêtes d'insertion ont été générées, le script ouvre le fichier "db_tables.sql" en lecture et lit son contenu. 
<br> Ensuite, les requêtes d'insertion sont concaténées avec le contenu du fichier pour former le script d'initialisation complet.

```python
# Ouvre le fichier db_tables.sql en lecture
with open('db_tables.sql', 'r') as file:
    db_tables_sql = file.read()
```

Enfin, le contenu final, comprenant le contenu initial du fichier "db_tables.sql" et les requêtes d'insertion tout juste créer, est écrit dans le fichier "init.sql". Ce fichier sera utilisé ultérieurement pour initialiser la base de données avec des données aléatoires directement injecté dans cette dernière.

```python
# Concatener le contenu du fichier db_tables.sql avec les requetes creer 
init_sql = db_tables_sql + "\n" + "\n".join(insert_queries)

# Ecrire le contenu dans le fichier init.sql
with open('init.sql', 'w') as file:
    file.write(init_sql)
```

Toutes ces étapes permettent de créer un fichier final "init.sql" qui contient les instructions SQL nécessaires pour créer notre base de donnée "infrastructure" avec son schéma et ses tables puis de provisionner ces tables avec des données aléatoires.
