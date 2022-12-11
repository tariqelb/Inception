const quizData = [
    {
        question: 'How old is Tramp',
        a: '59',
        b: '60',
        c: '61',
        d: '62',
        correct: 'b'
    },
    {
        question: 'What is the most used programming language in 2019',
        a: 'Java',
        b: 'C',
        c: 'Python',
        d: 'Javascript',
        correct: 'd'
    },
    {
        question: 'Who is the President of US?',
        a: 'Florin Pop',
        b: 'Donald Tramp',
        c: 'Ivan Saldano',
        d: 'Mihai Andrei',
        correct: 'b'
    },
    {
        question: 'What does HTML stand for?',
        a: 'Hypertext Markup Language',
        b: 'Cascading Style Sheet',
        c: 'Jason Object Notation',
        d: 'Visual Studio Code',
        correct: 'a'
    },
    {
        question: 'What year was Javascript launched?',
        a: '1995',
        b: '1996',
        c: '1997',
        d: 'none of the above',
        correct: 'b'
    }
]
const quiz = document.getElementById("quiz");
const answerE1s = document.querySelectorAll(".answer");
const question1 = document.getElementById("question");
const a_text = document.getElementById("a_text");
const b_text = document.getElementById("b_text");
const c_text = document.getElementById("c_text");
const d_text = document.getElementById("d_text");
const submitBtn = document.getElementById("submit");

let currentQuiz = 0;
let answer = undefined;
let score = 0;

loadQuiz();

function loadQuiz () {
    deselectAnswer()
    const currentQuizData = quizData[currentQuiz];

    question1.innerHTML = currentQuizData.question;
    a_text.innerHTML = currentQuizData.a;
    b_text.innerHTML = currentQuizData.b;
    c_text.innerHTML = currentQuizData.c;
    d_text.innerHTML = currentQuizData.d;
}

function getSelected() {   

    let answer = undefined;

    answerE1s.forEach(answerE1 => {
        if (answerE1.checked) 
        {
            answer = answerE1.id; 
        }
    });
    return answer;

}

function deselectAnswer() {
    answerE1s.forEach(answerE1 => {
        answerE1.checked = false;
    });
    return answer; 

}

submitBtn.addEventListener('click', () => {
    const answer = getSelected();
    console.log(answer);

    if (answer)
    {
        if (answer === quizData[currentQuiz].correct)
        {
            score++;
        }
        currentQuiz++;
        if (currentQuiz  < quizData.length)
        {
            loadQuiz();
        }
        else
        {
            quiz.innerHTML = `<h2>You answer correctly at ${score}/${quizData.length} question.</h2> <button onclick="location.reload()">Reload</button>`;
        }
    }
})