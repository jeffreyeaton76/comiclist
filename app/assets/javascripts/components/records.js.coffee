# app/assets/javascripts/components/records.js.coffee

@Records = React.createClass
  getInitialState: ->
    records: @props.data
  getDefaultProps: ->
    records: []
  addRecord: (record) ->
    records = React.addons.update(@state.records, {$push: [record]})
    @setState records: records
  deleteRecord: (record) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, {$splice: [[index, 1]]})
    @replaceState records: records
  updateRecord: (record, data) ->
    index = @state.records.indexOf record
    records = React.addons.update(@state.records, {$splice: [[index, 1, data]]})
    @replaceState records: records
  credits: ->
    credits = @state.records.filter (val) -> val.amount >=0
    credits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
      ), 0
  debits: ->
    debits = @state.records.filter (val) -> val.amount < 0
    debits.reduce ((prev, curr) ->
      prev + parseFloat(curr.amount)
      ), 0
  balance: ->
    @debits() + @credits()
  render: ->
    React.DOM.div
      className: 'records'
      React.DOM.h2
        className: 'title'
        'Comic Book Database'
      React.DOM.div
        className: 'row'
        React.createElement RecordForm, handleNewRecord: @addRecord
        React.DOM.hr null
      React.DOM.table
        className: 'table table-bordered table-hover table-responsive'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'Title'
            React.DOM.th null, 'Issue'
            React.DOM.th null, 'Condition'
            React.DOM.th null, 'Value'
            React.DOM.th null, 'Actions'
        React.DOM.tbody null,
          for record in @state.records
            React.createElement Record, key: record.id, record: record, handleDeleteRecord: @deleteRecord, handleEditRecord: @updateRecord
      React.DOM.div
        className: 'row'
        React.createElement AmountBox, type: 'primary', amount: @credits(), text: 'Total Value'