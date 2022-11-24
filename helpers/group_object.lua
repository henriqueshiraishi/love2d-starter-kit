GroupObject = Class:extend()

function GroupObject:new()
  self.objects = {}
  self.objects.by_id = {}
  self.objects.by_class = {}
end

function GroupObject:update(dt)
  for _, object in ipairs(self.objects) do object:update(dt) end

  for i = #self.objects, 1, -1 do
    if self.objects[i].dead then
      self.objects.by_id[self.objects[i].id] = nil
      for j, object in ipairs(self.objects.by_class[self.objects[i].class]) do
        if object.id == self.objects[i].id then
          table.remove(self.objects.by_class[self.objects[i].class], j)
          break
        end
      end
      table.remove(self.objects, i)
    end
  end
end

function GroupObject:draw()
  for _, object in ipairs(self.objects) do object:draw() end
end

function GroupObject:add(object)
  object.group = self
  self.objects.by_id[object.id] = object
  if not self.objects.by_class[object.class] then self.objects.by_class[object.class] = {} end
  table.insert(self.objects, object)
  table.insert(self.objects.by_class[object.class], object)
end

function GroupObject:findById(id)
  return self.objects.by_id[id]
end

function GroupObject:findByClass(class)
  return self.objects.by_class[class] or {}
end
