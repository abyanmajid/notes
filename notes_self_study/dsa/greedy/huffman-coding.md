# Huffman Coding

**Objective:** Compress a text efficiently by creating a variable-length code tree/table for encoding a source symbol.

**Input:** A list of characters and their respective frequencies.

**Output:**

- Binary string representing the encoded data.
- Decoded string from the encoded binary string.

**Time complexity:** $O(n\log n)$ where $n$ is the number of unique characters.

**Space complexity:** $O(n)$ for storing the Huffman tree and code table.

### Pseudocode

```
Function generateCodes(node, code, codeTable):
    If node is NULL:
        Return
    If node is a leaf node:
        codeTable[node.ch] = code
    generateCodes(node.left, code + "0", codeTable)
    generateCodes(node.right, code + "1", codeTable)

Function buildHuffmanTree(freqMap):
    Create a priority queue (min-heap) to store nodes.
    For each character and frequency in freqMap:
        Create a new node with the character and frequency.
        Insert the node into the priority queue.
    While the size of the queue is greater than 1:
        Remove the two nodes with the lowest frequency from the queue.
        Create a new internal node with these two nodes as children.
        The frequency of the new node is the sum of the frequencies of the two nodes.
        Insert the new node back into the queue.
    The remaining node in the queue is the root of the Huffman tree.
    Return the root node.

Function encode(input, codeTable):
    Initialize an empty string for the encoded output.
    For each character in the input:
        Append the character's code from the codeTable to the output.
    Return the encoded output.

Function decode(encodedData, root):
    Initialize an empty string for the decoded output.
    Start from the root of the Huffman tree.
    For each bit in the encoded data:
        Traverse the tree:
            If the bit is 0, go to the left child.
            If the bit is 1, go to the right child.
            If a leaf node is reached, append the character to the output and return to the root.
    Return the decoded output.
```

### C++ Implementation

```cpp
#include <iostream>
#include <vector>
#include <queue>
#include <unordered_map>
#include <string>

// Node structure for the Huffman Tree
struct Node {
    char ch;
    int freq;
    Node *left, *right;

    Node(char c, int f) : ch(c), freq(f), left(nullptr), right(nullptr) {}
};

// Comparator for the priority queue
struct Compare {
    bool operator()(Node* l, Node* r) {
        return l->freq > r->freq;
    }
};

// Utility function to generate the Huffman codes from the tree
void generateCodes(Node* root, std::string str, std::unordered_map<char, std::string> &codeTable) {
    if (!root) return;

    if (!root->left && !root->right) {
        codeTable[root->ch] = str;
    }

    generateCodes(root->left, str + "0", codeTable);
    generateCodes(root->right, str + "1", codeTable);
}

// Function to build the Huffman Tree and generate codes
std::unordered_map<char, std::string> buildHuffmanTree(std::unordered_map<char, int> &freqMap) {
    std::priority_queue<Node*, std::vector<Node*>, Compare> pq;

    // Create a leaf node for each character and add it to the priority queue
    for (auto pair : freqMap) {
        pq.push(new Node(pair.first, pair.second));
    }

    // Iterate until the queue has more than one node
    while (pq.size() != 1) {
        // Remove the two nodes with the highest priority (lowest frequency)
        Node *left = pq.top(); pq.pop();
        Node *right = pq.top(); pq.pop();

        // Create a new internal node with these two nodes as children
        // The frequency of the new node is the sum of the frequencies of the two nodes
        Node *top = new Node('$', left->freq + right->freq);
        top->left = left;
        top->right = right;

        pq.push(top);
    }

    // The remaining node is the root node and the tree is complete
    Node* root = pq.top();

    // Generate the Huffman codes using the tree
    std::unordered_map<char, std::string> codeTable;
    generateCodes(root, "", codeTable);

    return codeTable;
}

// Function to encode the input string using the generated Huffman codes
std::string encode(const std::string &input, std::unordered_map<char, std::string> &codeTable) {
    std::string encodedString;
    for (char ch : input) {
        encodedString += codeTable[ch];
    }
    return encodedString;
}

// Function to decode the encoded string using the Huffman Tree
std::string decode(const std::string &encodedStr, Node* root) {
    std::string decodedString;
    Node* current = root;
    for (char bit : encodedStr) {
        if (bit == '0') {
            current = current->left;
        } else {
            current = current->right;
        }

        // If a leaf node is reached
        if (!current->left && !current->right) {
            decodedString += current->ch;
            current = root;
        }
    }
    return decodedString;
}
```
