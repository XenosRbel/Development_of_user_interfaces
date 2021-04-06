# frozen_string_literal: true

module RespondHelper
  def respond_html_json_and_pdf_for(model, options = {})
    template = options.delete :template
    respond_to do |format|
      format.html { render template if template.present? }
      format.json { render json: model }
      format.pdf { render respond_pdf(model) }
    end
  end

  private

  def respond_pdf(model)
    {
      pdf: I18n.t("reports.pdf_report_title",
                  entity_title: pdf_title(model),
                  report_at: Time.now.strftime(read_constant(:DATETIME_FORMAT))),
      page_size: "A4",
      template: template_pat(model),
      layout: "pdf.slim",
      orientation: "Portrait",
      lowquality: true,
      zoom: 1,
      dpi: 75
    }
  end

  def pdf_title(model)
    model.class.name.split("::").last
  end

  def template_pat(_model)
    "#{params.fetch(:controller, '')}/#{params.fetch(:action, '')}.slim"
  end
end
