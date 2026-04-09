+++
title = "Unsupervised Hazard Detection in High Mountain Asia using Multi-Source Foundation Models"
date = 2026-04-09
template = "slides.html"
+++

<section style="text-align: center;" data-background-image="https://images.unsplash.com/photo-1589820296156-2454bb8a6ad1?q=80&w=2070">
    <div style="background: rgba(0,0,0,0.6); padding: 20px; border-radius: 15px;">
        <h2 style="color: white;">Unsupervised Hazard Detection in High Mountain Asia</h2>
        <h4 style="color: #bd93f9;">Leveraging AlphaEarth Foundation (AEF) Embeddings</h4>
        <p style="font-size: 0.6em; color: white;">Bachelor of Technology (BTP) Project Presentation</p>
        <p style="font-size: 0.5em; color: white;">
            <strong>Presenter:</strong> Yogansh Sharma<br>
        </p>
    </div>
    <aside class="notes">
        Good morning. Today I am presenting my BTP project on unsupervised hazard detection in High Mountain Asia. 
        Traditional methods rely on manual labeling or simple spectral indices. This project explores a new frontier: using multi-dimensional foundation models to detect catastrophic geomorphic changes without prior training data.
    </aside>
</section>

<section>
    <h3>The Challenge: Cryospheric Hazards in HMA</h3>
    <ul style="font-size: 0.8em;">
        <li><strong>Geographic Context:</strong> High Mountain Asia (HMA) is the "Third Pole," highly sensitive to climate shifts.</li>
        <li><strong>The Problem:</strong> Increasing frequency of rock-ice avalanches and GLOFs (e.g., Chamoli 2021).</li>
        <li><strong>Technical Bottlenecks:</strong>
            <ul>
                <li><em>Cloud Cover:</em> Optical sensors (Sentinel-2) are often blinded.</li>
                <li><em>Label Scarcity:</em> Unsupervised methods are needed because labeled disaster data is rare.</li>
                <li><em>Complexity:</em> Hazards involve snow, ice, and debris, making simple pixel-based detection unreliable.</li>
            </ul>
        </li>
    </ul>
    <aside class="notes">
        HMA is a disaster hotspot. The main issue is that by the time we have enough labeled data to train a traditional AI model, the disaster has already passed. Furthermore, the constant cloud cover in the Himalayas makes optical monitoring difficult. We need a method that is unsupervised and utilizes multi-sensor data.
    </aside>
</section>

<section>
    <h3>Proposed Solution: AEF Embeddings</h3>
    <div style="display: flex; gap: 20px; font-size: 0.8em;">
        <div style="flex: 1;">
            <strong>What is AEF?</strong>
            <p>AlphaEarth Foundations is a self-supervised model trained on billions of pixels of Sentinel-1 (Radar) and Sentinel-2 (Optical) data.</p>
        </div>
        <div style="flex: 1;">
            <strong>Why Embeddings?</strong>
            <ul>
                <li>Compressed 64-band representation of the landscape.</li>
                <li>Captures "texture" and "physics" beyond visible light.</li>
                <li>Enables mathematical comparison of surface states.</li>
            </ul>
        </div>
    </div>
    <aside class="notes">
        Instead of looking at raw RGB pixels, we use AEF Embeddings. These are 64-dimensional vectors that represent each 10-meter patch of earth. Because they include Radar data, they can "see" surface texture through clouds and shadows, providing a much more robust signature of the terrain than a standard photo.
    </aside>
</section>

<section>
    <h3>Methodology: Embedding Deviation</h3>
    <p style="font-size: 0.7em;">We treat hazard detection as an anomaly detection problem in latent space.</p>
    <ol style="font-size: 0.7em;">
        <li><strong>Vector Normalization:</strong> Project 64-band embeddings onto a unit sphere to remove brightness bias.
            <br>$\hat{v} = v / \|v\|$
        </li>
        <li><strong>Cosine Similarity:</strong> Calculate the dot product between Pre-event (2020) and Post-event (2021) vectors.</li>
        <li><strong>Anomaly Score:</strong> Map similarity to a 0–1 scale.
            <br>$Score = (Dot \times -0.5) + 0.5$
        </li>
        <li><strong>Thresholding:</strong> Identify the hazard mask using a statistical "long-tail" threshold ($T \approx 0.2$).</li>
    </ol>
    <aside class="notes">
        The math is straightforward but powerful. We normalize the vectors to focus on "change in nature" rather than "change in light." By calculating the cosine similarity between two years, we can pinpoint exactly where the land's fundamental signature has shifted. High deviation equals a potential hazard.
    </aside>
</section>

<section>
    <h3>Case Study: Chamoli Disaster (2021)</h3>
    <div style="display: flex; gap: 10px;">
        <div style="flex: 1;">
            <img src="assets/chamg.png" style="width: 100%; border-radius: 10px;">
            <p style="font-size: 0.4em;">Pre- vs Post-event Visual (Sentinel-2)</p>
        </div>
        <div style="flex: 1; font-size: 0.7em;">
            <ul>
                <li><strong>Event:</strong> Rock-ice avalanche and flash flood.</li>
                <li><strong>Validation:</strong> Compared AEF results against the Shugar et al. (Science, 2021) inventory.</li>
            </ul>
        </div>
    </div>
    <aside class="notes">
        We validated this using the 2021 Chamoli event. By comparing our unsupervised mask with the professional inventory published in Science magazine, we can quantify our accuracy. Our model successfully captured the main avalanche track and the debris deposits in the valley.
    </aside>
</section>

<section>
    <h3>Statistical Justification</h3>
    <div style="display: flex; align-items: center; justify-content: center;">
        <div style="width: 60%;">
    <img src="/assets/histogram.png">
                    <p class="img-caption">Figure 1: Geographic scope of the HMA study area.</p>
        </div>
    </div>
    <p style="font-size: 0.6em; text-align: center;">Distribution of Anomaly Scores (Log Scale). The red line indicates our 0.2 Threshold.</p>
    <aside class="notes">
        This histogram is the scientific heart of the project. It shows that most of the valley remains stable (the big spike on the left). The "long tail" on the right represents the rare, high-energy changes—the hazard. Choosing our threshold here ensures we filter out noise while keeping the signal.
    </aside>
</section>

<section>
<h3>Topographic Correlation Analysis</h3>
    <div style="display: flex; gap: 20px; font-size: 0.75em;">
        <div style="flex: 1.2;">
            <strong>Data Source:</strong>
            <p>NASA SRTM (Shuttle Radar Topography Mission) Digital Elevation Model at <strong>30m Resolution</strong>.</p>
            <hr>
            <strong>Geomorphic Validation:</strong>
            <ul>
                <li><strong>Slope Derivation:</strong> Calculating terrain gradient to correlate with anomaly locations.</li>
                <li><strong>Physical Consistency:</strong> Confirms that anomalies align with gravity-driven mass movement thresholds ($>25^\circ$).</li>
            </ul>
        </div>
    </div>
    <aside class="notes">
        For topographic validation, we utilized the NASA SRTM 30m Digital Elevation Model. By deriving the slope from this dataset, we were able to filter our anomaly results. Since geomorphic hazards like the Chamoli avalanche are driven by gravity, we expect them to occur on steep terrain. Our results confirmed a high correlation, with most detected anomalies occurring on slopes greater than 25 degrees, effectively filtering out noise from flat agricultural land.
    </aside>
</section>

<section>
    <h3>Implementation Stack</h3>
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; font-size: 0.7em;">
        <div style="padding: 10px; border: 1px solid #6272a4;">
            <strong>Backend</strong>
            <ul>
                <li>Google Earth Engine (GEE)</li>
                <li>AlphaEarth Foundation API</li>
                <li>Python (Colab/Jupyter)</li>
            </ul>
        </div>
        <div style="padding: 10px; border: 1px solid #6272a4;">
            <strong>Frontend / Visualization</strong>
            <ul>
                <li>Leafmap (MapLibreGL backend)</li>
                <li>Geemap (Tile rendering)</li>
                <li>Matplotlib (Statistical Analysis)</li>
            </ul>
        </div>
    </div>
    <aside class="notes">
        The system is built entirely on open-source cloud infrastructure. We use Google Earth Engine for the massive data processing and Leafmap with MapLibre for the high-performance vector visualization.
    </aside>
</section>

<section>
    <h3>Unsupervised Classification Plan</h3>
    <div style="display: flex; gap: 20px; font-size: 0.75em;">
        <div style="flex: 1;">
            <strong>Objective:</strong>
            <p>To segment the HMA landscape into distinct geomorphic clusters (Snow, Rock, Water, Debris) using the latent features of the foundation model.</p>
            <hr>
            <strong>Algorithm: K-Means Clustering</strong>
            <ul>
                <li><strong>Input:</strong> 64-band AEF Embedding (Post-event).</li>
                <li><strong>Sampling:</strong> 5,000 random pixels for cluster training.</li>
                <li><strong>K-Value Cluster labeling:</strong> 5 clusters (optimal for glacial environments).</li>
            </ul>
        </div>
    </div>
    <aside class="notes">
        Beyond just measuring change, we implemented an unsupervised classification plan using K-Means clustering. By grouping the 64-band embeddings into 5 distinct physical clusters, we can provide context to our hazards. For example, we can prove that a high anomaly score is specifically occurring where the land has transitioned into a "Debris" class, rather than just a shadow or a water body.
    </aside>
</section>
<section>
    <h3>Supervised Validation: Random Forest Approach</h3>
    <div style="display: flex; gap: 20px; font-size: 0.7em;">
        <div style="flex: 1;">
            <strong>The Strategy:</strong>
            <ul>
                <li><strong>Algorithm:</strong> Random Forest .</li>
                <li><strong>Training:</strong> Multi-class labeling (Snow, Rock, Water, Hazard Debris).</li>
                <li><strong>Verification:</strong> Cross-referencing the "Hazard Debris" class with the "Anomaly Score" from the AEF model.</li>
            </ul>
        </div>
        <div style="flex: 1;">
            <strong>Importance for Thesis:</strong>
            <ol>
                <li>Provides <strong>Quantitative Accuracy</strong> via Confusion Matrix.</li>
                <li>Differentiates between types of geomorphic change (e.g., distinguishing a new lake from a new landslide).</li>
                <li>Validates the <strong>unsupervised framework</strong> as a reliable proxy for expert-labeled maps.</li>
            </ol>
        </div>
    </div>
    <aside class="notes">
        To finalize our validation, we implemented a supervised Random Forest classifier. While the unsupervised model is our primary focus for "monitoring," the supervised map acts as our "truth." If the supervised model confirms that our high-anomaly zones are indeed "Debris," we have successfully closed the loop on our research objective.
    </aside>
</section>

<section>
    <h3>Conclusions & Future Scope</h3>
    <ul style="font-size: 0.8em;">
        <li><strong>Main Result:</strong> Successfully developed a fully unsupervised pipeline for hazard mapping in HMA.</li>
        <li><strong>Advantage:</strong> Eliminates the need for manual training labels and works across diverse terrain types.</li>
    </ul>
    <aside class="notes">
        In conclusion, this project proves that foundation models can replace manual labor in disaster management. Moving forward, I hope to scale this system to provide real-time monitoring for the entire Hindu Kush-Himalaya range.
    </aside>
</section>

<section style="text-align: center;">
    <h2>Thank You</h2>
    <div style="font-size: 0.5em; margin-top: 50px;">
    </div>
</section>
