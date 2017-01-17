class EventosController < ApplicationController
  def index
    @eventos = Admin::Organization.all
    
    @datas = ""
    
    @eventos.each do |e|
      @datas += "{"
      @datas += "title: '#{e.title}',"
      @datas += "start: '#{e.organization_start.strftime("%Y/%m/%d")}',"
      @datas += "end: '#{e.organization_finish.strftime("%Y/%m/%d")}'"
      @datas += "},"
    end
    
    puts "==============DATAS #{@datas.inspect}"
    
    @galerias = Admin::Organization.all.order("id DESC").limit(4)
  end
end
