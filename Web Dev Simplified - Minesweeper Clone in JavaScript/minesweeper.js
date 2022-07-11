// Logic

export const TILE_STATUSES = {
  HIDDEN: "hidden",
  MINE: "mine",
  NUMBER: "number",
  MARKED: "marked",
};

export function createBoard(boardSize, numberOfMines) {
  const board = [];
  const minePositions = getMinePositions(boardSize, numberOfMines);
  for (let x = 0; x < boardSize; x++) {
    const row = [];
    for (let y = 0; y < boardSize; y++) {
      const element = document.createElement("div");
      element.dataset.status = TILE_STATUSES.HIDDEN;
      const tile = {
        element,
        x,
        y,
        mine: minePositions.some(positionMatch.bind(null, { x, y })),
        get status() {
          return element.dataset.status;
        },
        set status(value) {
          return (element.dataset.status = value);
        },
      };
      row.push(tile);
    }
    board.push(row);
  }
  return board;
}

export function markTile(tile) {
  if (
    tile.status !== TILE_STATUSES.HIDDEN &&
    tile.status !== TILE_STATUSES.MARKED
  )
    return;

  tile.status =
    tile.status === TILE_STATUSES.MARKED
      ? TILE_STATUSES.HIDDEN
      : TILE_STATUSES.MARKED;
}

export function revealTile(board, tile) {
  if (tile.status !== TILE_STATUSES.HIDDEN) return;
  if (tile.mine) {
    tile.status = TILE_STATUSES.MINE;
    return;
  }
  tile.status = TILE_STATUSES.NUMBER;
  const adjacentTiles = nearbyTiles(board, tile);
  const mines = adjacentTiles.filter((t) => t.mine);
  if (mines.length === 0) {
    adjacentTiles.forEach(revealTile.bind(null, board));
  } else {
    tile.element.textContent = mines.length;
  }
}

export function checkWin(board) {
  return board.every((row) => {
    return row.every((tile) => {
      return (
        tile.status === TILE_STATUSES.NUMBER ||
        (tile.mine &&
          (tile.status === TILE_STATUSES.HIDDEN ||
            tile.status === TILE_STATUSES.MARKED))
      );
    });
  });
  // return true;
}
export function checkLose(board) {
  return board.some((row) => {
    return row.some((tile) => {
      return tile.status === TILE_STATUSES.MINE;
    });
  });
}

function getMinePositions(boardSize, numberOfMines) {
  const positions = [];
  while (positions.length < numberOfMines) {
    const position = {
      x: randomNumber(boardSize),
      y: randomNumber(boardSize),
    };
    if (!positions.some(positionMatch.bind(null, position))) {
      positions.push(position);
    }
  }
  return positions;
}

function nearbyTiles(board, { x, y }) {
  const tiles = [];
  for (let xoffset = -1; xoffset <= 1; xoffset++) {
    for (let yoffset = -1; yoffset <= 1; yoffset++) {
      const tile = board[x + xoffset]?.[y + yoffset];
      if (tile) tiles.push(tile);
    }
  }

  return tiles;
}

function positionMatch(a, b) {
  return a.x === b.x && a.y === b.y;
}

function randomNumber(size) {
  return Math.floor(Math.random() * size);
}
