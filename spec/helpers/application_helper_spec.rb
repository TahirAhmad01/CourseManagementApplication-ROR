# -*- encoding: utf-8 -*-

require 'spec_helper'
require './helpers/application_helper'

describe ApplicationHelper do

  # TODO: auto-generated
  describe '#calculate_cgpa' do
    it 'works' do
      application_helper = ApplicationHelper.new
      enrolled_courses = double('enrolled_courses')
      result = application_helper.calculate_cgpa(enrolled_courses)
      expect(result).not_to be_nil
    end
  end

  # TODO: auto-generated
  describe '#grade_alpha' do
    it 'works' do
      application_helper = ApplicationHelper.new
      cgpa = double('cgpa')
      result = application_helper.grade_alpha(cgpa)
      expect(result).not_to be_nil
    end
  end

end
