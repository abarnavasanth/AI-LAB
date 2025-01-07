% Facts: Symptoms associated with diseases
symptom(fever, flu).
symptom(cough, flu).
symptom(sore_throat, flu).
symptom(headache, flu).

symptom(fever, malaria).
symptom(chills, malaria).
symptom(sweating, malaria).
symptom(nausea, malaria).

symptom(fever, typhoid).
symptom(abdominal_pain, typhoid).
symptom(rash, typhoid).
symptom(constipation, typhoid).

/* Rule: Diagnosis based on symptoms.
The rule checks if at least four symptoms match a disease*/

diagnose(Disease) :-
    symptom(Symptom1, Disease),
    symptom(Symptom2, Disease),
    symptom(Symptom3, Disease),
    symptom(Symptom4, Disease),
    write('Based on your symptoms, you might have '),
    write(Disease), nl.

% Interactive user input for diagnosis
start_diagnosis :-
    write('Do you have fever? (yes/no): '), read(Fever),
    write('Do you have chills? (yes/no): '), read(Chills),
    write('Do you have abdominal pain? (yes/no): '), read(AbdPain),
    write('Do you have a sore throat? (yes/no): '), read(SoreThroat),
    (
        %Matchind Symptoms for Malaria
        (Fever == yes, Chills == yes, AbdPain == no, SoreThroat == no,
         diagnose(malaria));

        %Matchind Symptoms for Typhoid
        (Fever == yes, Chills == no, AbdPain == yes, SoreThroat == no,
         diagnose(typhoid));

        %Matchind Symptoms for Flu
        (Fever == yes, Chills == no, AbdPain == no, SoreThroat == yes,
         diagnose(flu));

        %If no matching disease.
        write('Symptoms do not match any known disease in the system.')
    ).
% Queries
% Start the interactive diagnosis process
% start_diagnosis.
% output
/* System Interaction
Do you have fever? (yes/no): yes.
Do you have chills? (yes/no): yes.
Do you have abdominal pain? (yes/no): no.
Do you have a sore throat? (yes/no): no.
Based on your symptoms, you might have malaria.*/
%List all disease and their symptoms.
%symptom(Symptom, Disease).
/* Symptom = fever, Disease = flu;
 Symptom = cough, Disease= flu;
 Symptom = Sore_throat, Disease = flu;
 Symptom = headache, Disease = flu;
 ...*/
%Check if a specific symptom is associated with a disease
%symptom(rash, typhoid).
%Output true.
%Check if a diagnosis work for specific symptoms.
%diagnose(malaria).
%Output Based on your symptoms, you might have malaria.
