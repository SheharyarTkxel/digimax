import React, { useState, useRef } from "react";
import styles from "./SearchBar.module.css";
import Container from "react-bootstrap/Container";
import Button from "react-bootstrap/Button";

const SearchBar = (props) => {
  const enterKeyword = useRef();
  const [setSearchResult] = useState([]);

  const getSearchResult = async (searchKeyword) => {
    const { data } = await fetch(
      "https://test-dictionary-app.herokuapp.com/api/v1/dictionaries/search?word=" +
      searchKeyword
    ).then((response) => response.json());
    setSearchResult(data || []);
    props.setSearchResults(data);
    props.onHide();
  };

  const formSubmitHandler = (event) => {
    props.onShow();
    event.preventDefault();
    let searchKeyword = enterKeyword.current.value;
    if (searchKeyword.trim().length > 0) {
      getSearchResult(searchKeyword);
    }
  };

  return (
    <>
    <Container>
       
      <div className={styles.searchHeader}>
        <form onSubmit={formSubmitHandler} className={styles.formFlex}>
          <div className={styles.searchBar}>
            <div className={styles.searchBarWrapper}>
              <input
                type="text"
                className={styles.formControl}
                placeholder="Type a word"
                ref={enterKeyword}
              />
               <div className={styles.searchBtn}>
            <Button type="submit" className={styles.btnStyle}><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search icon-search" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg>
            </Button>
          </div>
            </div>
          </div>
         
        </form>
      </div>

    </Container>
    </>
  );
};
export default SearchBar;
