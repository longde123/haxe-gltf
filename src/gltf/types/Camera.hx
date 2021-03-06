package gltf.types;

import gltf.schema.TGLTF;
import gltf.schema.TCamera;
import haxe.ds.Vector;

@:allow(gltf.GLTF)
class Camera {
    public var type(default, null):CameraType;
    public var znear(default, null):Float;
    public var zfar(default, null):Float;

    function new() {}

    function load(gltf:GLTF, camera:TCamera):Void {
        if(camera.perspective != null) {
            type = CameraType.Perspective(camera.perspective.aspectRatio, camera.perspective.yfov);
            znear = camera.perspective.znear;
            zfar = camera.perspective.zfar;
        }
        else {
            type = CameraType.Orthographic(camera.orthographic.xmag, camera.orthographic.ymag);
            znear = camera.orthographic.znear;
            zfar = camera.orthographic.zfar;
        }
    }

    static function loadFromRaw(gltf:GLTF, raw:TGLTF):Vector<Camera> {
        var cameras:Vector<Camera> = new Vector<Camera>(raw.cameras.length);
        for(i in 0...raw.cameras.length) {
            cameras[i] = new Camera();
        }
        for(i in 0...raw.cameras.length) {
            cameras[i].load(gltf, raw.cameras[i]);
        }
        return cameras;
    }
}
