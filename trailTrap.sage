def gamevalue(G,v1=-1,v2=-1):
    if v1 == -1:  ## one of the first two moves --- p1 can choose any starting vertex and edge
        for startv in G.vertices():
            for nextv in G.neighbors(startv):
                H = deepcopy(G)
                H.delete_edge(startv,nextv)
                if gamevalue(H,v2,nextv) == 2:  ## a winning move was found
                    return 1
        return 2
    else:
        if len(G.neighbors(v1)) == 0:   ## base case --- first player has no legal moves, second player wins
            return 2
        for nextv in G.neighbors(v1):
            H = deepcopy(G)
            H.delete_edge(v1,nextv)
            if gamevalue(H,v2,nextv) == 2:  ## a winning move was found
                return 1
        return 2    ## no winning move was found


n = 4

for G in graphs(n):
    if G.is_connected():
        gamevalue(G)
        G.edges(labels=False)
