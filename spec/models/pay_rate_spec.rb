describe PayRate do
  example 'PayRate.per_hour(75) * Duration[45] == 56.25' do
    expect(PayRate.per_hour(75) * Duration[45]).to eq 56.25
  end
end
