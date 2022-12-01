GroupObject = Class:extend()

function GroupObject:new(scene)
  self.scene = scene
  self.objects = {}
  self.objects.by_id = {}
  self.objects.by_class = {}
  self.chunks = {}
  self.chunk_size = CHUNK_SIZE or 128
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
      self.objects[i]:destroy()
      table.remove(self.objects, i)
    end
  end

  self.chunks = {}
  for _, object in ipairs(self.objects) do
    local cx, cy = math.floor(object.x / self.chunk_size), math.floor(object.y / self.chunk_size)
    if not self.chunks[cx] then self.chunks[cx] = {} end
    if not self.chunks[cx][cy] then self.chunks[cx][cy] = {} end
    table.insert(self.chunks[cx][cy], object)
  end
end

function GroupObject:draw()
  for _, object in ipairs(self.objects) do object:draw() end
end

function GroupObject:destroy()
  for i = #self.objects, 1, -1 do
    self.objects[i]:destroy()
    table.remove(self.objects, i)
  end

  self.scene = nil
  self.objects = nil
  self.chunks = nil
  self.chunk_size = nil
end

function GroupObject:add(entity, args)
  args = args or {}
  args.group = self

  local object = entity(args)
  self.objects.by_id[object.id] = object
  if not self.objects.by_class[object.class] then self.objects.by_class[object.class] = {} end
  table.insert(self.objects, object)
  table.insert(self.objects.by_class[object.class], object)
  self:orderObjects()
end

function GroupObject:findById(id)
  return self.objects.by_id[id]
end

function GroupObject:findByClass(class)
  return self.objects.by_class[class] or {}
end

function GroupObject:findInRectangle(x, y, w, h)
  local output = {}
  local cx1, cy1 = math.floor((x - w) / self.chunk_size), math.floor((y - h) / self.chunk_size)
  local cx2, cy2 = math.floor((x + w) / self.chunk_size), math.floor((y + h) / self.chunk_size)
  for i = cx1, cx2 do
    for j = cy1, cy2 do
      local cx, cy = i, j
      if self.chunks[cx] then
        local objects = self.chunks[cx][cy]
        if objects then
          for _, object in ipairs(objects) do
            if math.is_rectangle_in_rectangle(object.x, object.y, object.w, object.h, x, y, w, h) then
              table.insert(output, object)
            end
          end
        end
      end
    end
  end
  return output
end

function GroupObject:orderObjects()
  table.sort(self.objects, function(a, b)
    if a.depth == b.depth then
      return a.created_at < b.created_at
    else
      return a.depth < b.depth
    end
  end)
end
