CREATE TABLE campaigns (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(500),
    creator_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_campaigns_creator FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE INDEX idx_campaigns_creator ON campaigns(creator_id);
