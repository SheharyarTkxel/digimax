import React from "react";
import Container from "react-bootstrap/Container";
import Row from "react-bootstrap/Row";
import WordCard from "./WordCard";

const DictionaryListing = (props) => {
  // Function to collect data 
  return (
    <Container classname={"sides"}>
      
      <Row>
        {props.result.map((word,index)=> (
          <WordCard dictionaryWord={word} removeHandler={()=> props.removeWordHandler(word)} />
        ))}
      </Row>
    </Container>
  );
};

export default DictionaryListing;
