# Pester 
Pester a testing and mocking framework for Powershell.

## Imp commands
```powershell
Invoke-Pester -Output Detailed files.Tests.ps1

# Extra parametes can be passed using containers
$container = New-PesterContainer -Path 'file.Tests.ps1' -Data @{ File = "Get-Emoji.ps1" }
Invoke-Pester -Container $container -Output Detailed

# Getting multiple files
$files = 'Get-Emoji.ps1', 'Get-Planet.ps1'
$containers = $files | ForEach-Object {
    New-PesterContainer -Path 'CodingStyle.Tests.ps1' -Data @{ File = $_ }
}

Invoke-Pester -Container $containers -Output Detailed

# Doing the same thing with using data
$files = 'Get-Emoji.ps1', 'Get-Planet.ps1'
$data = $files | ForEach-Object {
    @{ File = $_ }
}

$container = New-PesterContainer -Path 'CodingStyle.Tests.ps1' -Data $data
Invoke-Pester -Container $container -Output Detailed
#There is no advantage in using one over the other, choose the one that suits your needs better.

# Running multiple files with the same data
$data =  @{ File = "Get-Emoji.ps1" }
$containers = @(
    (New-PesterContainer -Path 'CodingStyle.Tests.ps1' -Data $data)
    (New-PesterContainer -Path 'BadWords.Tests.ps1' -Data $data)
)
Invoke-Pester -Container $containers -Output Detailed

# or simply

$data =  @{ File = "Get-Emoji.ps1" }
$container = New-PesterContainer -Path 'CodingStyle.Tests.ps1', 'BadWords.Tests.ps1' -Data $data
Invoke-Pester -Container $container -Output Detailed

# Never understood this
$files = Get-ChildItem -Filter '*.ps1' -Recurse
$data = $files | ForEach-Object {
    @{ File = $_.FullName }
}


$containers = New-PesterContainer -Path '*Style.Tests.ps1' -Data $data
Invoke-Pester -Container $containers -Output Detailed
```

# Discovery Block
```powershell
    BeforeDiscovery {
        $files = Get-ChildItem -Path $PSScriptRoot -Filter '*.ps1' -Recurse
    }

    Describe "File - <_>" -ForEach $files {
        Context "Whitespace" {
            It "There is no extra whitespace following a line" {
                # ...
            }

            It "File ends with an empty line" {
                # ...
            }
        }
    }
```

# Basics
- Used for
```markdown
- Unit testing
- Integration testing
- Mocking
- Whole environment testing
- Computer deployment testing
- Database configuration testing
```

- File format
```markdown
- *.Test.ps1
```

- Available functions
```markdown
- Describe -> suite of tests
- Context -> nested-suite of tests 
- It -> individual test
- Should -> assert
- Mock
- BeforeAll  
- BeforeEach
- AfterAll
- AfterEach
```

- Can test
```markdown
- scripts
- Functions
- Cmdlets
- Modules
```

- How It works
  - When a test is run, Pester first discovers all the blocks and the code, then it runs the tests on the final generated code.
  - Internally, it converts the entire test file into a PowerShell script and then runs it. This is called the "Discovery" and "Run" phase.
  - Use the `-ForEach` loop whenever possible to avoid porting problems.

- Data driven testing
```powershell
# data driven tesitng can also be done on the describe block  too
Describe "<expected>" {  # expected is the parameter passed to the it blocks
    It "Returns <expected> (<name>)" -ForEach @( # expexcted and name are parameters,
        @{ Name = "cactus"; Expected = '🌵'} 
        @{ Name = "giraffe"; Expected = '🦒'}
    ) {
        Get-Emoji -Name $name | Should -Be $expected
    } 
}

# Other variation
Describe "Animals " { It "<_>" -ForEach @("🐛", "🐶") { # _ is the parameter passed to the it blocks
        # ...
    }
}
```

Continue from [here](https://pester.dev/docs/usage/data-driven-tests)

Below topics still needs to be learnt
1. params in test file
2. BeforeDiscoveru block
