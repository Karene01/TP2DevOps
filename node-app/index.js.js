const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('le hot-reloading node.js fonctionne');
});

app.listen(port, () => {
  console.log(`App lancée sur http://localhost:${port}`);
});