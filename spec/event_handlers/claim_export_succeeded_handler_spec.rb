require 'rails_helper'
RSpec.describe ClaimExportSucceededHandler do
  subject(:handler) { described_class.new }

  it 'adds an event with a status of complete and a percent_complete of 100' do
    # Arrange - Create an example export
    export = create(:export, :claim, :ccd)
    example_data = {
      'export_id' => export.id,
      'sidekiq' => {
        'jid' => 'examplejid'
      },
      'external_data' => {
        'case_id' => 'examplecaseid',
        'case_type_id' => 'examplecasetypeid'
      },
      'message' => 'Claim exported'
    }

    # Act - call the handler
    handler.handle(example_data.to_json)

    # Assert - Ensure an event has been added
    expect(ExportEvent.where(export: export, state: 'complete', percent_complete: 100).count).to be 1
  end

  it 'sets the state to complete and the percent_complete to 100' do
    # Arrange - Create an example export
    export = create(:export, :claim, :ccd)
    example_data = {
      'export_id' => export.id,
      'sidekiq' => {
        'jid' => 'examplejid'
      },
      'external_data' => {
        'case_id' => 'examplecaseid',
        'case_type_id' => 'examplecasetypeid'
      },
      'message' => 'Claim exported'
    }

    # Act - call the handler
    handler.handle(example_data.to_json)

    # Assert - Ensure an event has been added
    expect(Export.find(export.id)).to have_attributes state: "complete", percent_complete: 100
  end

  it 'records the sidekiq jid in the data' do
    # Arrange - Create an example export
    export = create(:export, :claim, :ccd)
    example_data = {
      'export_id' => export.id,
      'sidekiq' => {
        'jid' => 'examplejid'
      },
      'external_data' => {
        'case_id' => 'examplecaseid',
        'case_type_id' => 'examplecasetypeid'
      },
      'message' => 'Claim exported'
    }

    # Act - call the handler
    handler.handle(example_data.to_json)

    # Assert - Ensure an event has been added
    expect(ExportEvent.where(export: export, state: 'complete').first.data['sidekiq']).to include 'jid' => 'examplejid'
  end

  it 'records the ccd data in the data of the event' do
    # Arrange - Create an example export
    export = create(:export, :claim, :ccd)
    example_data = {
      'export_id' => export.id,
      'sidekiq' => {
        'jid' => 'examplejid'
      },
      'external_data' => {
        'case_id' => 'examplecaseid',
        'case_type_id' => 'examplecasetypeid'
      },
      'message' => 'Claim exported'
    }

    # Act - call the handler
    handler.handle(example_data.to_json)

    # Assert - Ensure an event has been added
    expect(ExportEvent.where(export: export, state: 'complete').first.data['external_data']).to include 'case_id' => 'examplecaseid', 'case_type_id' => 'examplecasetypeid'
  end

  it 'merges the ccd data in the data of the export' do
    # Arrange - Create an example export
    export = create(:export, :claim, :ccd, external_data: { 'test' => 'data' })
    example_data = {
      'export_id' => export.id,
      'sidekiq' => {
        'jid' => 'examplejid'
      },
      'external_data' => {
        'case_id' => 'examplecaseid',
        'case_type_id' => 'examplecasetypeid'
      },
      'message' => 'Claim exported'
    }

    # Act - call the handler
    handler.handle(example_data.to_json)

    # Assert - Ensure an event has been added
    expect(Export.find(export.id).external_data).to include 'case_id' => 'examplecaseid', 'case_type_id' => 'examplecasetypeid', 'test' => 'data'
  end
end