# prisma

1.) Add your changes to the `schema.prisma` file
2.) Run the migration locally with `npx prisma migrate dev --name init --preview-feature`
3.) Verify that everything went according to plan locally without conflictions.
4.) Add node module in your package.json file under the dependencies
5.) Add schema path in package.json file
`"prisma":{ "schema": path_to_the_module}`
6.) Run `npm install`
7.) Add DATABASE_URL in project .env file
8.) Run the migration in project with `npx --schema path_to_the_module prisma migrate dev --name init --preview-feature`