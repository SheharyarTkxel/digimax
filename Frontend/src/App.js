import "./App.css";
import { Fragment, useState } from "react";
import SearchBar from "./components/SearchBar/SearchBar";
import DictionaryListing from "./components/dictionary/DictionaryListing";
import AddNewWord from "./components/AddWord/AddNewWord";
import Loader from "./components/UI/Loader";


function App() {
  const [isLoader, setIsLoader] = useState(false);
  const [allWords, setAllWords] = useState([]);

  const searchResultHandler = (getResult) => {
    setAllWords(getResult);
  };

  const hideLoaderHandler = () => {
    setIsLoader(false);
  };
  const showLoaderHandler = () => {
    setIsLoader(true);
  };
 
  const getApiData = async () => {
    const { data } = await fetch(
      "https://test-dictionary-app.herokuapp.com/api/v1/dictionaries"
    ).then((response) => response.json());
    hideLoaderHandler()
    setAllWords(data.slice(0, 10000) || []);
    
  };

  const removeKeywordDictionary = async (removeWord) => {
    showLoaderHandler()
    try {
      await fetch(
        "https://test-dictionary-app.herokuapp.com/api/v1/dictionaries/remove",
        {
          method: "DELETE",
          headers: {
            "cache-control": "no-cach",
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            "word": removeWord,
          }),
        }
      );
      getApiData()
    } catch (error) {
      console.error(error)
      hideLoaderHandler()
    }
  };

  return (
    <Fragment>
      <Loader showLoader={isLoader} />
      <div>
      <h1 className={"heading"}>
        Dictionary
      </h1>
      <div className={"d-flex align-items-center justify-content-between container"}>
      <SearchBar
        setSearchResults={searchResultHandler}
        onHide={hideLoaderHandler}
        onShow={showLoaderHandler}
      />
      <AddNewWord onHide={() => {
        getApiData();
        hideLoaderHandler()
      }} onShow={showLoaderHandler} />
      </div>
      </div>
      
     
      <DictionaryListing
        result={allWords}
        onHide={hideLoaderHandler}
        onShow={showLoaderHandler}
        removeWordHandler={(word)=>{
          removeKeywordDictionary(word)
        }}

      />
    </Fragment>
  );
}

export default App;
