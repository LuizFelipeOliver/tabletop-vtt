CREATE TABLE scenes (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(500),
    grid_width INTEGER NOT NULL DEFAULT 20,
    grid_height INTEGER NOT NULL DEFAULT 15,
    cell_size INTEGER NOT NULL DEFAULT 50,
    campaign_id BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_scenes_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(id)
);

CREATE INDEX idx_scenes_campaign ON scenes(campaign_id);
