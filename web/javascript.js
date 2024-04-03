function createDash() {
    // Get input values
    var temp = parseFloat(document.getElementById('temp').value);
    var heartR = parseFloat(document.getElementById('heartR').value);
    var BSlevel = parseFloat(document.getElementById('BSlevel').value);
    var Ubp = parseFloat(document.getElementById('Ubp').value);
    var Lbp = parseFloat(document.getElementById('Lbp').value);

    // Check if any input is empty
    if (isNaN(temp) || isNaN(heartR) || isNaN(BSlevel) || isNaN(Ubp) || isNaN(Lbp)) {
        alert("Please fill in all fields with valid numbers.");
        return;
    }

    // Define ranges for analysis
    var ranges = {
        temp: { low: 35, high: 37 },
        heartR: { low: 60, high: 100 },
        BSlevel: { low: 70, high: 140 },
        Ubp: { low: 90, high: 120 },
        Lbp: { low: 60, high: 80 }
    };

    // Define display names
    var displayNames = {
        temp: "Temperature",
        heartR: "Heart Rate",
        BSlevel: "Blood Sugar Level",
        Ubp: "Upper Value of Blood Pressure",
        Lbp: "Lower Value of Blood Pressure"
    };

    // Analyze values for each metric
    var analysis = {};
    for (var key in ranges) {
        if (temp < ranges[key].low)
            analysis[key] = "Low";
        else if (temp > ranges[key].high)
            analysis[key] = "High";
        else
            analysis[key] = "Normal";
    }

    // Determine pregnancy risk level based on analysis
    var riskLevel = "Low Risk Pregnancy";
    for (var key in analysis) {
        if (analysis[key] === "High") {
            riskLevel = "High Risk Pregnancy";
            break;
        } else if (analysis[key] === "Low") {
            riskLevel = "Mid Risk Pregnancy";
        }
    }

    // Display results for each metric
    var dash = document.getElementById('dash');
    dash.innerHTML = "";
    for (var key in analysis) {
        var p = document.createElement('p');
        p.textContent = displayNames[key] + ": " + analysis[key];
        dash.appendChild(p);
    }

    // Display pregnancy risk level
    var pRisk = document.createElement('p');
    pRisk.textContent = "Pregnancy Risk Level: " + riskLevel;
    dash.appendChild(pRisk);

    // Alert to ensure function has finished and results are displayed
    alert("Results displayed");
}
