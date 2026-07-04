CREATE TABLE campaign_members (
    id BIGSERIAL PRIMARY KEY,
    campaign_id BIGINT NOT NULL,
    user_id BIGINT NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'PLAYER',
    CONSTRAINT fk_campaign_members_campaign FOREIGN KEY (campaign_id) REFERENCES campaigns(id),
    CONSTRAINT fk_campaign_members_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT uk_campaign_members UNIQUE (campaign_id, user_id),
    CONSTRAINT chk_campaign_members_role CHECK (role IN ('PLAYER', 'MASTER'))
);
