const findShortestPath = require('../shortestPath');

const firstGraph = {
	0: { 1: 5, 2: 2},
	1: { 0: 0, 2: 0, 3: 4, 4: 2, 5: 0 },
	2: { 0: 0, 1: 8, 3: 0, 4: 7, 5: 0 },
	3: { 0: 0, 1: 0, 2: 0, 4: 6, 5: 3 },
	4: { 0: 0, 1: 0, 2: 0, 3: 0, 5: 1 },
	5: {},
};

const secondGraph = {
	0: { 1: 10, 2: 20, 3: 0 },
	1: { 0: 0, 2: 0, 3: 50 },
	2: { 0: 0, 1: 0, 3: 10 },
	3: {},
}

test(`El camino mas corto desde 0 hasta 5 deberia de ser 12`, () => {
  const shortestPath = findShortestPath(firstGraph, '0', '5');
  expect(shortestPath).toEqual({
    distance: 8,
    path: ['0', '1', '4', '5'],
  });
});

test(`El camino mas corto desde 0 hasta 3 deberia de ser 30`, () => {
	const shortestPath = findShortestPath(secondGraph, '0', '3');
	expect(shortestPath).toEqual({
	  distance: 30,
	  path: ['0', '2', '3'],
	});
  });