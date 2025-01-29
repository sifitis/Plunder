
say passed!

$data modify storage pln:data root.manifest.matured.entries append from storage pln:data root.manifest.live.entries[{id:$(id)}]
$data remove storage pln:data root.manifest.live.entries[{id:$(id)}]