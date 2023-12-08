function adjustDonutChart(element, ratio) {
  const degrees = ratio * 360;

  element.style.background = `conic-gradient(
    var(--chart-segment-1-color) 0deg ${degrees}deg,
    var(--chart-segment-2-color) ${degrees}deg 360deg
  )`;
}

const element = document.querySelector('.donut');

if (element) {
  const ratio = parseFloat(element.dataset.ratio);
  adjustDonutChart(element, ratio);
}
