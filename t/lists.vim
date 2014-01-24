" From http://learnvimscriptthehardway.stevelosh.com/chapters/35.html

describe 'vimscript'
    it 'lists can use indexing'
        Expect [0, [1,2]][1] == [1, 2]
    end

    it 'lists can do negative indexing'
        Expect [5, [1,2]][-2] == 5
    end

    it 'lists can be sliced'
        Expect ['a', 'b', 'c', 'd', 'e'][0:2] == ['a','b','c']
    end

    it 'list slicing can exceed upper bounds without error'
        Expect ['a', 'b', 'c', 'd', 'e'][0:999] == ['a','b','c','d','e']
    end

    it 'list slicing can be negative'
        Expect ['a', 'b', 'c', 'd', 'e'][-2:-1] == ['d','e']
    end

    it 'list slicing indexes can be omitted'
        Expect ['a', 'b', 'c', 'd', 'e'][:1] == ['a','b']
        Expect ['a', 'b', 'c', 'd', 'e'][3:] == ['d','e']
    end

    it 'strings can also be sliced'
        Expect "abcd"[0:2] == 'abc'
    end

    it 'strings cannot be used with bare negative indexes'
        Expect "abcd"[-1] == ''
    end

    it 'strings can be used with negative indexes in a range'
        Expect "abcd"[-1] . "abcd"[-2:] == 'cd'
    end

    it 'lists can be combined with a + operator'
        Expect ['a', 'b'] + ['c'] == ['a','b','c']
    end

    it 'adds to lists with add() function'
        let l:foo = ['a']
        call add(l:foo, 'b')
        Expect l:foo == ['a', 'b']
    end

    it 'len() shows a list length'
        let l:foo = ['a', 'b']
        Expect len(l:foo) == 2
    end

    it 'get() returns an indexed value without error (will fallback)'
        let l:foo = ['a', 'b']
        Expect get(l:foo, 0, 'default') == 'a'
        Expect get(l:foo, 100, 'default') == 'default'
    end

    it 'index() returns the item at that index or -1 if not found'
        let l:foo = ['a', 'b']
        Expect index(l:foo, 'b') == 1
        Expect index(l:foo, 'x') == -1
    end

    it 'joins lists with the join command'
        Expect join([1, 2, 3], '...') == '1...2...3'
        Expect join(['a', 'b', 'c'], '') == 'abc'
    end

    it 'reverses the list order with reverse()'
        Expect reverse([1, 2, 3]) == [3, 2, 1]
        Expect reverse([3, 2, 1]) == [1, 2, 3]
        Expect reverse([1, 2, 3]) != [1, 2, 3]
    end

    it 'merges two lists with extend()'
        Expect extend([1,2], ['a','b', 3]) == [1,2,'a','b',3]
        Expect extend(['a','b','c'], ['d'], 2) == ['a', 'b', 'd', 'c']
    end
end
