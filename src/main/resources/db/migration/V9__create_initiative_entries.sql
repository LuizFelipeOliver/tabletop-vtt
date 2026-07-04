CREATE TABLE initiative_entries (
    id BIGSERIAL PRIMARY KEY,
    campaign_id BIGINT NOT NULL,
    token_id BIGINT,
    order_value INTEGER NOT NULL,
    label VARCHAR(100),
    CONSTRAINT fk_initiative_entries_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(id),
    CONSTRAINT fk_initiative_entries_token FOREIGN KEY (token_id) REFERENCES tokens(id),
    CONSTRAINT uk_initiative_entries_order UNIQUE (campaign_id, order_value)
);

CREATE INDEX idx_initiative_entries_campaign ON initiative_entries(campaign_id);
