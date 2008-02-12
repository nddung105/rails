require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

module ActiveRelation
  describe Compound do
    before do
      class ConcreteCompound < Compound
        def initialize(relation)
          @relation = relation
        end
      end
      @relation = Table.new(:users)
      @compound_relation = ConcreteCompound.new(@relation)
    end
    
    describe '#attributes' do
      it 'manufactures attributes associated with the compound relation' do
        @compound_relation.attributes.should == @relation.attributes.collect { |a| a.bind(@compound_relation) }
      end
    end
  end
end