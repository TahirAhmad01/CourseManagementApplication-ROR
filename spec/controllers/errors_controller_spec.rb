# -*- encoding: utf-8 -*-

require 'spec_helper'
require './controllers/errors_controller'

describe ErrorsController do

  # TODO: auto-generated
  describe '#not_found' do
    it 'works' do
      errors_controller = ErrorsController.new
      result = errors_controller.not_found
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#internal_server_error' do
    it 'works' do
      errors_controller = ErrorsController.new
      result = errors_controller.internal_server_error
      expect(result).not_to be_nil
    end
  end

end
