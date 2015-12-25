(function ($) {

// IE6\7\8不支持input事件，但支持propertychange事件
if ('onpropertychange' in document) {
        // 检查是否为可输入元素
        var rinput = /^INPUT|TEXTAREA$/,
                isInput = function (elem) {
                        return rinput.test(elem.nodeName);
                };
               
        $.event.special.input = {
                setup: function () {
                        var elem = this;
                        if (!isInput(elem)) return false;
                        
                        $.data(elem, '@oldValue', elem.value);
                        $.event.add(elem, 'propertychange', function (event) {
                                // 元素属性任何变化都会触发propertychange事件
                                // 需要屏蔽掉非value的改变，以便接近标准的onput事件
                                if ($.data(this, '@oldValue') !== this.value) {
                                        $.event.trigger('input', null, this);
                                };
                                
                                $.data(this, '@oldValue', this.value);
                        });
                },
                teardown: function () {
                        var elem = this;
                        if (!isInput(elem)) return false;
                        $.event.remove(elem, 'propertychange');
                        $.removeData(elem, '@oldValue');
                }
        };
};

// 声明快捷方式：$(elem).input(function () {});
$.fn.input = function (callback) {
        return this.bind('input', callback);
};

})(jQuery);
