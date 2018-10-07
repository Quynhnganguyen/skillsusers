# README

## Ruby version
2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux]

## System dependencies
Database: postgresql 9.4

## Configuration
bundle install

## Database creation
rake db:create

## Database insert
**Skills initialization**  
Method: POST/   
URL: */skills/create_all  
Request body: (json)  

    {
    	"skills": [
    	    {
    	        "id": 1,
        		"name": "Football",
        		"parent_id": null
        	},
    	    {
    	        "id": 2,
        		"name": "Basketball",
        		"parent_id": null
        	},
    	    {
    	        "id": 3,
        		"name": "Foot",
        		"parent_id": 1
        	},
        	{
        	    "id": 4,
        		"name": "Basket",
        		"parent_id": 2
        	},
        	{
        	    "id": 5,
        		"name": "Socker",
        		"parent_id": 1
        	}
    	]
    }

**Users initialization**  
Method: POST/   
URL: */users/create_all  
Request body: (json)  

    {
    	"users": [
        	{
        	    "id": 1,
        		"points": "100"
        	},{
        	    "id": 2,
        		"points": "200"
        	},{
        	    "id": 3,
        		"points": "100"
        	},{
        	    "id": 4,
        		"points": "50"
        	},{
        	    "id": 5,
        		"points": "10"
        	}
    	]
    }
**SkillsUsers initialization**  
Method: POST/   
URL: */users/add_skills_to_various  
Request body: (json)  

    {
		"skills_users": [
			{
				"skill_id": 1,
				"user_id": 1
			},
			{
				"skill_id": 1,
				"user_id": 2
			},
			{
				"skill_id": 3,
				"user_id": 3
			},
			{
				"skill_id": 2,
				"user_id": 4
			},
			{
				"skill_id": 5,
				"user_id": 5
			}
		]
	}
## Show table result
http://localhost:3000/skills/report_by_sql  
http://localhost:3000/skills/report_without_sql