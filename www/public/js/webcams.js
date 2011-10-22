/* Copyright (C) 2007 Richard Atterer, richard©atterer.net
   This program is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License, version 2. See the file
   COPYING for details. */

var imageNr = 0; // Serial number of current image
var paused = false;
// References to img objects which have finished downloading
var finished0 = new Array();
var finished1 = new Array();

// Configuration
var host = "tank.home"
var url0 = "http://" + host + ":8080"
var url1 = "http://" + host + ":8081"

function createImageLayers() {
  // Webcam 0
  var img = createImg(url0)
  img.onload = image0Onload;
  var webcam = document.getElementById("webcam0");
  webcam.insertBefore(img, webcam.firstChild);
  // Webcam 1
  var img = createImg(url1)
  img.onload = image1Onload;
  var webcam = document.getElementById("webcam1");
  webcam.insertBefore(img, webcam.firstChild);
}

// Generate an img element
function createImg(baseUrl) {
  var img = new Image();
  img.style.position = "absolute";
  img.style.zIndex = -1;
  img.onclick = imageOnclick;
  img.src = baseUrl + "/?action=snapshot&n=" + (++imageNr);
  return img
}

// Two layers are always present (except at the very beginning), to avoid flicker
function image0Onload() {
  this.style.zIndex = imageNr; // Image finished, bring to front!
  while (1 < finished0.length) {
    var del = finished0.shift(); // Delete old image(s) from document
    del.parentNode.removeChild(del);
  }
  finished0.push(this);
  if (!paused) createImageLayers();
}

// Two layers are always present (except at the very beginning), to avoid flicker
function image1Onload() {
  this.style.zIndex = imageNr; // Image finished, bring to front!
  while (1 < finished1.length) {
    var del = finished1.shift(); // Delete old image(s) from document
    del.parentNode.removeChild(del);
  }
  finished1.push(this);
  if (!paused) createImageLayers();
}

function imageOnclick() { // Clicking on the image will pause the stream
  paused = !paused;
  if (!paused) createImageLayers();
}

// MAKE IT RUN!
createImageLayers();
