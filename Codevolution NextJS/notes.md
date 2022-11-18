# Next.js Notes

## React.js

- React is (only) a UI library for view layer of the application.
- You have to make decisions on other features of the app like routing, styling, authentication, etc.
- Not quite possible to build a full feature application ready for production from react alone.
- Quite un-opinionated.

## Next.js

- Next.js is a react framework, i.e. a framework that uses react for building user interfaces.
- It is loaded with a lot more features that enables building of full fledged production ready applications, like routing, styling, authentication, bundle optimization, etc.
- No need to install additional packages.
- Opinions and conventions need to be followed.

## Features of Next.js

1. File-Based Routing
2. Pre-rendering
3. API Routes
4. Supports CSS Modules
5. Authentication
6. Development and Production build system

## Prerequisites

1. HTML, CSS and JavaScript fundamentals
2. ES6+ Features
3. React Fundamentals

## Hello World

1. Make sure Node.js (and npm alongside) are installed.
2. Run `npx create-next-app hello-world` or `yarn create next-app hello-world` to create a new Next.js project.
3. A folder with the name `hello world` (or whatever name was supplied) will be created.
4. Run `npm run dev` or `yarn dev` to run the app.

## Project Files

### `package.json`

This is the file that contains basic information about the project, as well as the scripts available to run on the project and the dependencies (and development dependencies) needed by the project.

The three most important dependencies for any next project are `react`, `react-dom` and `next`.

The project may optionally also have `eslint` as a dev dependency.

The scripts available by default are:

- `dev`: Runs the project in development/debug mode, with hot-reload, error reporting, etc.
- `build`: Compiles the project and prepares for deploying.
- `start`: Runs the compiled project in production mode.
- `lint`: Lints all files in the project using eslint.

### `next.config.js`

This file contains configuration for next.js. It, by default contains option of `reactStrictMode` set to true. It is a development feature for detecting potential problems in the project.

### `.eslintrc`

Configuration file for ESLint, can be used to customizing features and rules for project linting.

### `.gitignore`

Files to be ignored by git for tracking changes to.

### `README.md`

A simple Readme file, useful for describing the project to other people.

### `package-lock.json` (or `yarn.lock`)

Lock file for package manager, used to maintain version consistency across dependency installations.

## Project Folder Structure

### `.next\`

Generated when build or dev script is run. The project is served from this folder. Can be gitignored.

### `node_modules\`

Folder where all the dependencies are installed when running `npm install` or `yarn`. Can be gitignored.

### `styles`

An pre-generated optional folder for better organizing stylesheets across the project.

### `public`

Holds all public resources of the project, such as the favicon. Different from react, it does not contain the index.html file. The file is generated on the fly while compiling or running.

### `pages`

Responsible for the entire routing feature of the project, it contains `index.js`, which is the file that is served when we visit the home page of the site (on, say, `localhost:3000`). It also contains `_app.js` for defining the layout of the project, and an `api` folder for better organisation of API routes.

### Routing Special File/Folder Names

- `[var]`: Dynamic Route
- `[...params]`: Catch all route, excluding base page.
- `[[...params]]`: Catch all route, including base page.

