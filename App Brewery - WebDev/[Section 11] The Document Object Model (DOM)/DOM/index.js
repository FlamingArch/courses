// alert("Hello")

console.log('document :>> ', document);

console.log(document.getElementsByTagName("li"));
console.log(document.getElementsByTagName("li").length);

console.log(document.getElementsByClassName('btn'));
document.getElementsByClassName('btn')[0].style.color = 'red'

console.log(document.getElementById("title"));
document.getElementById('title').innerHTML = "Goodbye"

console.log(document.querySelector('.btn'));

console.log(document.querySelector('li.item a'));
console.log(document.querySelector('#list a'));

console.log(document.querySelector('#list .item'));
// Only first item

console.log(document.querySelectorAll('#list item'));
// All items

// document.querySelector('li').style.color = 'red'
// document.querySelector('h1').style.fontSize = '6.9rem'
// document.querySelector("button").style.background = 'yellow'

document.querySelector(".btn").classList.add('invisible')
document.querySelector("#title").classList.add("huge")

document.querySelector('h1').innerHTML = '<em>Good Bye</em>'

console.log(document.querySelector('a').attributes);
console.log(document.querySelector('a').getAttribute('href'))
document.querySelector('a').setAttribute("href", "https://www.bing.com")
