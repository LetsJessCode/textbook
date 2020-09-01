module ApplicationHelper
    def add_flash_types(flash)
        case flash.to_sym
        when :info
            "alert-success"
        when :warning
            "alert-warning"
        when :error
            "alert-danger"
        end
    end
end
