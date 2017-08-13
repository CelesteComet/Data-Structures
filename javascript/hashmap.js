
class HashMap {
  constructor() {
    this.store = Array(8);
    this.length = this.store.length;
    this.count = 0;
  }

  insert(key,val) {

  }

  remove(key) {

  }

  get(key) {

  }

  resize() {

  }
}

let newHash = new HashMap
newHash.insert("abc",2)
newHash.insert("bcd",4)
newHash.insert("asdf",5)
newHash.insert("abc",1)

console.log(newHash['abc']);
console.log(newHash['bcd']);
console.log(newHash['asdf']);
