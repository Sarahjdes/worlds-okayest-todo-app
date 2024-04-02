# World's Okayest Todo App

This is a perpetual WIP to get acquainted with Rails

## Installation

```
bundle install
rails db:migrate
./bin/dev
```

## Liste de choses que je peux faire :
- Créer un contrôleur et lui ajouter actions pour la majorité des routes de base (todos#index, todos#create, todos#new, todos#edit, todos#show, todos#update et todos#destroy)
- Créer un modèle et ses règles de validation
- Créer une nouvelle migration : ajouter une colonne, modifier le nom d'une colonne, changer le type d'une colonne
- Utiliser un partial (_form, soit mon formulaire qui se trouve sur les pages new et edit)
- Écrire des tests de validations pour des requêtes, pour des views, des features, des scenarios, un shared_example (pour tester mon formulaire qui se trouve sur deux pages) et un modèle à l'aide de RSpec & Capybara, et en utilisant FactoryBot pour créer des instances de mon modèle
- Linting fait avec Rubocop

## Prochaines étapes
- Permettre de cocher les tâches à l'aide d'un formulaire contenant des checkbox, changeant une valeur tel que "done" à l'aide d'une route et d'une action dédiées