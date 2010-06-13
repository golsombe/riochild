class FamilyChildrenController < ApplicationController
  # GET /family_children
  # GET /family_children.xml
  def index
    @family_children = FamilyChild.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @family_children }
    end
  end

  # GET /family_children/1
  # GET /family_children/1.xml
  def show
    @family_child = FamilyChild.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @family_child }
    end
  end

  # GET /family_children/new
  # GET /family_children/new.xml
  def new
    @family_child = FamilyChild.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @family_child }
    end
  end

  # GET /family_children/1/edit
  def edit
    @family_child = FamilyChild.find(params[:id])
  end

  # POST /family_children
  # POST /family_children.xml
  def create
    @family_child = FamilyChild.new(params[:family_child])

    respond_to do |format|
      if @family_child.save
        flash[:notice] = 'FamilyChild was successfully created.'
        format.html { redirect_to(@family_child) }
        format.xml  { render :xml => @family_child, :status => :created, :location => @family_child }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @family_child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /family_children/1
  # PUT /family_children/1.xml
  def update
    @family_child = FamilyChild.find(params[:id])

    respond_to do |format|
      if @family_child.update_attributes(params[:family_child])
        flash[:notice] = 'FamilyChild was successfully updated.'
        format.html { redirect_to(@family_child) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @family_child.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /family_children/1
  # DELETE /family_children/1.xml
  def destroy
    @family_child = FamilyChild.find(params[:id])
    @family_child.destroy

    respond_to do |format|
      format.html { redirect_to(family_children_url) }
      format.xml  { head :ok }
    end
  end
end
