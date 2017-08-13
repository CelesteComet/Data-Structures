
class LinkedList {
  constructor() {
    this.head = new Node(null, null);
    this.tail = new Node(null, null);
    this.head.next = this.tail;
    this.tail.prev = this.head;
  }

  first() {

  }

  last() {

  }

  add() {

  }

  get() {

  }

  remove() {

  }

}

class Node {
  constructor(key,val) {
    this.key = key;
    this.val = val;
    this.next = null;
    this.prev = null;
  }

  remove() {
  }

}

class HashMap {
  constructor() {
    this.store = Array(8);
    this.length = this.store.length;
    this.count = 0;
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

let newHash = new HashMap;
newHash.insert("abc",2);
newHash.insert("bcd",4);
newHash.insert("asdf",5);
newHash.insert("abc",1);

console.log(newHash['abc']);
console.log(newHash['bcd']);
console.log(newHash['asdf']);
console.log(newHash.hash('abc'));
