class TeachersController < ApplicationController
 active_scaffold :Teachers do |config|
	config.columns = [:first, :last, :gender,:grade, :school, :village]
  end
end
