import React, { useState } from "react";
import { Button, Modal } from "react-bootstrap";
import { TailSpin } from "react-loader-spinner";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { addWord } from "../../api";
const Add = () => {
  const [word, setWord] = useState("");
  const [show, setShow] = useState(false);
  const [loader, setLoader] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  const handleWordChange = (e) => {
    const { value } = e.target;
    setWord(value);
  };
  const showToastMessage = (notification, message) => {
    if (notification === "success") {
      toast.success(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 2000,
      });
    } else {
      toast.error(message, {
        position: toast.POSITION.TOP_RIGHT,
        autoClose: 2000,
      });
    }
  };
  const handleAddWord = () => {
    setLoader(true);
    addWord(word)
      .then((res) => {
        const { notification, message } = res;
        setLoader(false);
        setWord("");
        showToastMessage(notification, message);
      })
      .catch((err) => {
        const { notification, message } = err;
        showToastMessage(notification, message);
        setLoader(false);
      });
  };
  return (
    <>
      <Button variant="primary" size="sm" onClick={handleShow}>
        Add New Word
      </Button>
      <ToastContainer />
      <Modal
        show={show}
        onHide={handleClose}
        aria-labelledby="contained-modal-title-vcenter"
      >
        <Modal.Header closeButton>
          <Modal.Title>Add Word</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <form className={"modalForm"}>
            <input
              type="text"
              className="form-control"
              placeholder="add new word"
              value={word}
              onChange={handleWordChange}
            ></input>
          </form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
          <Button variant="primary" onClick={handleAddWord}>
            {!loader ? (
              "Add Word"
            ) : (
              <TailSpin
                height="30"
                width="30"
                color="#ffffff"
                radius="1"
                visible={true}
              />
            )}
          </Button>
        </Modal.Footer>
      </Modal>
    </>
  );
};

export default Add;
