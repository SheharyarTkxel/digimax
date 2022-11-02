import React, { useState } from "react";
import { CiTrash } from "react-icons/ci";
import { Button, Modal } from "react-bootstrap";
import { TailSpin } from "react-loader-spinner";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { removeWord } from "../../api";
const Word = ({ word }) => {
  //modal show hide state
  const [show, setShow] = useState(false);
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);
  // loaderstate
  const [loader, setLoader] = useState(false);
  // success messages
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
  // remove word
  const handleRemoveWord = () => {
    setLoader(true);
    removeWord(word)
      .then((res) => {
        const { notification, message } = res;
        setLoader(false);
        showToastMessage(notification, message);
        setShow(false);
      })
      .catch((err) => {
        const { notification, message } = err;
        showToastMessage(notification, message);
        setLoader(false);
        setShow(false);
      });
  };
  return (
    <>
      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title>Remove Word</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <form className={"modalForm"}>
            Do you want to remove <strong>"{word}"</strong> ?
          </form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="secondary" onClick={handleClose}>
            Close
          </Button>
          <Button variant="primary" onClick={handleRemoveWord}>
            {!loader ? (
              "Delete Word"
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
      <ToastContainer />
      <span>{word}</span>
      <CiTrash onClick={handleShow} />
    </>
  );
};
export default Word;
