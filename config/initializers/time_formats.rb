Date::DATE_FORMATS[:short_ordinal] = lambda { |date| date.strftime("%B #{date.day.ordinalize}") }
Date::DATE_FORMATS[:medium_ordinal] = lambda { |date| date.strftime("%A, %b #{date.day.ordinalize}") }