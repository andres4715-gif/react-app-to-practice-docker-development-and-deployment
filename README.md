# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)


# Docker section: 
## Docker Commands to run creating and working with containers: 

```bash
# Create an images
$ docker build \
-t my-react-app-image:latest \ 
-f Dockerfile.dev .

# Create a container with volumes
$ docker run -it -v "$(pwd):/app" \
-w /app --rm \
--name my-react-app-container \
-p 3000:3000 my-react-app-image:latest

# Create a container without volumes
$ docker run -it --name my-react-app-container -d -p 3000:3000 my-react-app-image:latest 

# Stop a container -> my-react-app-container 
$ docker stop my-react-app-container

# Remove container -> my-react-app-container
$ docker rm my-react-app-container

# Open files in up container
$ docker exec -it my-react-app-container sh
```

## Overwrite the command to run the temporal container just to run test cases 
Example: 
If in the Dockerfile.dev we have these lines: 
```Docker
FROM node:lts-alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "start"]
```
And you can change the current execution for: `npm run test` and you have your image already created just run this command line
`docker run -it <IMAGE-ID> sh -c "npm run test"` or simply `docker run -it <IMAGE-ID> npm run test` <-- # Check the package.json file for scripts

OUTPUT: 
```shell
 PASS  src/App.test.js
  ✓ renders learn react link (10 ms)
  ✓ renders learn react link_2 (2 ms)
  ✓ renders learn react link_3 (2 ms)
  ✓ renders learn react link_4 (2 ms)
  ✓ renders learn react link_5 (2 ms)

Test Suites: 1 passed, 1 total
Tests:       5 passed, 5 total
Snapshots:   0 total
Time:        0.11 s, estimated 1 s
Ran all test suites.

Watch Usage: Press w to show more.
```