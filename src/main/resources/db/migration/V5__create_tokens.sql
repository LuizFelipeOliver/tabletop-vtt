CREATE TABLE tokens (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image_url VARCHAR(500),
    x DOUBLE PRECISION NOT NULL DEFAULT 0,
    y DOUBLE PRECISION NOT NULL DEFAULT 0,
    width DOUBLE PRECISION,
    height DOUBLE PRECISION,
    scene_id BIGINT,
    campaign_id BIGINT NOT NULL,
    created_by BIGINT NOT NULL,
    controlled_by BIGINT,
    CONSTRAINT fk_tokens_scene FOREIGN KEY (scene_id) REFERENCES scenes(id),
    CONSTRAINT fk_tokens_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(id),
    CONSTRAINT fk_tokens_created_by FOREIGN KEY (created_by) REFERENCES users(id),
    CONSTRAINT fk_tokens_controlled_by FOREIGN KEY (controlled_by) REFERENCES users(id)
);

CREATE INDEX idx_tokens_campaign ON tokens(campaign_id);
CREATE INDEX idx_tokens_scene ON tokens(scene_id);
CREATE INDEX idx_tokens_created_by ON tokens(created_by);
CREATE INDEX idx_tokens_controlled_by ON tokens(controlled_by);
