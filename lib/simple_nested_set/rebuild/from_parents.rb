module SimpleNestedSet
  module Rebuild
    class FromParents
      attr_writer :num

      def num
        @num ||= 0
      end

      def run(nested_set, sort_order = nil)
        order_columns = [:parent_id] + Array[sort_order]
        nodes = nested_set.order(order_columns.compact).to_a
        renumber(nodes.dup)
        nodes.each(&:save)
      end

      def renumber(nodes)
        until nodes.empty?
          node = nodes.shift
          node.lft = self.num += 1
          num = renumber(extract_children(node, nodes))
          node.rgt = self.num += 1
        end
        num
      end

      def extract_children(node, nodes)
        children = nodes.select { |child| child?(node, child) }
        nodes.replace(nodes - children)
        children
      end

      def child?(node, child)
        if root_node?(child)
          false
        elsif direct_child?(node, child)
          true
        else
          # recurse to find indirect children,
          # i.e. the child is one of the grandchildren of the node
          child?(node, child.parent)
        end
      end

      def root_node? node
        node.nil? || node.parent_id.nil?
      end

      def direct_child? node, child
        child.parent_id == node.id
      end
    end
  end
end
