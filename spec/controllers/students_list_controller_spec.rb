# -*- encoding: utf-8 -*-

require 'spec_helper'
require './controllers/students_list_controller'

describe StudentsListController do

  # TODO: auto-generated
  describe '#index' do
    it 'works' do
      students_list_controller = StudentsListController.new
      result = students_list_controller.index
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#show' do
    it 'works' do
      students_list_controller = StudentsListController.new
      result = students_list_controller.show
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#mark' do
    it 'works' do
      students_list_controller = StudentsListController.new
      result = students_list_controller.mark
      expect(result).not_to be_nil
    end
  end

end
