import React from "react";
import Word from "../word/word";
import styles from "./words.module.scss";
const WordsList = ({ words }) => {
  return (
    <div>
      <ul className={styles.wordListWrapper}>
        {words.map((item, index) => (
          <li className={styles.listItem}>
            <Word word={item} index={index} />
          </li>
        ))}
      </ul>
    </div>
  );
};
export default WordsList;
