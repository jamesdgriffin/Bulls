import React, {useState, useEffect} from 'react';
import {getRandom, getResult, valid} from './game.js';

function BullsAndCows() {
  const [state, setState] = useState({
    secret: "",
    guesses: [],
    results: [],
    text: "",
    message: "",
  });

  let {secret, guesses, results, text, message} = state;

  function setSecret(sct) {
    let st1 = Object.assign({}, state, {secret: sct});
    setState(st1);
  }

  function init() {
    setSecret(getRandom());
  }

  function changeText(ev) {
    //setText(ev.target.value);
    let st1 = Object.assign({}, state, {text: ev.target.value});
    setState(st1);
  }

  function guess() {
    if((text==secret) && !(text=="")) {
      win();
    }
    else if(valid(text)) {
      let result = getResult(text, secret);
      let st1 = Object.assign({}, state,
        {guesses: guesses.concat(text),
          results: results.concat(result),
          text: "",
          message: ""});
      setState(st1);
      if(guesses.length >= 7) {
        lose();
      }
    }
    else {
      let st1 = Object.assign({}, state, {text: "", message: "Invalid Entry. Try again."});
      setState(st1);
    }
  }

  function win() {
    let st1 = Object.assign({}, state, {message: "You Win!"});
    setState(st1);
  }

  function lose() {
    let st1 = Object.assign({}, state, {message: "You Lose! Press Reset button to try again."});
    setState(st1);
  }

  function reset() {
    let st1 = Object.assign({}, state,
      {secret: getRandom(),
        guesses: [],
        results: [],
        text: "",
        message: ""});
    setState(st1);
  }

  function enter(ev) {
    if (ev.key == "Enter") {
      guess();
    }
  }

  if(secret=="") {
    return (
      <div className="App">
        <h1>Bulls and Cows game!</h1>
        Read the
        <a href="https://en.wikipedia.org/wiki/Bulls_and_Cows"> rules</a>
        , then press play!
        <button onClick={init}>Play!</button>
      </div>
    );
  }

  if((message=="You Win!") ||
  (message=="You Lose! Press Reset button to try again.")) {
    return (
      <div className="App">
        <h1>Bulls and Cows game!</h1>
        <h2>{message}</h2>
        <input type="text" value=""/>
        <p>
          <button>Guess</button>
          <button onClick={reset}>Reset</button>
        </p>
        <p>
          <table>
          <tr>
            <th>Guesses</th>
            <th>Results</th>
          </tr>
          <tr>
            <td>{guesses[0]}</td>
            <td>{results[0]}</td>
          </tr>
          <tr>
            <td>{guesses[1]}</td>
            <td>{results[1]}</td>
          </tr>
          <tr>
            <td>{guesses[2]}</td>
            <td>{results[2]}</td>
          </tr>
          <tr>
            <td>{guesses[3]}</td>
            <td>{results[3]}</td>
          </tr>
          <tr>
            <td>{guesses[4]}</td>
            <td>{results[4]}</td>
          </tr>
          <tr>
            <td>{guesses[5]}</td>
            <td>{results[5]}</td>
          </tr>
          <tr>
            <td>{guesses[6]}</td>
            <td>{results[6]}</td>
          </tr>
          <tr>
            <td>{guesses[7]}</td>
            <td>{results[7]}</td>
          </tr>
        </table>
      </p>
      </div>
    );
  }

  return (
    <div className="App">
      <h1>Bulls and Cows game!</h1>
      <h2>{message}</h2>
      <input type="text" value={text} onChange={changeText}
      onKeyPress={enter}/>
      <p>
        <button onClick={guess}>Guess</button>
        <button onClick={reset}>Reset</button>
      </p>
      <p>
        <table>
          <tr>
            <th>Guesses</th>
            <th>Results</th>
          </tr>
          <tr>
            <td>{guesses[0]}</td>
            <td>{results[0]}</td>
          </tr>
          <tr>
            <td>{guesses[1]}</td>
            <td>{results[1]}</td>
          </tr>
          <tr>
            <td>{guesses[2]}</td>
            <td>{results[2]}</td>
          </tr>
          <tr>
            <td>{guesses[3]}</td>
            <td>{results[3]}</td>
          </tr>
          <tr>
            <td>{guesses[4]}</td>
            <td>{results[4]}</td>
          </tr>
          <tr>
            <td>{guesses[5]}</td>
            <td>{results[5]}</td>
          </tr>
          <tr>
            <td>{guesses[6]}</td>
            <td>{results[6]}</td>
          </tr>
          <tr>
            <td>{guesses[7]}</td>
            <td>{results[7]}</td>
          </tr>
        </table>
      </p>
    </div>
  );
}

export default BullsAndCows;
