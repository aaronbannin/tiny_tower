// fws_revenue_queries

/*
- revenue per day per platform
- arpdau per day per platform

*/

// some house keeping functions
// list distinct values for a key
db.statslog.distinct( "action" )
// 



// Revenue for a range
var startd = 1399766400;  // May 11th.
var endd = 1399852800;    // May 12th.
db.statslog.aggregate([
    { 
        "$match" :  { 
            "gameId" : "5239a9edbecd6a054f000001", 
            "action" : "purchase_complete", 
            "data.event_time"  : { 
                "$gte" : startd, 
                "$lt" : endd 
            }
        }
    },
    { 
        "$group" : { 
            "_id" : "$data.platform", 
            "sum" : { "$sum" : "$data.product_usd_cost" } 
        } 
    }
])


// Revenue by day
db.statslog.aggregate([
    { 
        "$match" :  { 
            "gameId" : "5239a9edbecd6a054f000001", 
            "action" : "purchase_complete", 
            "data.event_time"  : { 
                "$gte" : startd, 
                "$lt" : endd 
            }
        }
    },
	{
	   "$project" : {
	   	  "revenue" : "$data.product_usd_cost",
		  "date_format"  :  { 
			 "$substr" : [ { "$add" : [ new Date(0), { "$multiply" : [ "$datetime",  1000 ] } ] }, 0, 10 ] 
		  }
	   }
	},
    { 
        "$group" : { 
            "_id" : "$date_format", 
            "sum" : { "$sum" : "$revenue" } 
        } 
    }
])




// arpdau
db.statslog.aggregate([
	{ // revenue match
		"$match" :  { 
			"gameId" : "5239a9edbecd6a054f000001", 
			"action" : "purchase_complete", 
			"data.event_time"  : { 
				"$gte" : startd, 
				"$lt" : endd 
			}
		}
	},
	{ // dau match 
	   "$match" :  { 
		  "gameId" : "5239a9edbecd6a054f000001", 
		  "action" : "session_begin", 
		  "datetime"  : { 
			 "$gte" : startd, 
			 "$lt" : endd 
		  } 
	   }
	}
])
	
	{ 
		"$group" : { 
			"_id" : "$date_format", 
			"sum" : { "$sum" : "$revenue" } 
		} 
	}
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




