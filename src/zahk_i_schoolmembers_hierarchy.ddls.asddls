define hierarchy zahk_i_schoolmembers_hierarchy
  as parent child hierarchy(
    source zahk_i_schoolmembers
    child to parent association _Teacher
    start where
      TeacherId is initial
    siblings order by
      PersonId
  )
{
  PersonId,
  Fullname,
  TeacherId,
  $node.hierarchy_is_cycle    as NodeCycle,
  $node.hierarchy_is_orphan   as NodeOrphan,
  $node.hierarchy_level       as NodeLevel,
  $node.hierarchy_parent_rank as NodeParentRank,
  $node.hierarchy_rank        as NodeRank,
  $node.hierarchy_tree_size   as NodeTreeSize,
  $node.node_id               as NodeID,
  $node.parent_id             as NodeParentID
}
