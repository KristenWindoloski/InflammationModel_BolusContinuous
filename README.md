\#README

The files included in this repository plot Figure 6 from the publication
[“Characterization of differences in immune responses during bolus and
continuous infusion endotoxin challenges using mathematical modeling” by
Windoloski et al. (2024)](https://doi.org/10.1113/EP091552). This figure
shows the optimal model run for mean bolus and continuous infusion
cytokine data. To generate the plot:

-   Run the file “ModelRun.m”
    -   This MATLAB file pulls from other MATLAB files in the folder to
        load the bolus and continuous infusion data, model structure and
        parameters, ODE solver, and plotting functions.

    -   The first section of this code is for the continuous infusion
        model

        -   The file “meanctsdataplots.m” loads the mean and SD of the
            continuous infusion data and plots it on the figure in red.
        -   The file “MeanCtsOptPars.mat” loads the optimal parameters
            for the mean continuous infusion model.
        -   The file “cts\_model\_ic.m” loads the continuous infusion
            model initial conditions.
        -   The file “cts\_model\_solver.m” solves the continuous
            infusion model.
        -   The file “cts\_model\_plotsOPT.m” plots the time course of
            the model states in red and returns the R<sup>2</sup> value
            for each cytokine.

    -   The second section of this code is for the bolus model

        -   The file “meanbolusdataplots.m” loads the mean and SD of the
            bolus data and plots it on the figure in black.
        -   The file “MeanBolusOptPars.mat” loads the optimal parameters
            for the mean bolus model.
        -   The file “bolus\_model\_ic.m” loads the bolus model initial
            conditions.
        -   The file “bolus\_model\_solver.m” solves the bolus model.
        -   The file “bolus\_model\_plotsOPT.m” plots the time course of
            the model states in black and returns the R<sup>2</sup>
            value for each cytokine.

    -   The last section of the code plots the cytokine R<sup>2</sup>
        values for both the continuous infusion and bolus models in a
        legend on the plot.
