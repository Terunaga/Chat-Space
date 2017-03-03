# Chat-Space Database Structures

## Users

### users_structure
| column                | type   | constraint                |
|-----------------------|--------|---------------------------|
| name                  | string | index, unique, null false |
| email                 | string | unique, null false        |
| password              | string | unique, null false        |
| confirmation password | string | unique, null false        |

### users_associations
* has_many :groups, through: :chat_groups
* has_many :chat_groups
* has_many :messages


## Groups

### groups_structure
| column | type   | constraint         |
|--------|--------|--------------------|
| name   | string | unique, null false |

### groups_associations
* has_many :users, through: :chat_groups
* has_many :chat_groups
* has_many :messages


## ChatGroups

### users_groups_structure
| column   | type    | constraint                     |
|----------|---------|--------------------------------|
| user_id  | integer | foreign_key, index, null false |
| group_id | integer | foreign_key, index, null false |

### chat_groups_associations
* belongs_to :user
* belongs_to :group


## Messages

### messages_table
| column   | type    | constraint                     |
|----------|---------|--------------------------------|
| user_id  | integer | foreign_key, index, null false |
| group_id | integer | foreign_key, index, null false |
| message  | text    |                                |
| image    | string  |                                |

### messages_associations
* belongs_to :user
* belongs_to :group
