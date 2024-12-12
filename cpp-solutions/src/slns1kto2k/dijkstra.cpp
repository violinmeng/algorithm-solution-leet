#include <utility>
#include <algorithm>
#include <queue>
#include <vector>

typedef std::pair<int, int> iPair;

void addEdge(std::vector<iPair> adj[], int u, int v, int weight) {
    adj[u].push_back(std::make_pair(v, weight));
    adj[u].push_back(std::make_pair(u, weight));
}

std::vector<int> dijkstra(std::vector<iPair> adj[], int V, int src) {
    std::priority_queue<iPair, std::vector<iPair>, std::greater<iPair>> pq;

    std::vector<int> dist(V, INT_MAX);
    std::vector<char> visited(V, false);

    pq.push(std::make_pair(0, src));
    dist[src] = 0;

    while (!pq.empty()) {
        int u = pq.top().second;
        pq.pop();
        if (visited[u]) {
            continue;
        }
        visited[u] = true;
        for (auto x : adj[u]) {
            int v = x.first;
            int weight = x.second;
            if (dist[v] > dist[u] + weight) {
                dist[v] = dist[u] + weight;
                // just push, and the priority queue, will put the minimum one to the top.
                pq.push(std::make_pair(dist[v],v));
            }
        }
    }
    return dist;
}