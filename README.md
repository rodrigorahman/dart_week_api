# dart_week_api

## Script para inserir as categorias no banco de dados

```
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (1, 'Salário', 'receita');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (2, 'Investimento', 'receita');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (3, 'Aplicação', 'receita');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (4, 'Contas Residenciais', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (5, 'Educação', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (6, 'Mercado', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (7, 'Moradia', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (8, 'Saúde', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (9, 'Transporte', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (10, 'Compras', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (11, 'Bar/Restaurantes', 'despesa');
INSERT INTO public.categoria (id, nome, tipocategoria) VALUES (12, 'Cuidados Pessoais', 'despesa');
```

## Requests para os serviços

Os exemplos de requests e responses estão dentro do arquivo ***Dart Week.postman_collection.json*** basta importa-lo no seu postman

## Running the Application Locally

Run `aqueduct serve` from this directory to run the application. For running within an IDE, run `bin/main.dart`. By default, a configuration file named `config.yaml` will be used.

You must have a `config.yaml` file that has correct database connection info, which should point to a local database. To configure a database to match your application's schema, run the following commands:

```
# if this is a new project, run db generate first
aqueduct db generate
aqueduct db upgrade --connect postgres://user:password@localhost:5432/app_name
```
