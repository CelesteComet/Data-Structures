
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
      newNode.next = this.last();
      newNode.prev = this.head;
      this.last().prev = newNode;
      this.head.next = newNode;
    }
  }

  update(key,val){
    this.each(node => {
      if (node.key === key) {
        node.key = val;
        return node.val;
      }
    });
  }

  each(callback) {
    let node = this.last();
    while (node.next !== null) {
      callback(node);
      node = node.next;
    }
  }

  get(key) {
    let targetNode = null;
    this.each(node => {
      if (node.key === key) {
        targetNode = node.val;
      }
    });
    return targetNode;
  }

  find(key) {
    let targetNode = null;
    this.each(node => {
      if (node.key === key) {
        targetNode = node;
      }
    });
    return targetNode;
  }

  remove(key) {
    let node = this.find(key);
    node.next.prev = node.prev;
    node.prev.next = node.next;
    return node.val;
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
    if (this.store[this.hash(key)].get(key) !== null ) {
      this.store[this.hash(key)].update(key,val);
    } else {
      this.store[this.hash(key)].add(key,val);
    }
    this.count++;
    if (this.count > this.length) {
      this.resize();
    }
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
    if (this.store[this.hash(key)].get(key) !== null ) {
      this.store[this.hash(key)].remove(key);
    } else {
      return false;
    }
  }

  get(key) {
    return this.store[this.hash(key)].get(key);
  }

  resize() {
    let oldBucket = this.store;
    this.length = this.length*2;
    this.store = Array(this.length);
    this.addLinks();
    this.count = 0;
    oldBucket.forEach( link => {
      link.each(node => {
        this.insert(node.key, node.val);
      });
    });
  }


}

let newLL = new LinkedList;
newLL.add("abc",2);
newLL.add("bcd",5);
newLL.add("gbc",5);
newLL.remove("bcd");
console.log(newLL.get("abc"));
console.log(newLL.get("gbc"));
console.log(newLL.get("bcd"));
console.log(newLL.get("gbc"));
// console.log(newLL.first);
// console.log(newLL.last);

let newHash = new HashMap;
console.log(newHash.store);
newHash.insert("abc",2);
newHash.insert("bcd",4);
newHash.insert("asdf",5);
newHash.insert("abu",1);
newHash.insert("aby",1);
newHash.insert("abk",1);
newHash.insert("abj",1);
newHash.insert("abh",1);
newHash.insert("abg",1);
newHash.insert("fbg",1);

console.log(newHash.get('abc'));
console.log(newHash.get('bcd'));
console.log(newHash.get('asdf'));
console.log(newHash.store);
console.log(newHash.get('abc'));
console.log(newHash.get('abg'));
console.log(newHash.get('fbg'));
