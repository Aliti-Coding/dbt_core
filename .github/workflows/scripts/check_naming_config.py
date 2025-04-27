CONVENTIONS = {
    # SQL file conventions
    "sql": {
        "staging": {
            "pattern": r"^stg_[a-z0-9_]+\.sql$",
            "message": "Staging models should follow pattern: stg_<source>__<entity>.sql",
            "example": "stg_jaffle_shop__orders.sql",
        },
        "intermediate": {
            "pattern": r"^int_[a-z0-9_]+\.sql$",
            "message": "Intermediate models should follow pattern: int_<entity>_<verb>.sql",
            "example": "int_customer_orders.sql",
        },
        "marts": {
            "patterns": [
                r"^fct_[a-z0-9_]+\.sql$",
                r"^dim_[a-z0-9_]+\.sql$"
            ],
            "message": "Mart models should be prefixed with fct_ (facts) or dim_ (dimensions)",
            "examples": ["fct_orders.sql", "dim_customers.sql"],
        },
        "default": {
            "pattern": r"^[a-z0-9_]+\.sql$",
            "message": "SQL files should use snake_case naming",
        }
    },
    # YAML file conventions
    "yml": {
        "staging": {
            "pattern": r"^src_[a-z0-9_]+\.yml$",
            "message": "Model YAML files should use snake_case naming",
            "example": "source_.yml"
        }
        # ,
        # "default": {
        #     "pattern": r"^[a-z0-9_]+\.yml$",
        #     "message": "YAML files should use snake_case naming",
        # }
    },
    # Python file conventions
    # "py": {
    #     "scripts": {
    #         "pattern": r"^[a-z0-9_]+\.py$", 
    #         "message": "Python scripts should use snake_case naming",
    #         "example": "data_quality_check.py"
    #     },
    #     "default": {
    #         "pattern": r"^[a-z0-9_]+\.py$",
    #         "message": "Python files should use snake_case naming",
    #     }
    # },
    # Default convention for any file type not explicitly defined
    "default": {
        "pattern": r"^[a-z0-9_\-\.]+$",
        "message": "Files should use lowercase with underscores or hyphens",
    }
}
