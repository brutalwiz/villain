local entities = ents.GetAll()
local mat = Material("effects/ibeama")
hook.Add("Think", "drawbeam", function()
	entities = ents.GetAll()
	for k, v in pairs(entities) do
		--if v:IsWeapon() then
			v:SetColor(Color(255, 0, 0, 255))
			cam.Start3D()
				render.SetMaterial(mat)
				render.DrawBeam(v:LocalToWorld(Vector(0, 0, -200)),v:LocalToWorld(Vector(0,0,200)),5,1,1,Color(255, 255, 255,255))
			cam.End3D()
		--end
	end
end)
