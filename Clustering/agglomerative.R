hierClust =
function(D, linkage = singleLinkage)
{
   clusters = do.call(list, 1:nrow(D))
   delta = numeric(nrow(D))
   step = 1L
   while(nrow(D) > 1) {
      tmp = agglomerate(D, clusters, linkage)
      D = tmp$D
# what about identifying which point went to which cluster
      clusters = tmp$clusters
      delta[step] = tmp$delta
      step = step + 1L
   }
   list(clusters, 
}


agglomerate =
function(D, clusters, linkage = singleLinkage)
{


}
