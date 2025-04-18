![logo](https://codeberg.org/xXx_GLOCKrzmitz_xXx/filterpp_lib/raw/branch/master/screenshot.png)


# filter++ lib

filter++ lib is a blazingly fast library for filtering strings for swear words. nothing less, nothing more
in the worst case its 100X faster than other libraries, and sometimes its 10000X faster

> keep it simple stupid

filter++ lib provides a sane default blacklist 

filter++ lib is just a library
check out filter++ proper to see it implemented in the chat

# Bypass protection

filter++ lib will filter out messages that try to bypass with look alike letters.
for example: assuming "wonky" is a swear word, the following combinations will be correctly filtered

- wonky
- w o n k y
- woooonky
- w00nky
- WONKY
- ｗ〇〇N𝕜𝕐

# API
the complete API is in the repository's `API.md` file

here is a quick rundown

```lua
-- add word wonky to the blacklist
filterpp_lib.add_to_blacklist("wonky")

-- the blacklist needs to be reinitialized
filterpp_lib.initialize_blacklist()

local is_violating, bad_words = filterpp_lib.filter_text("wonky WOOOONKY")
-- is_violating - equals true because the word "wonky" is blacklisted
-- bad_words equals to
-- {
--   {1, 5}, -- first violating word, start and end position
--   {7, 14} -- second violating word, starts and end position
-- }

-- register a callback for when players swear
filterpp_lib.register_on_violation(function(name, message, bad_words)
    -- bad_words has the same format as the return value of filter_text()
    minetest.send_chat_player(name, string.format("you cant swear, you swore %d times", #bad_words))
end)

-- you should report a violation when you filter text and find any violations
if is_violating then
    filterpp_lib.report_violation("singleplayer", "wonky WOOOONKY", bad_words)
end

```

you can look at filter++ proper's source code for example of usage

# Command

filter++ lib adds the `manage_filter` command

```
manage_filters add <word> | remove <word> | list | return_to_default
```

the `filter++` privilege is needed to run the command

the `return_to_default` option resets the blacklist to the default blacklist


# Comparison with other filtering mods

## sofar's filter mod
- filter++ lib dosent add unrelated commands for moderation (kicking/muting)
- filter++ lib dosent add default punishment
- filter++ lib dosent register any callbacks for `minetest.register_on_chat_messages`
- filter++ lib provides a default blacklist
which makes it unusable if you want to use it as a filtering library if you want to use that callback too
- filter++ lib is order of magnitudes faster

## monk filterplus mod
- filter++ lib dosent add unrelated commands for moderation (kicking/muting)
- filter++ lib dosent register any callbacks for `minetest.register_on_chat_messages`
which makes it unusable if you want to use it as a filtering library if you want to use that callback too
- filter++ lib is order of magnitudes faster
- filter++ lib prevents bypassing with lookalike unicode characters
- filter++ lib's default blacklist only has english profanities, and is slightly bigger overall
- filter++ lib provides a complete and documented API
- filter++ lib will never give you snarky insults

# Benchmarks 

all benchmarks user filterplus's default blacklist

|                                              | filter++ lib no UTF-8 | filter++ |   filterplus   |     filter     |
|:--------------------------------------------:|:---------------------:|:--------:|:--------------:|:--------------:|
|       check a 170 letter sentence once       |         0,01ms        |  0,005ms |       1ms      |      20ms      |
|        check word "wanker" 10000 times       |         0,06ms        |   0,9ms  |      500ms     |      500ms     |
| check 100 character long message 10000 times |         0,2ms         |   13ms   | 147889ms (25m) | 96 431ms (16m) |

here are some graphs
![benchmark](https://codeberg.org/xXx_GLOCKrzmitz_xXx/filterpp_lib/raw/branch/master/benchmark.png)

here is the same but in logarithmic scale 
(units are meaningless here, just look at the relations)
![benchmark in logarithmic scale](https://codeberg.org/xXx_GLOCKrzmitz_xXx/filterpp_lib/raw/branch/master/benchmark_logarithmic.png)

## notes

during the longer benchmarks i was doing things in the background, but i think the overall message remains

the 170 letter sentence used is:
"i just joined this server and i don't know why you knob heads are so mean to me.
i just tried to relax for a day but you guys are screaming at me all the time, get a life."

the 100 character long message was just "A" repeated 100 times

all tests were made in development game to reduce the noise

since filter and filterplus don't support UTF-8, i also ran benchmarks without it for filter++
to show how much faster it is when it does comparable things.
the UTF-8 version is slightly faster in the first benchmark because the no UTF-8 filter++ uses older and slower version

filter++ lib can achieve this time by cleverly arranging its data so checking a word takes O(word_length),
unlike filter and filterplus that do it by having a huge list of lua patterns to check in O(word_length * registered_patterns).
the downside is that filter++ lib uses more memory than filter (though not more than filterplus, because i don't load a 6MB whitelist)



# Credits
- desojevic - [https://github.com/dsojevic/profanity-list](blacklist) that the default blacklist is based on
- monk - "encouragement"
- Me - i wrote the thing
