### Setup

1. Install Ruby
2. Install Bundler `gem install bundler`
3. Run `bundle install` This will install all dependencies for our test runner, rspec.
4. Run `bundle exec rspec` This will run all unit tests, Please ensure all tests are green.
5. Fork this repository using your github account.
6. Create a local branch from your fork.
7. When you are done, Please open a pull request from your local branch to my main branch.


If you have any question or clarification about the code. Please create an issue on the main repo and tag me @renlesterdg

### What do we expect?

1. Please make multiple commits with good commit message. Do not show final code change in a single commit. Show us your best code and the steps you take to refactor this code.
2. We dont like commit messages like "fix typo", "update code", "housekeeping", "cleanup code", use git fixup for this cases.
3. Good clean code.
4. Meaningful names.
5. Unit tests are all passing (green).
6. New scenario is added with specs (unit tests).

## Story

Hi and welcome to team Gilded Rose. As you know, we are a small inn
with a prime location in a prominent city run by a friendly innkeeper
named Allison. We also buy and sell only the finest
goods. Unfortunately, our goods are constantly degrading in quality as
they approach their sell by date. We have a system in place that
updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add
the new feature to our system so that we can begin selling a new
category of items. First an introduction to our system:

### Requirements

- All items have a `sell_in` value which denotes the number of days we
  have to sell the item
- All items have a `quality` value which denotes how valuable the item
  is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

  - Once the sell by date has passed, `quality` degrades twice as fast
  - The `quality` of an item is never negative
  - `Aged Brie` actually increases in `quality` the older it gets
  - The `quality` of an item is never more than 50
  - `Sulfuras`, being a legendary item, has no sell by date nor
    decreases in `quality`
  - `Backstage Passes`, like `Aged Brie`, increases in `quality` as its
    `sell_in` value approaches; `quality` increases by 2 when there are 10
    days or less and by 3 when there are 5 days or less but `quality`
    drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- `Conjured` items degrade in `quality` twice as fast as normal items

Feel free to make any changes to the `update_quality` method and add any
new code as long as everything still works correctly. However, do not
alter the `Item` class as it belongs to the goblin in the corner who
will insta-rage and one-shot you as he doesn't believe in shared code
ownership.

Just for clarification, an item can never have its `quality` increase
above 50, however `Sulfuras` is a legendary item and as such its
`quality` is 80 and it never alters.

### Instructions

- Given the above requirements, update `#update_quality` in `gilded_rose.rb` to support `Conjured` items.
- Please refactor the implementation of `gilded_rose.rb` and make it more readable and maintainable.
- Hint: Make use of `gilded_rose_spec.rb`.
- Be prepared to talk about your approach and resulting implementation.
