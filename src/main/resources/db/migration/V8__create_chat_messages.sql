CREATE TABLE chat_messages (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    campaign_id BIGINT NOT NULL,
    content TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_chat_messages_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_chat_messages_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(id)
);

CREATE INDEX idx_chat_messages_campaign ON chat_messages(campaign_id);
CREATE INDEX idx_chat_messages_timestamp ON chat_messages(timestamp);
