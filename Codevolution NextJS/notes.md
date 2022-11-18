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

## Routing

1. **Page-Based Routing Mechanism:** Pages are associated with a route based on their file name.
2. **Nested Routes:** Nested folder structure, files will be automatically routed in the same way in the URL.
3. **Dynamic Routes:** Can be created by adding square brackets to a page name.
4. **Catch-All Routes:** Add three dots inside square brackets to create a catch all route. Helpful when you want different URLs for the same page layout or even when you're working with pages where some of the route parameters are optional.
5. **Link Component:** To navigate on click of an element.
6. **useRouter().push():** To navigate programmatically.
7. **/404.js**: Custom 404 Page for our project.

### Routing Special File/Folder Names

- `[var]`: Dynamic Route
- `[...params]`: Catch all route, excluding base page.
- `[[...params]]`: Catch all route, including base page.

## Pre-Rendering and Data Fetching

Pre-rendering is the process of generating HTML with the necessary data for a page in our application.

Pre-rendering can result in better performance and SEO.

Next.js pre-generates the html pages instead of rendering them client side when the page is loaded.

### Next.js vs React.js

#### No Pre-rendering (React.js)

1. **Initial Load:** App is not rendered.
2. **Hydration:** React components are initialized and App becomes interactive.

#### Pre-rendering (Next.js)

1. **Initial Load:** Pre-rendered HTML is displayed.
2. **Hydration:** React components are initialized and App becomes interactive. If the app has interactive components like `<Link />`, they'll be active after JS loads. Done by default in Next.js app.

### Why Pre-render?

1. **Pre-Rendering improves Performance:**

   - In a react app, you need to wait for the JavaScript to be executed.
   - If needed, data is the fetched form an external API.
   - After fetching data, the UI is finally rendered.
   - User has to wait for all that to happen.
   - In case of a pre-rendered page, the HTML is already generated, and hence, page loads faster.

2. **Pre-rendering helps with SEO**
   - If building a blog or an e-commerce site, SEO is a concern.
   - With a React app, if the search engine hits the page, it only sees a div tag with an id of root.
   - On the other hand, if a search engine hits a pre-rendered page, all content is present in the source code which will help index that page.

### Types of Pre-rendering

1. Static Generation
   - Without Data
   - With Data
   - Incremental Static Generation
   - Dynamic Parameters when Fetching Data
2. Server Side Rendering
   - Data Fetching
3. Client Side Rendering
4. Combining Pre-Rendering with Client Side Fetching

### Pre-Rendering in Next.js

Next.js supports two forms of pre-rendering:

1. Static Generation
2. Server Side Rendering

## Static Generation

It is a method of pre-rendering where the HTML is generated in advance at the build time. The HTML with all the data that makes up the content of the web page are generated in advance when the application is built.

It is a recommended method to pre-render page,as it can be cached by a server directly and served to the client almost instantly.

**Example:** Blog pages, E-commerce Product Pages, Documentation, and Marketing Pages.

Next.js, by default, will render every page in our app. The HTML for every page will automatically be statically generated when we build our application. In case of dev mode, a page is pre-rendered every time a request is made.

### Static Generation with Data - `getStaticProps()`

`getStaticProps` runs only on the server side, and will never run on client-side. The code inside it won't even be included in the JS bundle that is sent to the browser.

You can write server-side code directly in `getStaticProps`. Actions such as accessing the file system using the `fs` module or querying a database can be done inside `getStaticProps`. API keys can also be included here, as it will never make it to the browser.

`getStaticProps` is only allowed in a page, and cannot be returned form a regular component file. It is used only for pre-rendering and not client-side data fetching.

It should return an object that should contain a props key, which is an object.

It will run at build time. During dev mode, `getStaticProps` run on every request.
