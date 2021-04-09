const colours = [ 'rgb(155,233,168)',
                  'rgb(93,197,100)',
                  'rgb(75,162,79)',
                  'rgb(49,111,58)'
]

const counter = document.getElementById('push-count');

const setColour = () => {
  const dataCount = parseInt(counter.dataset.count,10);
  if (dataCount == 0) {
    counter.style.backgroundColor = 'rgb(235,237,240)';
    counter.style.borderColor = grey;
  }
  else {
    const idx = (dataCount / 7) >= 3 ? 3 : Math.floor(dataCount / 7);
    counter.style.backgroundColor = colours[idx];
    counter.style.borderColor = colours[idx];
  }
}

export { setColour };




