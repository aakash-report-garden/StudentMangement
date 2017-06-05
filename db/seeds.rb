# Clearing existing student data and creating initial data
Student.destroy_all

Student.create!(
    [
        {
            student_id: 1,
            department: 'a1',
            maths: 43,
            physics: 54,
            chemistry: 65,
            year: 2016
        },
        {
            student_id: 2,
            department: 'a1',
            maths: 66,
            physics: 52,
            chemistry: 66,
            year: 2016
        },
        {
            student_id: 3,
            department: 'a7',
            maths: 87,
            physics: 32,
            chemistry: 43,
            year: 2016
        },
        {
            student_id: 1,
            department: 'a1',
            maths: 21,
            physics: 52,
            chemistry: 65,
            year: 2015
        },
        {
            student_id: 2,
            department: 'a1',
            maths: 68,
            physics: 50,
            chemistry: 65,
            year: 2015
        },
        {
            student_id: 3,
            department: 'a7',
            maths: 85,
            physics: 22,
            chemistry: 43,
            year: 2015
        },
        {
            student_id: 4,
            department: 'a7',
            maths: 21,
            physics: 22,
            chemistry: 13,
            year: 2016
        }
    ]
)

# Clearing existing college data and creating initial data
College.destroy_all

College.create!(
    [
        {
            name: 'KIIT',
            established_year: 1889,

        },
        {
            name: 'VIT',
            established_year: 1999,

        },
        {
            name: 'IIT',
            established_year: 1880,

        }
    ]
)