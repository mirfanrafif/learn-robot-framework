# Robot Framework - Page Object Model

This project demonstrates Robot Framework test automation with the **Page Object Model (POM)** design pattern.

## Setup

1. **Activate Virtual Environment**

   ```bash
   source virtualenv/bin/activate
   ```

2. **Install Selenium Library**

   ```bash
   pip install robotframework-seleniumlibrary
   ```

3. **Install WebDriver** (ChromeDriver for Chrome)

   ```bash
   # Option 1: Using webdriver-manager
   pip install webdriver-manager

   # Option 2: Download manually from https://chromedriver.chromium.org/
   ```

## Project Structure

```
.
├── pages/                    # Page Objects (locators & keywords)
│   ├── google_page.robot    # Google search page
│   ├── github_page.robot    # GitHub homepage
│   └── login_page.robot     # Login page example
├── tests/                    # Test Suites
│   ├── example_test.robot   # Basic Robot Framework tests
│   ├── web_example.robot    # Web tests using page objects
│   └── login_test.robot     # Login functionality tests
├── resources/               # Shared resources
│   └── common_keywords.robot
├── results/                 # Test execution results
└── virtualenv/             # Python virtual environment
```

## Page Object Model (POM)

### What is POM?

The Page Object Model is a design pattern that:

- **Separates** test logic from page-specific code
- **Reduces** code duplication
- **Improves** maintainability
- **Makes** tests more readable

### Structure

**Page Objects** (`pages/*.robot`):

- Contain locators (element selectors)
- Define keywords for page interactions
- Handle page-specific logic

**Test Cases** (`tests/*.robot`):

- Import page objects as resources
- Use page keywords to write tests
- Focus on test logic, not implementation details

### Example

**Page Object** (`pages/google_page.robot`):

```robot
*** Variables ***
${SEARCH_INPUT}    name=q

*** Keywords ***
Enter Search Term
    [Arguments]    ${term}
    Input Text    ${SEARCH_INPUT}    ${term}
```

**Test** (`tests/web_example.robot`):

```robot
*** Settings ***
Resource    ../pages/google_page.robot

*** Test Cases ***
Search Test
    Open Google Search Page
    Enter Search Term    Robot Framework
    Submit Search
```

## Running Tests

### Run all web tests

```bash
robot --outputdir results tests/web_example.robot
```

### Run login tests

```bash
robot --outputdir results tests/login_test.robot
```

### Run tests by tag

```bash
# Run only positive test cases
robot --include positive --outputdir results tests/

# Run only login tests
robot --include login --outputdir results tests/
```

### Run specific test case

```bash
robot --test "Successful Login Test" --outputdir results tests/login_test.robot
```

## Test Reports

After execution, check:

- `results/report.html` - High-level test report
- `results/log.html` - Detailed execution log
- `results/output.xml` - Machine-readable results

## Best Practices

### Page Objects

1. ✅ Keep all locators in variables section
2. ✅ One page object per page/component
3. ✅ Keywords should represent user actions
4. ✅ Don't put assertions in page objects (put them in tests)

### Tests

1. ✅ Use descriptive test names
2. ✅ Add [Documentation] and [Tags]
3. ✅ One test = one scenario
4. ✅ Use page object keywords, not SeleniumLibrary directly

### Example Structure

```robot
# ❌ Bad - Locators and logic in test
*** Test Cases ***
Login Test
    Input Text    id=username    student
    Click Button    id=submit

# ✅ Good - Using page objects
*** Test Cases ***
Login Test
    Enter Username    student
    Click Login Button
```

## Available Test Suites

### 1. Basic Tests (`example_test.robot`)

- Variables, lists, dictionaries
- String manipulation
- No browser required

### 2. Web Examples (`web_example.robot`)

- Google search tests
- GitHub navigation tests
- Demonstrates page object usage

### 3. Login Tests (`login_test.robot`)

- Positive login scenario
- Negative test cases
- Form validation

## Common Commands

```bash
# Run all tests with specific browser
robot --variable BROWSER:firefox --outputdir results tests/

# Run tests in headless mode (add to page object)
robot --variable BROWSER:headlesschrome --outputdir results tests/

# Parallel execution (requires robotframework-pabot)
pip install robotframework-pabot
pabot --processes 4 --outputdir results tests/

# Generate test documentation
robot --output NONE --report NONE --log NONE --outputdir docs tests/
```

## Tips

1. **Locator Strategy**: Prefer `id` > `name` > `css` > `xpath`
2. **Waits**: Always use explicit waits (`Wait Until...`)
3. **Reusability**: Create common keywords for repeated actions
4. **Naming**: Use clear, action-based names for keywords
5. **Documentation**: Document all keywords and test cases

## Learning Resources

- [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/)
- [Page Object Model Pattern](https://www.selenium.dev/documentation/test_practices/encouraged/page_object_models/)

## Troubleshooting

**Issue**: WebDriver not found

```bash
# Solution: Install webdriver-manager
pip install webdriver-manager
```

**Issue**: Tests timing out

```robot
# Solution: Increase timeouts in page objects
Wait Until Page Contains Element    ${LOCATOR}    timeout=20s
```

**Issue**: Element not found

```robot
# Solution: Add explicit wait before interaction
Wait Until Element Is Visible    ${LOCATOR}
Click Element    ${LOCATOR}
```
