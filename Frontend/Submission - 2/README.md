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

## API Information

Our API's are built in ROR and they are hosted on heoku, they might lag a bit because of that.

Search Dictionary GET API
https://test-dictionary-app.herokuapp.com/api/v1/dictionaries/search?word=
Works when you search a word in the serach bar.

Add Word to Dictionary Post API
https://test-dictionary-app.herokuapp.com/api/v1/dictionaries/add?word=
Adds a word to dictionary through dialog box.

Delete Word from Dictionary Post API
https://test-dictionary-app.herokuapp.com/api/v1/dictionaries/remove?word=
Delete's a wod to dictionary through dialog box
