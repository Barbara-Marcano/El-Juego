const shortestDistanceNode = (distances, visited) => {
	let shortest = null;

	for (let node in distances) {
		let currentIsShortest =
			shortest === null || distances[node] < distances[shortest];
		if (currentIsShortest && !visited.includes(node)) {
			shortest = node;
		}
	}
	return shortest;
};

const findShortestPath = (graph, startNode, endNode) => {
	// Establece el objeto para grabar las distancias desde el nodo inicial al final
	let distances = {};
	distances[endNode] = "Infinity";
	distances = Object.assign(distances, graph[startNode]);

	// Buscara los caminos
	let parents = { endNode: null };
	for (let child in graph[startNode]) {
		parents[child] = startNode;
	}

	// Guardara los nodos que ya han sido visitados
	let visited = [];

	// Buscara el Nodo mas cercano
	let node = shortestDistanceNode(distances, visited);

	// For cada nodo
	while (node) {
		// Buscara la distancia entre el nodo padre y el hijo
		let distance = distances[node];
		let children = graph[node];
		// Por cada Nodo hijo
		for (let child in children) {
			// Se asegurara de que el nodo no sea el nodo inicial o que el valor sea 0
			// Si el valor es 0 se tomara como que no hay forma de ir a ese nodo
			if (String(child) === String(startNode)) {
				continue;
			} else if(children[child] === 0){
				continue
			} else {
				// Guardara la distancia desde el nodo inicial hasta el nodo hijo
				let newdistance = distance + children[child];
				// Si no hay una distancia guardada desde el nodo hijo en el objeto distances
				// O si la distancia guardada es mas corta que la anterior distancia desde el nodo inicial hasta el nodo hijo
				// guardara la distancia en el objeto y guardara el camino
				if (!distances[child] || distances[child] > newdistance) {
					distances[child] = newdistance;
					parents[child] = node;
				}
			}
		}
		// Mueve el nodo a los visitados
		visited.push(node);
		// Se movera al siguiente nodo
		node = shortestDistanceNode(distances, visited);
	}

	// Usara el camino mas corto desde el nodo inicial hasta el nodo final
	// Y guardara el camino mas corto
	let shortestPath = [endNode];
	let parent = parents[endNode];
	while (parent) {
		shortestPath.push(parent);
		parent = parents[parent];
	}
	shortestPath.reverse();

	// Aqui retornara el resultado, siendo el camino mas corto y su distancia
	let results = {
		distance: distances[endNode],
		path: shortestPath,
	};

	return results;
};

module.exports = findShortestPath;