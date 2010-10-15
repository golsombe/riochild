class TeachersController < ApplicationController
 active_scaffold :Teachers do |config|
	config.columns = [:first, :last, :gender,:grade, :school, :village]
	config.list.columns = [:first, :last, :school, :grade]
  end
end
