describe 'vimscript'
    it 'dictionaries can be referenced by indexes'
        Expect {'a': 1, 100: 'foo',}['a'] == 1
    end

    it 'dictionaries can be referenced by non-string indexes'
        Expect {'a': 1, 100: 'foo',}[100] == 'foo'
    end

    it 'dictionaries can be used with dot-style notation'
        Expect {'a': 1, 100: 'foo',}.a == 1
        Expect {'a': 1, 100: 'foo',}.100 == 'foo'
    end

    it 'dictionaries can be added to by assigning them like variables'
        let l:foo = {'a': 1}
        let l:foo.a = 100
        let l:foo.b = 200
        Expect l:foo == {'a': 100, 'b': 200}
    end

    it 'dictionary values can be removed the same way'
        let l:foo = {'a': 100, 'b': 200}
        let l:test = remove(l:foo, 'a')
        unlet l:foo.b
        Expect l:foo == {}
        Expect l:test == 100
    end

    it 'dictionary values can use get()'
        Expect get({'a': 100}, 'a', 'default') == 100
        Expect get({'a': 100}, 'b', 'default') == 'default'
    end

    it 'check dictionaries for keys using has_key()'
        Expect has_key({'a': 100}, 'a') == 1
        Expect has_key({'a': 100}, 'b') == 0
    end

    it 'dictionaries can be looped using keys(), values(), or items()'
        let foo = {'a': 100, 'b': 200}
        let loop = 0
        for [key, value] in items(foo)
            let loop += 1
            if loop == 1
                Expect key == 'a'
                Expect value == 100
            else
                Expect key == 'b'
                Expect value == 200
            endif
        endfor
    end
end
