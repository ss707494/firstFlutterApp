try {

  var scene = new THREE.Scene();
  var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
  // Toaster.postMessage(THREE);

  // Toaster.postMessage(document.body.innerHTML);
  var renderer = new THREE.WebGLRenderer();
  renderer.setSize(window.innerWidth, window.innerHeight);
  document.body.appendChild(renderer.domElement);
  var geometry = new THREE.BoxGeometry(1.5, 1.5, 1.5);
  var material = new THREE.MeshPhongMaterial({ color: 0xffffff });
  var cube = new THREE.Mesh(geometry, material);
  scene.add(cube);
  var pointLight = new THREE.PointLight(0xffffff);
  pointLight.position.set(0, 0, 50);
  scene.add(pointLight);
  camera.position.z = 5;
  var animate = function() {
    requestAnimationFrame(animate);
    cube.rotation.x += 0.02;
    cube.rotation.y += 0.02;
    renderer.render(scene, camera);
  };
  animate();
} catch (e) {
  Toaster.postMessage(e)
}
