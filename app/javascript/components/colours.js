const colours = [ 'rgb(235,237,240)',
                  'rgb(155,233,168)',
                  'rgb(93,197,100)',
                  'rgb(75,162,79)',
                  'rgb(49,111,58)'
]

const counter = document.getElementById('push-count');

const setColour = () => {
  const dataCount = parseInt(counter.dataset.count,10);
  let idx;
  if (dataCount == 0) {
    idx = 0;
  }
  else {
    idx = (dataCount / 7) >= 3 ? 4 : (Math.floor(dataCount / 7) + 1);
  }
  counter.style.backgroundColor = colours[idx];
}

export { setColour };




