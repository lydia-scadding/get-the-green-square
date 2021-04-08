const colours = {

  '1-6': rgb(155,233,168),
  '7-13': rgb(93,197,100),
  '14-20': rgb(75,162,79),
  '20-50': rgb(49,111,58)

}

const counterDiv = document.getElementById('push-count');

let dataCount = parseInt(counterDiv.attr('data-count'),10);
