## Query
### The test task 

**Develop a Query class so that when you execute the following code:**

Query.filter{ status == 0 }.filter{ requests > 5 }.from(5).sort(:id, name: :desc).size(10).to_json

**The result was equal:**

{
  
  "query": {
      
      "status": 0,
"requests": {
      
      "gt": 5
      
      }
  
  },
  
  "sort": [
  
  {
  
  "id": "asc"
  
  },
  
  {
  
  "name": "desc"
  
  }
  
  ],
  
  "size": 10,
  
  "from": 5

}
