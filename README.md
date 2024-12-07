# ruby-openfga

## Running RSpec for all specs in the project

```shell
  $ bin/rspec --format documentation
```

## Running in documentation formatter mode

Sample of how to do that

```shell
  $ bin/rspec spec/redis_container_spec.rb --format documentation
```

## Running in profile mode to see the slowest specs

In the following example, we ask for the top 2 slowest examples

```shell
  $ bin/rspec --profile 2
```

Prints out something like the following

```
Top 2 slowest examples (0.00985 seconds, 0.3% of total time):
  OpenFGA API #stores when creating an store should have a valid id
    0.0071 seconds ./spec/openfga_spec.rb:15
  OpenFGA API #stores when creating an store should match the name
    0.00274 seconds ./spec/openfga_spec.rb:19

Top 2 slowest example groups:
  OpenFGA API #stores
    0.02335 seconds average (0.04669 seconds / 2 examples) ./spec/openfga_spec.rb:8
  Redis
    0.00045 seconds average (0.00091 seconds / 2 examples) ./spec/redis_container_spec.rb:21

Finished in 2.93 seconds (files took 0.33023 seconds to load)
```

## Running out only specific tests (OpenFGA for instance)

```shell
  $ bin/rspec spec/openfga --profile 2
```

## Running only the failed specs

```shell
  $ bin/rspec --only-failures
```
