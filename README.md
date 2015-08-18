Basic Workflow
===

GET http://{host}/user/{username}/api/v1/viz?api_key={apikey}&types=table

{"visualizations":[
  {"id":"f3a700b2-4567-11e5-a479-021f5192d8c7",
  "name":"zones",
  "map_id":"c46bce53-5082-44d7-b5d3-2c4ac833b82f",
  "active_layer_id":null,"type":"table","tags":[],
  "description":null,"privacy":"PRIVATE",
  "stats":{...},"created_at":"2015-08-18T05:14:07+00:00","updated_at":"2015-08-18T05:14:08+00:00",
  "permission":{"id":"fa48f94e-4cba-4c24-b217-76dd7d7879b4",
  "owner":{"id":"ced1c63c-dbd8-407e-89dc-c5c290f1abc0","username":"{username}","email":"{email}",
  "avatar_url":"...","base_url":"...","quota_in_bytes":104857600,
  "db_size_in_bytes":42999808},"entity":{"id":"f3a700b2-4567-11e5-a479-021f5192d8c7","type":"vis"},"acl":[],
  "created_at":"2015-08-18T05:14:02+00:00","updated_at":"2015-08-18T05:14:07+00:00"},"locked":false,"source":null,
  "title":null,"parent_id":null,"license":null,"attributions":null,"kind":"geom","likes":0,"prev_id":null,
  "next_id":null,"transition_options":{},"active_child":null,
  "table":{
--> HERE!!    "id":"5133bd9f-6102-42e4-9669-3fa4ee73d783",
  "name":"zones","permission":{"id":"fa48f94e-4cba-4c24-b217-76dd7d7879b4",
  "owner":{...},
  {"id":"99f10c0e-4565-11e5-a902-021f5192d8c7",
  "name":"pop5","map_id":"033d4d5e-b9f8-44f3-82e2-4fe68999e014",
  "active_layer_id":null,"type":"table","tags":[],
  "description":null,"privacy":"PRIVATE",
  "stats":{...},"created_at":"2015-08-18T04:57:18+00:00","updated_at":"2015-08-18T05:00:05+00:00",
  "permission":{"id":"8c6d71e1-c3aa-4363-80c8-54b8934ccc08","owner":{"id":"ced1c63c-dbd8-407e-89dc-c5c290f1abc0","username":"{}","email":"{}",
  "avatar_url":"...","base_url":"...","quota_in_bytes":104857600,
  "db_size_in_bytes":42999808},"entity":{"id":"99f10c0e-4565-11e5-a902-021f5192d8c7","type":"vis"},
  "acl":[{"type":"org","entity":{"id":"ACLID","name":"{}","avatar_url":null},"access":"rw"}],"created_at":"2015-08-18T04:57:17+00:00",
  "updated_at":"2015-08-18T05:00:05+00:00"},"locked":false,"source":null,"title":null,"parent_id":null,"license":null,
  "attributions":null,"kind":"geom","likes":0,"prev_id":null,"next_id":null,"transition_options":{"time":0},"active_child":null,
  "table":{
--> HERE!!  "id":"0bd2ba66-6c33-47bc-854d-020174200470",
  "name":"pop5","permission":{"id":"8c6d71e1-c3aa-4363-80c8-54b8934ccc08",
  "owner":{"id":"ced1c63c-dbd8-407e-89dc-c5c290f1abc0","username":"{}","email":"{}","avatar_url":"{}",
  "base_url":"{}","quota_in_bytes":104857600,"db_size_in_bytes":42999808},
  "entity":{"id":"99f10c0e-4565-11e5-a902-021f5192d8c7","type":"vis"},
  "acl":[{"type":"org","entity":{"id":"ACLID","name":"{}","avatar_url":null},"access":"rw"}],
  "created_at":"2015-08-18T04:57:17+00:00","updated_at":"2015-08-18T05:00:05+00:00"},"geometry_types":[],
  "privacy":"PRIVATE","updated_at":"2015-08-18T04:57:18+00:00","size":278528,"row_count":2501},
  "external_source":{},"synchronization":null,"children":[],"liked":false},
...

-- pop5
GET http://maps.veitchlister.com.au/user/andrewnewman/api/v1/tables/0bd2ba66-6c33-47bc-854d-020174200470?api_key=e0755fb2ff5bfae8c333fe6be53f3038ae800dc6
-- zones
GET http://maps.veitchlister.com.au/user/andrewnewman/api/v1/tables/5133bd9f-6102-42e4-9669-3fa4ee73d783?api_key=e0755fb2ff5bfae8c333fe6be53f3038ae800dc6

{"id":"0bd2ba66-6c33-47bc-854d-020174200470","name":"pop5","privacy":"PRIVATE","schema":[["cartodb_id","number"],["the_geom","geometry","geometry","geometry"],
["population","string"],["zone_id","string"],["created_at","date"],["updated_at","date"]],"updated_at":"2015-08-18T04:57:18+00:00","rows_counted":2501,
"table_size":278528,"map_id":"033d4d5e-b9f8-44f3-82e2-4fe68999e014","description":null,"geometry_types":[],
"table_visualization":{"id":"99f10c0e-4565-11e5-a902-021f5192d8c7","name":"pop5","map_id":"033d4d5e-b9f8-44f3-82e2-4fe68999e014","active_layer_id":null,
"type":"table","tags":[],"description":null,"privacy":"PRIVATE","stats":{},"external_source":{},"synchronization":null,"related_tables":[],"children":[],
"liked":false},"dependent_visualizations":[],"non_dependent_visualizations":[],"synchronization":{}}

-- Just the ACL bit maybe - "acl":[{"type":"org","entity":{"id":"ff17af51-7c21-4077-91c8-90cfa4d61ee7","name":"vlc","avatar_url":null},"access":"rw"}]

PUT http://maps.veitchlister.com.au/user/andrewnewman/api/v1/viz/99f10c0e-4565-11e5-a902-021f5192d8c7

{"id":"99f10c0e-4565-11e5-a902-021f5192d8c7","name":"pop5","map_id":"033d4d5e-b9f8-44f3-82e2-4fe68999e014",
"active_layer_id":null,"type":"table","tags":[],"description":null,"privacy":"PRIVATE",
"created_at":"2015-08-18T04:57:18+00:00","updated_at":"2015-08-18T04:57:43+00:00",
"permission":{"id":"8c6d71e1-c3aa-4363-80c8-54b8934ccc08","owner":{"id":"ced1c63c-dbd8-407e-89dc-c5c290f1abc0",
"username":"{}","avatar_url":"{}",
"base_url":"{}"},"entity":{"id":"99f10c0e-4565-11e5-a902-021f5192d8c7",
"type":"vis"},"acl":[{"type":"org","entity":{"id":"ff17af51-7c21-4077-91c8-90cfa4d61ee7","name":"{}","avatar_url":null},
"access":"rw"}],
...
