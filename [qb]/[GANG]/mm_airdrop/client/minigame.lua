function Airdrop:StartHackMinigame(crate)
    local success = lib.skillCheck('easy')
    self:OnMinigameEnd(success, crate)
end