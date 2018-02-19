function setup() {
	createCanvas(windowWidth, windowHeight)
	background(0)
}

let a = 0
let points = []
let pointsR = []
let pointsB = []
let speed = 1

function draw() {
	background(0, 16)

	push()
	a += 0.07
	translate(width / 2, height / 2)
	noFill()

	points.push(spiral(50, a))
	pointsR.push(spiral(54, a))
	pointsB.push(spiral(46, a))

	drawSpiral(pointsB, color(0, 0, 255), 2)
	drawSpiral(pointsR, color(255, 0, 0), 2)
	drawSpiral(points, color(255), 3)

	pop()

	if (createVector(0, 0).dist(points[0]) >= width / 2 + 100) {
		points.splice(0, 1)
	}
	if (createVector(0, 0).dist(pointsR[0]) >= width / 2 + 100) {
		pointsR.splice(0, 1)
	}
	if (createVector(0, 0).dist(pointsB[0]) >= width / 2 + 100) {
		pointsB.splice(0, 1)
	}
}

let drawSpiral = (p, col, weight) => {
	stroke(col)
	strokeWeight(weight)
	beginShape()
	for (let i = 0; i < p.length; i++) {
		vertex(p[i].x, p[i].y)
		let mag = noise(p[i].x / 10, p[i].y / 10, frameCount / 100)
		let dir = createVector(p[i].x, p[i].y)
		dir.normalize()
		dir.mult(mag * speed)
		p[i].add(dir)
	}
	endShape()
}

let spiral = (radius, angle) => {
	let x = cos(angle) * radius
	let y = sin(angle) * radius
	return createVector(x, y)
}
