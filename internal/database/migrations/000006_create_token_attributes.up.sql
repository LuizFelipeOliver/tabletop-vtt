CREATE TABLE token_attributes (
    token_id BIGINT NOT NULL,
    attr_key VARCHAR(100) NOT NULL,
    attr_value TEXT,
    CONSTRAINT pk_token_attributes PRIMARY KEY (token_id, attr_key),
    CONSTRAINT fk_token_attributes_token FOREIGN KEY (token_id) REFERENCES tokens(id)
);
