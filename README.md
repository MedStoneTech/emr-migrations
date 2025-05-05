# EMR Database Migration Scripts Convention

## Naming Convention

We use a structured naming convention for our database migration scripts to maintain order and organization:

### Format

`V{MajorVersion}_{SequentialNumber}_{Description}.sql`

For example:

- `V1_01_CreateUserTable.sql`
- `V1_02_AddUserEmailColumn.sql`
- `V2_01_CreateProductTable.sql`

### Corresponding Rollback Scripts

Each versioning script has a corresponding rollback script with the same naming pattern but using `R` instead of `V`:

- `R1_01_CreateUserTable.sql`
- `R1_02_AddUserEmailColumn.sql`
- `R2_01_CreateProductTable.sql`

## Versioning Logic

### Major Version Number

The first number represents a major version, module, or sprint of the project:

- All scripts with `V1_XX` belong to "Phase 1" or "Sprint 1"
- All scripts with `V2_XX` belong to "Phase 2" or "Sprint 2"
- And so on...

### Sequential Number

The second number (after the underscore) represents sequential changes within that major version:

- `01`, `02`, `03`, etc.
- These must be in sequential order as they will be executed in numerical order

### Benefits of This Approach

1. **Logical grouping**: Related changes are grouped under the same major version
2. **Deployment control**: Facilitates deploying all scripts of a specific version at once
3. **Clear execution order**: Scripts are executed first by major version, then by sequential number
4. **Maintenance**: Makes it easier to understand which scripts are related to which project phase

## When to Increment the Major Version

Typically, you would increment the major version number when:

- Completing a sprint/iteration
- Releasing a new version of your application
- Beginning a new set of related features

## Execution Order Example

The following scripts would be executed in this order:

1. `V1_01_CreateUserTable.sql`
2. `V1_02_AddUserEmailColumn.sql`
3. `V1_03_CreateProductTable.sql`
4. `V2_01_CreateOrderTable.sql`
5. `V2_02_AddInventorySystem.sql`

## Validation

Our CI pipeline validates that:

1. All SQL scripts have valid syntax
2. Every versioning script (`V*.sql`) has a corresponding rollback script (`R*.sql`)
3. All versioning scripts (`V*.sql`) are idempotent - they can be executed multiple times without causing errors

### Idempotency Testing

Our GitHub Actions workflow runs each versioning migration script twice to ensure it doesn't fail on the second execution. This ensures that:

- Scripts include proper guards (`IF NOT EXISTS`, `IF EXISTS` checks)
- Duplicate executions won't break the database
- Migrations can be safely retried in case of partial deployment failures

This is crucial for reliable database deployments in production environments.
