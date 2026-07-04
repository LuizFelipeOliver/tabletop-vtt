CREATE TABLE roll_history (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    campaign_id BIGINT NOT NULL,
    expression VARCHAR(50) NOT NULL,
    result VARCHAR(100) NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_roll_history_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_roll_history_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(id)
);

CREATE INDEX idx_roll_history_campaign ON roll_history(campaign_id);
CREATE INDEX idx_roll_history_user ON roll_history(user_id);
CREATE INDEX idx_roll_history_timestamp ON roll_history(timestamp);
