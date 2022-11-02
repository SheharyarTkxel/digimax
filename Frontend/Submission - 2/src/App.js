import { useState, useEffect, useMemo } from "react";
import debounce from "lodash.debounce";
import Add from "./components/addWord/add";
import Search from "./components/search/search";
import WordsList from "./components/wordsList/wordList";
import { getDictionary, searchDictionary } from "./api";
import { on } from "events";
function App() {
  const [words, setWords] = useState([]);
  // search Data
  const handleSearchChange = (search) => {
    searchDictionary(search)
      .then((res) => {
        const modifiedData = res.slice(0, 25);
        setWords(modifiedData);
      })
      .catch((err) => console.log(err));
  };
  // result callback ?
  const debouncedResults = useMemo(() => {
    return debounce(handleSearchChange, 300);
  }, []);
  // show data onload
  useEffect(() => {
    getDictionary()
      .then((res) => {
        const modifiedData = res.slice(0, 15);
        setWords(modifiedData);
      })
      .catch((err) => console.log(err));
  }, []);
  useEffect(() => {
    return () => {
      debouncedResults.cancel();
    };
  });
  return (
    <>
      <div className="container main-card">
        <h4 className="text-center">English Dictionary</h4>
        <div className="d-flex gap-2 justify-content-center">
          <Search handleSearchChange={debouncedResults} />
          <Add />
        </div>
        {words.length ? <WordsList words={words} /> : " No data to show"}
      </div>
    </>
  );
}
export default App;
