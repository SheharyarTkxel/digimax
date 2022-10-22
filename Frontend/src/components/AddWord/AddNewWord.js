import Button from "react-bootstrap/Button";
import Modal from "react-bootstrap/Modal";
import Container from "react-bootstrap/Container";
import { useState, useRef } from "react";

const AddNewWord = (props) => {
  const [modalShow, setModalShow] = useState(false);
  const addNewKeyword = useRef();

  const AddNewWordAPI = async (enteredWord) => {
    try {
      await fetch(
        "https://test-dictionary-app.herokuapp.com/api/v1/dictionaries/add",
        {
          method: "POST",
          headers: {
            "cache-control": "no-cach",
            "Content-type": "application/json",
          },
          body: JSON.stringify({
            word: enteredWord,
          }),
        }
      )
      props.onHide();
      setModalShow(false)
    } catch (error) {
      console.error(error);
    }
  };

  const formSubmitHandler = (event) => {
    event.preventDefault();
    props.onShow();
    let enteredWord = addNewKeyword.current.value;
    if (enteredWord.trim().length > 0) {
      AddNewWordAPI(enteredWord);
    }
  };

  return (
    <Container className={"wordAlign"}>
      <div className={"addBtn"}>
        <Button className={"btnStyle"} variant="primary" onClick={() => setModalShow(true)}>
          Add New Word
        </Button>
      </div>

      <Modal
        show={modalShow}
        size="lg"
        aria-labelledby="contained-modal-title-vcenter"
        centered
      >
        <Modal.Header className={"d-flex justify-content-end "}>
          
          <Button onClick={() => setModalShow(false)} className={"ft-btn"} ><svg  xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x close-btn" viewBox="0 0 16 16">
  <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
</svg></Button>
        </Modal.Header>
        <Modal.Body>
        <Modal.Title id="contained-modal-title-vcenter" className={"text-align-center"}>
            Add Word To Dictionary
          </Modal.Title>
          <form onSubmit={formSubmitHandler} className={"modalForm"}>
            <input type="text" ref={addNewKeyword} className={"modalInput"}></input>
            <Button type="submit" className={"btnStyles"}>Add</Button>
          </form>
        </Modal.Body>
        <Modal.Footer>
        </Modal.Footer>
      </Modal>
    </Container>
  );
};

export default AddNewWord;
