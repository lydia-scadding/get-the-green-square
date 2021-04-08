const colours = [ 'rgb(155,233,168)',
                  'rgb(93,197,100)',
                  'rgb(75,162,79)',
                  'rgb(49,111,58)'
]

const counter = document.getElementById('push-count');

const setColour = () => {
  const dataCount = parseInt(counter.dataset.count,10);
  console.log(dataCount);
  const idx = dataCount / 7 > 2 ? 3 : dataCount / 7;
  console.log(Math.floor(idx));
  counter.style.backgroundColor = colours[Math.floor(idx)];
}

export { setColour };




