module RedminePrintIssue
  module Patches

    module IssuesControllerPatch
      def self.included(base) # :nodoc:
        base.send(:include, InstanceMethods)

        base.class_eval do
          Mime::Type.register "application/vnd.oasis.opendocument.text", :odt, [], %w(odt)
          alias_method_chain :show, :print
        end
      end

      module InstanceMethods
        def show_with_print
          if request.formats.include? :odt then
            ofile = Tempfile.new('print_template')
            begin
              qrcode = RQRCode::QRCode.new(url_for @order)
              imgfile = Tempfile.new('print_template_image')
              imgfile.write qrcode.as_svg
              @issue.class_eval('def images=(images); @images=images; end')
              @issue.images = { "qrcode" => imgfile.path }
              @issue.render_odt @issue.odt_path('control.odt'), ofile.path
              respond_to do |format|
                format.odt { send_file ofile.path, type: "application/vnd.oasis.opendocument.text", filename: "##{@issue.id} #{@issue.subject}.odt" }
              end
            ensure
              ofile.close
              imgfile.close
            end
          else
            show_without_print
          end
        end
      end

    end
  end
end

unless IssuesController.included_modules.include?(RedminePrintIssue::Patches::IssuesControllerPatch)
  IssuesController.send(:include, RedminePrintIssue::Patches::IssuesControllerPatch)
end

