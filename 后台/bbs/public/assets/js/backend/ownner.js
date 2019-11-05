define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'ownner/index',
                    add_url: 'ownner/add',
                    edit_url: 'ownner/edit',
                    del_url: 'ownner/del',
                    multi_url: 'ownner/multi',
                    table: 'ownner',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'name', title: __('Name')},
                        {field: 'sex', title: __('Sex'), searchList: {"女":__('女'),"男":__('男')}, operate:'FIND_IN_SET', formatter: Table.api.formatter.label},
                        {field: 'schoolnum', title: __('Schoolnum')},
                        {field: 'password', title: __('Password')},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'openid', title: __('Openid')},
                        {field: 't', title: __('T')},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});