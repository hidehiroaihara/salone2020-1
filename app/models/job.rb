class Job < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'フリーター' },
    { id: 2, name: '学生' },
    { id: 3, name: '会社員' },
    { id: 4, name: '主婦' },
    { id: 5, name: '自営業' },
    { id: 6, name: 'その他' }
  ]
end
