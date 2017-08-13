
class LinkedList {
  constructor() {
    this.head = new Node(null, null);
    this.tail = new Node(null, null);
    this.head.next = this.tail;
    this.tail.prev = this.head;
  }

  first() {
    return this.tail.prev;
  }

  last() {
    return this.head.next;
  }

  add(key,val) {
    const newNode = new Node(key, val);
    if (this.head.next === this.tail) {
      this.head.next = newNode;
      this.tail.prev = newNode;
      newNode.next = this.tail;
      newNode.prev = this.head;
    } else {
      this.first.prev = newNode;
      newNode.next = this.last();
      this.head.next = newNode;
      newNode.prev = this.head;
    }
  }

  get(key) {
    let node = this.last();
    while (node.next !== null) {
      if (node.key === key) {
        return node.val;
      } else {
        node = node.next;
      }
    }
    return null;
  }

  remove(key) {
    let node = this.last();
    while (node.next !== null) {
      if (node.key === key) {
        node.next.prev = node.prev;
        node.prev.next = node.next;
        return node.val;
      }
      node = node.next;
    }
    return null;
  }

}

class Node {

  constructor(key,val) {
    this.key = key;
    this.val = val;
    this.next = null;
    this.prev = null;
  }

}

class HashMap {
  constructor() {
    this.store = new Array(8);
    this.length = this.store.length;
    this.count = 0;
    this.addLinks();
  }

  addLinks() {
    for (var i = 0; i < this.length; i++) {
      this.store[i] = new LinkedList;
    }
  }

  insert(key,val) {
    // if (this.store[this.hash(key)]) {
    //
    // }
  }

  hash(key) {
    var hash = 0, i, chr;
    if (key.length === 0) return hash;
    for (i = 0; i < key.length; i++) {
      chr = key.charCodeAt(i);
      hash  = ((hash << 5) - hash) + chr;
      hash |= 0;
    }
    return hash % this.length;
  }

  remove(key) {

  }

  get(key) {

  }

  resize() {

  }


}

let newLL = new LinkedList;
newLL.add("abc",2);
newLL.add("bcd",5);
newLL.add("gbc",5);
newLL.remove("bcd");
console.log(newLL.get("abc"));
console.log(newLL.get("bcd"));
console.log(newLL.first);
console.log(newLL.last);

let newHash = new HashMap;
console.log(newHash.store);
// newHash.insert("abc",2);
// newHash.insert("bcd",4);
// newHash.insert("asdf",5);
// newHash.insert("abc",1);
//
// console.log(newHash['abc']);
// console.log(newHash['bcd']);
// console.log(newHash['asdf']);
// console.log(newHash.hash('abc'));