// fws_engagement_queries
/*
- installs per day by platform
x dau by platform
*/



// installs per day FOR ANDROID
var startd = 1399766400;  // May 11th.
var endd = 1400544000;    // May 20th.
db.statslog.aggregate([
{ 
   "$match" :  { 
      "gameId" : "5239a9edbecd6a054f000001", 
      "action" : "registerUser", 
      "datetime"  : { 
         "$gte" : startd, 
         "$lt" : endd 
      },
      "data.platform" : "android"
   }
},
{
   "$project" : {
      "date_format"  :  { 
         "$substr" : [ { "$add" : [ new Date(0), { "$multiply" : [ "$datetime",  1000 ] } ] }, 0, 10 ] 
      }
   }
},
{ 
   "$group" : { 
      "_id" : "$date_format", 
      "count" : { 
         "$sum" : 1 
      }
   }       
},
])

// dau by platform
db.statslog.aggregate([
{ 
   "$match" :  { 
      "gameId" : "5239a9edbecd6a054f000001", 
      "action" : "session_begin", 
      "datetime"  : { 
         "$gte" : startd, 
         "$lt" : endd 
      } 
   }
},
{
   "$project" : {
   	  "platform" : "$data.platform",
      "date_format"  :  { 
         "$substr" : [ { "$add" : [ new Date(0), { "$multiply" : [ "$datetime",  1000 ] } ] }, 0, 10 ] 
      }
   }
},
{ 
   "$group" : { 
      "_id" : { "date_format" : "$date_format", "platform" : "$platform" },
      "count" : { 
         "$sum" : 1 
      }
   }       
},
])


// dau by day
db.statslog.aggregate([
{ 
   "$match" :  { 
      "gameId" : "5239a9edbecd6a054f000001", 
      "action" : "session_begin", 
      "datetime"  : { 
         "$gte" : startd, 
         "$lt" : endd 
      } 
   }
},
{
   "$project" : {
      "date_format"  :  { 
         "$substr" : [ { "$add" : [ new Date(0), { "$multiply" : [ "$datetime",  1000 ] } ] }, 0, 10 ] 
      }
   }
},
{ 
   "$group" : { 
      "_id" : "$date_format",
      "count" : { 
         "$sum" : 1 
      }
   }       
},
])
