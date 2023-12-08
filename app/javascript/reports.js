export function adjustDonutChart(element, ratio) {
  const degrees = ratio * 360;
  console.log("ratio", ratio)

  element.style.background = `conic-gradient(red 0deg ${degrees}deg, green ${degrees}deg 360deg)`;
}

