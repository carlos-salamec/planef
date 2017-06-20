class CheckMailer < ApplicationMailer
	default from: 'notifications@example.com'

	def prof_to_utp_email(planification)
		@planification = planification

		# Buscamos un user (cuyo role LIKE 'UTP') tal que haya creado el colegio dentro del cual se está haciendo la planificación
		@utp = planification.grades_subjects_teacher.subjects_teacher.subject.school.users.where(['role LIKE ?', "%UTP"])[0]
		utp_email = @utp.email

		# Obtenemos el user que creó la planificación en cuestión
		@prof = planification.grades_subjects_teacher.subjects_teacher.user
		@prof_name = @prof.name + " " + @prof.lastname

		mail(to: utp_email, subject: "Planificación: solicitud de revisión por " + @prof_name)
	end
end
