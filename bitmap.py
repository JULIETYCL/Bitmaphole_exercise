import numpy as np

def bitmapHoles(strArr):
   char_list=[]
   for i in strArr:
    char=split(i)
    char_list.append(char)
   numarray = np.array(char_list)
   print(numarray)
   numberofholes = findZero(numarray)
   return numberofholes

def findZero(numarray):
  count =0
  listOfposition=[]
  listofneighbour=[]
  for i in range(len(numarray)):
    for j in range(len(numarray[0])):
      if numarray[i][j]=='0':
        if (i,j) not in listOfposition:
          listOfposition.append((i,j))
          listofneighbour =neighbour(numarray,(i,j))
          listOfposition.extend(listofneighbour)
          count+=1
      else:
        pass
  return count
        

def neighbour(numarray,position):
# vertical down check
  NeighbourList=[]
  i=position[0]+1
  j=position[1]
  if i<len(numarray):
    if numarray[i][j]=='0':
      numarray[i][j]='1'
      NeighbourList.append((i,j))
      lon = neighbour(numarray,(i,j))
      NeighbourList.extend(lon)

# horizontal right check
  h=position[0]
  d=position[1]+1
  if d<len(numarray[0]):
    if numarray[h][d]=='0':
      numarray[h][d]='1'
      NeighbourList.append((h,d))
      lon = neighbour(numarray,(h,d))
      NeighbourList.extend(lon)

# vertical up check
  
  r=position[0]-1
  f=position[1]
  if i>=0:
    if numarray[r][f]=='0':
      numarray[r][f]='1'
      NeighbourList.append((r,f))
      lon = neighbour(numarray,(r,f))
      NeighbourList.extend(lon)

# horizontal left check
  a=position[0]
  b=position[1]-1
  if d>=0:
    if numarray[a][b]=='0':
      numarray[a][b]='1'
      NeighbourList.append((a,b))
      lon = neighbour(numarray,(a,b))
      NeighbourList.extend(lon)
  
  return NeighbourList
  
def split(word):
  return list(word)
   
print(bitmapHoles(["01001", "00001", "11010", "11011"]))