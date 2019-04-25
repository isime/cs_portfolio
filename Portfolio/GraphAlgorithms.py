'''
Demonstration of some simple graph algorithms.
    
@author: greg gagne
'''

import sys

class GraphAlgorithms:
    
    '''
    Reads in the specified input file containing
    adjacent edges in a graph and constructs an
    adjacency list.

    The adjacency list is a dictionary that maps
    a vertex to its adjacent vertices.
    '''
    def init(self, fileName): 
    
        graphFile = open(fileName)

        '''
        create an initially empty dictionary representing
        an adjacency list of the graph
        '''
        self.adjacencyList = { }
    
        '''
        collection of vertices in the graph (there may be duplicates)
        '''
        self.vertices = [ ]

        for line in graphFile:
            '''
            Get the two vertices
        
            Python lets us assign two variables with one
            assignment statement.
            '''
            (firstVertex, secondVertex) = line.split()
        
            '''
            Add the two vertices to the list of vertices
            At this point, duplicates are ok as later
            operations will retrieve the set of vertices.
            '''
            self.vertices.append(firstVertex)
            self.vertices.append(secondVertex)

            '''
            Check if the first vertex is in the adjacency list.
            If not, add it to the adjacency list.
            '''
            if firstVertex not in self.adjacencyList:
                self.adjacencyList[firstVertex] = [ ]

            '''
            Add the second vertex to the adjacency list of the first vertex.
            '''
            self.adjacencyList[firstVertex].append(secondVertex)

    '''
    Begins the DFS algorithm.
    '''
    def DFSInit(self):
    
        print 'DFS Traversal'

        # creates a set of vertices (removes duplicates)
        self.setOfVertices = set(self.vertices)
        
        # initially all vertices are considered unknown
        self.unVisitedVertices = set(self.vertices)
        
        self.visitedVertices = []
    
        '''
        YOUR LOGIC GOES HERE
        '''
        for v in self.setOfVertices:
            if v in self.unVisitedVertices:
                self.DFS(v)
        
        print self.visitedVertices

    '''
    depth-first traversal of specified graph

    This is likely the function representing the recursive portion
    of the DFS algorithm
    '''
    def DFS(self, vertice):
        self.visitedVertices.append(vertice)
        self.unVisitedVertices.remove(vertice)
        
        for v in self.adjacencyList[vertice]:
            if v in self.unVisitedVertices:
                self.DFS(v)
                
    '''
    Begins the BFS algorithm.
    '''
    def BFSInit(self):
    
        print 'BFS Traversal'

        # creates a set of vertices (removes duplicates)
        self.setOfVertices = set(self.vertices)
        
        # initially all vertices are considered unknown
        self.unVisitedVertices = set(self.vertices)
        
        self.BFSQ = []
        
        self.visitedVertices = []
    
        '''
        YOUR LOGIC GOES HERE
        '''
        for v in self.setOfVertices:
            if v in self.unVisitedVertices:
                self.BFS(v)
        
        print self.visitedVertices

    '''
    breadth-first traversal of specified graph

    This is likely the function representing the recursive portion
    of the BFS algorithm
    '''
    def BFS(self, vertice):
        self.visitedVertices.append(vertice)
        self.unVisitedVertices.remove(vertice)
        self.BFSQ.append(vertice)
        
        while len(self.BFSQ) != 0:
            for v in self.adjacencyList[self.BFSQ[0]]:
                if v in self.unVisitedVertices:
                    self.visitedVertices.append(v)
                    self.unVisitedVertices.remove(v)
                    self.BFSQ.append(v)
            self.BFSQ.pop(0)
                
         
if __name__ == '__main__':
    
    if len(sys.argv) != 2:
        print 'Usage python GraphAlgorithms.py [input file]'
        quit()
        
    
    ga = GraphAlgorithms()
    
    ga.init(sys.argv[1])
    
    # Construct a depth-first search
    ga.DFSInit()
    ga.BFSInit()
    
    '''
    don't forget the BFS algorithm!
    '''

