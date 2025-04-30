<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Talan Greeno | Portfolio</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #eef2f3;
      color: #333;
    }

    header {
      background: linear-gradient(135deg, #0077cc, #005fa3);
      color: white;
      padding: 2rem;
      text-align: center;
    }

    section {
      padding: 2rem;
      max-width: 1000px;
      margin: auto;
    }

    .projects {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
    }

    .project-card {
      background: white;
      padding: 1.5rem;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .contact-form {
      background: white;
      padding: 2rem;
      border-radius: 10px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      text-align: center;
    }

    footer {
      text-align: center;
      padding: 1rem;
      background-color: #222;
      color: white;
      margin-top: 2rem;
    }

    /* Tic Tac Toe Styles */
    .tic-tac-toe {
      text-align: center;
      margin-top: 1rem;
    }

    .board {
      display: grid;
      grid-template-columns: repeat(3, 80px);
      grid-gap: 10px;
      justify-content: center;
      margin-top: 1rem;
    }

    .cell {
      width: 80px;
      height: 80px;
      background-color: #fff;
      border: 2px solid #0077cc;
      font-size: 2rem;
      font-weight: bold;
      color: #333;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      border-radius: 8px;
      transition: background-color 0.3s ease;
    }

    .cell:hover {
      background-color: #eef6ff;
    }

    #status {
      font-size: 1.2rem;
      margin-top: 1rem;
    }

    #restartBtn {
      margin-top: 1rem;
      padding: 0.5rem 1rem;
      background-color: #0077cc;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    #restartBtn:hover {
      background-color: #005fa3;
    }

    @media (max-width: 500px) {
      .board {
        grid-template-columns: repeat(3, 60px);
      }

      .cell {
        width: 60px;
        height: 60px;
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>

<header>
  <h1>Talan Greeno</h1>
  <p>First year freshman college student</p>
</header>

<section>
  <h2>About Me</h2>
  <p>Hello! I'm Talan Greeno, a first-year college student at the University of Wisconsin Green Bay, majoring in creative writing. My passion is about writing fun and scary stories!</p>
</section>

<section>
  <h2>Projects</h2>
  <div class="projects">
    <div class="project-card">
      <h3>Tic Tac Toe</h3>
      <p>A fun two-player game where you take turns placing Xs and Os. First to get 3 in a row wins!</p>

      <div class="tic-tac-toe">
        <div id="status">Player X's turn</div>
        <div class="board" id="board"></div>
        <button id="restartBtn">Restart Game</button>
      </div>
    </div>
  </div>
</section>

<section>
  <h2>Contact Me</h2>
  <div class="contact-form">
    <p>Email: <a href="mailto:greetr19@uwgb.edu">greetr19@uwgb.edu</a></p>
    <p>Text me: <a href="sms:+1234567890">+1 (234) 567 8910</a></p>
  </div>
</section>

<footer>
  <p>© 2025 Talan Greeno. All rights reserved.</p>
</footer>

<script>
  const board = document.getElementById("board");
  const status = document.getElementById("status");
  const restartBtn = document.getElementById("restartBtn");

  let cells = Array(9).fill(null);
  let currentPlayer = "X";
  let gameActive = true;

  function checkWinner() {
    const winPatterns = [
      [0,1,2],[3,4,5],[6,7,8],
      [0,3,6],[1,4,7],[2,5,8],
      [0,4,8],[2,4,6]
    ];
    for (let pattern of winPatterns) {
      const [a,b,c] = pattern;
      if (cells[a] && cells[a] === cells[b] && cells[a] === cells[c]) {
        gameActive = false;
        return cells[a];
      }
    }
    if (!cells.includes(null)) return "Draw";
    return null;
  }

  function handleClick(i) {
    if (!gameActive || cells[i]) return;
    cells[i] = currentPlayer;
    renderBoard();
    const winner = checkWinner();
    if (winner) {
      status.textContent = winner === "Draw" ? "It's a draw!" : `${winner} wins!`;
    } else {
      currentPlayer = currentPlayer === "X" ? "O" : "X";
      status.textContent = `Player ${currentPlayer}'s turn`;
    }
  }

  function renderBoard() {
    board.innerHTML = "";
    cells.forEach((cell, i) => {
      const div = document.createElement("div");
      div.className = "cell";
      div.textContent = cell || "";
      div.onclick = () => handleClick(i);
      board.appendChild(div);
    });
  }

  function resetGame() {
    cells = Array(9).fill(null);
    currentPlayer = "X";
    gameActive = true;
    status.textContent = `Player ${currentPlayer}'s turn`;
    renderBoard();
  }

  restartBtn.onclick = resetGame;

  renderBoard();
</script>

</body>
</html>
