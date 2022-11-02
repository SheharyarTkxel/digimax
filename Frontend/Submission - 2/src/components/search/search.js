import React, { useState } from "react";
import { Button } from "react-bootstrap";
import styles from "./search.module.scss";
import { CiSearch } from "react-icons/ci";
const Search = ({ handleSearchChange }) => {
  const [search, setSearch] = useState("");
  return (
    <div className={styles.searchwrap}>
      <div className={styles.search}>
        <input
          type="text"
          className={styles.searchTerm}
          placeholder="Search a Word"
          value={search}
          onChange={(e) => {
            const { value } = e.target;
            setSearch(value);
            handleSearchChange(value);
          }}
        />
        <Button variant="info" className={styles.searchButton}>
          <CiSearch />
        </Button>
      </div>
    </div>
  );
};
export default Search;
