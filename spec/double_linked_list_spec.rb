require_relative '../double_linked_list.rb'

describe DoubleLinkedList do
  subject { described_class.new }

  describe '#add' do
    let(:element_to_add) { Object.new }

    before do
      subject.add(element_to_add)
    end

    it 'increases list size' do
      expect(subject.size).to be(1)
    end

    it 'assigns element' do
      expect(subject.head.element).to eq(element_to_add)
      expect(subject.tail.element).to eq(element_to_add)
    end

    context 'when list has a single element' do
      subject do
        list = described_class.new
        existing_node = Node.new(existing_element)
        list.head = existing_node
        list.tail = existing_node
        list.size = 1

        list
      end

      let(:existing_element) { Object.new }

      it 'makes existing element the head' do
        expect(subject.head.element).to eq(existing_element)
      end

      it 'points head to new element' do
        expect(subject.head.next_node.element).to eq(subject.tail.element)
      end

      it 'makes new element the tail' do
        expect(subject.tail.element).to eq(element_to_add)
      end

      it 'points tail to existing element' do
        expect(subject.tail.previous_node.element).to eq(subject.head.element)
      end

      it 'increases list size' do
        expect(subject.size).to eq(2)
      end
    end
  end

  describe '#remove' do
    let(:removed_element) { subject.remove(element_to_remove) }
    let(:element_to_remove) { Object.new }

    it 'returns nil' do
      expect(removed_element).to be_nil
    end

    context 'when element to remove is a list\'s member' do
      subject do
        list = described_class.new
        existing_node = Node.new(element_to_remove)
        list.head = existing_node
        list.tail = existing_node
        list.size = 1

        list
      end

      it 'returns element' do
        expect(removed_element).to eq(element_to_remove)
      end
    end
  end

  describe '#print' do
    it 'prints list' do
      subject.add(1)
      subject.add(5)
      subject.add(3)
      subject.print
    end
  end
end
