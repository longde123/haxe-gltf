import buddy.*;
using buddy.Should;

import haxe.ds.StringMap;
import gltf.GLTF;

class TestTechniques extends BuddySuite {
	public function new(sources:StringMap<String>) {
		describe("Loading techniques", {
			var box:GLTF = GLTF.parse(sources.get("box"));
			it("", {});
		});
	}
}