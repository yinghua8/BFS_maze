# BFS Maze Algorithm
Co-authored : Ying Yu Yang
### Description
In this project, we try to implement Breadth-First Search(BFS) algorithm for solving the maze-walking problem. The project is divided into three parts : 

1. Getting the info of the maze
2. BFS algorithm
3. Output the path of the maze

---

**Getting the info of the maze**

At first, the pattern will output 16 * 16 = 256 bits into our design, and the order goes from the top left corner to the bottom right corner (i.e. (0, 0) ~ (15, 0), then (0, 1) ~ (15, 1)). Number 1 means wall and number 0 means the path we can go through. The start of the maze is at point (1, 1) while the end of the maze is at (14, 14), the border must be walls.

**BFS algorithm**
It follows the rules below : 

1. Goes from the start, and the path-finding process expands when it meets an intersection.

2. If the intersection goes to a dead end, path-finding process will no longer expand.

3. The extension ends when it goes through the ending point (14, 14).

4. If it can't find a path, it means that the map is invalid, we need to pull the signal of maze_not_valid to 1.

**Output the path of the maze**

We shall find our path by backtracking the path we've gone through from the ending points. The priority goes from "up", "left", "down", and then "right", the final answer will be output from (14, 14) to (1, 1), finally written into file out_x & out_y.

---

### Format of Input & Output
![image](https://user-images.githubusercontent.com/71891722/212476997-9474455a-87a6-475d-9d4f-02c9e8ea82a1.png)

![image](https://user-images.githubusercontent.com/71891722/212476984-a49a481d-d45f-40e8-b62b-799ccef22ee2.png)
![image](https://user-images.githubusercontent.com/71891722/212477005-e9c63d8e-9411-4f3a-96e9-abadc119557f.png)


Note : 

Input.txt file represents the maze from left to right, from top to bottom. The first value of file out_x.txt & out_y.txt represent the length of the answer, and the numbers after show the correct position of the X and Y coordinate.
