INSERT INTO UserStateTransition(UserID, WorkflowStateTransitionID)
VALUES
('272afbf4-cc2d-4490-b78c-5fad1d5a1084', 1),
('272afbf4-cc2d-4490-b78c-5fad1d5a1084', 4),
('272afbf4-cc2d-4490-b78c-5fad1d5a1084', 5);


INSERT INTO RoleStateTransition(RoleID, WorkflowStateTransitionID)
VALUES
('3d90d620-a5da-4ff8-acb6-6c25585daa0c', 1),
('3d90d620-a5da-4ff8-acb6-6c25585daa0c', 4),
('3d90d620-a5da-4ff8-acb6-6c25585daa0c', 5);

-- CASOS
INSERT INTO [case](WorkflowID, Description, CasePriorityID, StateID, CreationDate, LastModificationDate, EffectiveDate, UserID)
VALUES
(2, 'Gestión de cobranza - TEST 1', 1, 1, GETDATE(), GETDATE(), GETDATE(), '272afbf4-cc2d-4490-b78c-5fad1d5a1084'),
(2, 'Gestión de cobranza - TEST 2', 2, 1, GETDATE(), GETDATE(), GETDATE(), '73a2fde3-7ac3-43fd-9afb-99c55d9a8c5d'),
(2, 'Gestión de cobranza - TEST 3', 3, 1, GETDATE(), GETDATE(), GETDATE(), '272afbf4-cc2d-4490-b78c-5fad1d5a1084');