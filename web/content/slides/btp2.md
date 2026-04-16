+++
title = "Satellite-Based Monitoring of Lake Ice Phenology"
date = 2024-05-20
template = "slides.html"
+++

<section>
  <h2>Remote Sensing of Lake Ice Phenology in HMA</h2>
  <h4>BTP Methodology: A Multi-Sensor Observational Approach</h4>
  <hr>
  <div style="font-size: 0.7em;">
    <strong>Focus:</strong> Data Fusion and Image Processing Algorithms<br>
    An Observational Alternative to Physical Modeling
  </div>
  <aside class="notes">
    This expanded presentation details a full Remote Sensing-focused BTP. We are moving away from the complexities of VIC modeling to focus on satellite big data. This approach is highly practical for Google Colab and focuses on using real-world observations to track the cryospheric response to climate change in High Mountain Asia.
  </aside>
</section>

<section>
  <h3>1. The Remote Sensing Objective</h3>
  <div style="font-size: 0.75em;">
    <p>Using satellite "eyes" to quantify the cryospheric response to warming:</p>
    <ul>
      <li><strong>Spatiotemporal Mapping:</strong> Tracking ice for thousands of lakes simultaneously.</li>
      <li><strong>Algorithm Comparison:</strong> Evaluating NDWI, NDSI, and Machine Learning.</li>
      <li><strong>Sensor Fusion:</strong> Combining Optical (Landsat/MODIS) with Microwave (Sentinel-1).</li>
      <li><strong>Goal:</strong> Generate a 20+ year record of Freeze-up and Break-up dates.</li>
    </ul>
  </div>
  <aside class="notes">
    The core objective is to build a high-resolution, long-term history of lake ice. By shifting the focus to remote sensing, we can compare how different algorithms perform in the rugged Himalayan terrain and use sensor fusion to ensure we don't lose data during the cloudy monsoon or winter months.
  </aside>
</section>

<section>
  <h3>2. Optical Data Workflow (GEE Based)</h3>
  <div style="display: flex; justify-content: space-between; font-size: 0.65em;">
    <div style="width: 48%;">
      <h4>MODIS (Daily Tracking)</h4>
      <ul>
        <li><strong>Product:</strong> MOD09GA (500m)</li>
        <li><strong>Role:</strong> High temporal frequency to catch the <em>exact day</em> of transition.</li>
        <li><strong>Challenge:</strong> Mixed pixel issues in narrow Himalayan valleys.</li>
      </ul>
    </div>
    <div style="width: 48%;">
      <h4>Landsat (Spatial Detail)</h4>
      <ul>
        <li><strong>Product:</strong> Landsat 8/9 OLI (30m)</li>
        <li><strong>Role:</strong> Mapping precise ice boundaries and small glacial lakes.</li>
        <li><strong>Challenge:</strong> 16-day revisit cycle; may miss the peak break-up event.</li>
      </ul>
    </div>
  </div>
  <aside class="notes">
    In a remote sensing project, Google Earth Engine is used to process two main optical sources. MODIS provides the temporal frequency needed to identify exact transition dates, while Landsat provides the spatial resolution to see small lakes that MODIS might blur together.
  </aside>
</section>

<section>
  <h3>3. Microwave SAR: The Cloud Solution</h3>
  <div style="font-size: 0.7em;">
    <p>Using <strong>Sentinel-1 (C-band SAR)</strong> to bypass atmospheric interference:</p>
    <ul>
      <li><strong>Mechanism:</strong> Active radar pulses penetrate clouds and fog.</li>
      <li><strong>Backscatter Detection:</strong> 
        <ul>
          <li><em>Water:</em> Low backscatter (Specular reflection, looks black).</li>
          <li><em>Ice:</em> High backscatter (Surface/Volume scattering, looks bright).</li>
        </ul>
      </li>
      <li><strong>Application:</strong> Critical for HMA during persistent winter cloud cover.</li>
    </ul>
  </div>
  <aside class="notes">
    Microwave SAR is essential because the Himalayas are frequently cloudy. By analyzing the "backscatter"—the signal that bounces back to the satellite—we can distinguish ice from water even in total darkness or through heavy clouds.
  </aside>
</section>

<section>
  <h3>4. Automated Extraction Algorithms</h3>
  <div style="font-size: 0.7em;">
    <div style="display: flex; justify-content: space-between;">
      <div style="width: 48%;">
        <h4>Index-Based (NDWI)</h4>
        <p>Uses the ratio of Green and NIR light to isolate water pixels.</p>
        <div style="background: #343454; padding: 5px; font-family: monospace;">NDWI = (G - NIR) / (G + NIR)</div>
      </div>
      <div style="width: 48%;">
        <h4>ML Classification</h4>
        <p>Using <strong>Random Forest</strong> or <strong>SVM</strong> to classify pixels into:</p>
        <ul>
          <li>Open Water</li>
          <li>Clear Ice</li>
          <li>Snow-covered Ice</li>
        </ul>
      </div>
    </div>
  </div>
  <aside class="notes">
    We use two main algorithm types: the math-based NDWI and machine learning classifiers. Random Forest can be trained to recognize the difference between clear blue ice and snow-covered ice, which significantly reduces errors in high-altitude environments.
  </aside>
</section>

<section>
  <h3>5. Handling Topographic Effects</h3>
  <div style="font-size: 0.7em;">
    <p>High relief in HMA causes "Mountain Shadows" that mimic water pixels:</p>
    <ul>
      <li><strong>Digital Elevation Model (DEM):</strong> SRTM or ASTER DEM integration.</li>
      <li><strong>Shadow Masking:</strong> Calculating sun azimuth and zenith to mask shaded regions.</li>
      <li><strong>Slope Correction:</strong> Adjusting reflectance values based on terrain angle.</li>
      <li class="fragment"><strong>Outcome:</strong> Prevents false "Break-up" detection caused by seasonal shadow shifts.</li>
    </ul>
  </div>
  <aside class="notes">
    A specific challenge in the Himalayas is topography. Deep shadows can look like water to a satellite. To solve this, we use Digital Elevation Models to calculate exactly where shadows will fall at any given time and mask them out to avoid "fake" water detections.
  </aside>
</section>

<section>
  <h3>6. Data Fusion & Time-Series Smoothing</h3>
  <div style="font-size: 0.7em;">
    <p>Constructing a continuous "Ice Fraction" curve:</p>
    <ul>
      <li><strong>Savitzky-Golay Filter:</strong> Smoothing noise in the daily MODIS time-series.</li>
      <li><strong>Sigmoid Function Fitting:</strong> Mathematically defining the FUS, FUE, BUS, and BUE dates.</li>
      <li><strong>SAR Integration:</strong> Replacing cloud-masked optical pixels with SAR-derived ice states.</li>
    </ul>
  </div>
  <aside class="notes">
    Since satellite data can be noisy, we use the Savitzky-Golay filter to smooth out the daily values. We then fit a Sigmoid function to the data; the steep parts of the curve represent the transition periods, allowing us to mathematically pinpoint the exact phenology dates.
  </aside>
</section>

<section>
  <h3>7. Validation via High-Resolution Imagery</h3>
  <div style="font-size: 0.7em;">
    <p>Ensuring accuracy in the absence of ground stations:</p>
    <ul>
      <li><strong>PlanetScope/SkySat:</strong> Using sub-meter resolution imagery for specific case studies.</li>
      <li><strong>Manual Digitization:</strong> Creating "Gold Standard" masks for 10% of the dataset.</li>
      <li><strong>Error Metrics:</strong> Calculating Root Mean Square Error (RMSE) and Mean Absolute Error (MAE) between automated and manual dates.</li>
    </ul>
  </div>
  <aside class="notes">
    Validation is the most critical part of a BTP. Because we don't have people on the ground in the Himalayas, we use extremely high-resolution commercial imagery as our "ground truth" to verify that our automated MODIS/Landsat algorithms are correct.
  </aside>
</section>

<section>
  <h3>8. Reporting & Statistical Analysis</h3>
  <div style="font-size: 0.7em;">
    <table style="width: 100%;">
      <thead>
        <tr>
          <th>Analysis</th>
          <th>Technique</th>
          <th>Goal</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><strong>Trend Test</strong></td>
          <td>Mann-Kendall</td>
          <td>Confirm if melt is getting earlier over 20 years.</td>
        </tr>
        <tr>
          <td><strong>Magnitude</strong></td>
          <td>Theil-Sen Slope</td>
          <td>Quantify rate of change (e.g., days per decade).</td>
        </tr>
        <tr>
          <td><strong>Climatic Driver</strong></td>
          <td>ERA5 Correlation</td>
          <td>Linking ice duration to Air Temperature anomalies.</td>
        </tr>
      </tbody>
    </table>
  </div>
  <aside class="notes">
    Finally, we report the trends. The Mann-Kendall test tells us if the changes are statistically significant, while the Theil-Sen slope gives us the actual rate of change. We then link these changes to climate data to explain why certain regions are warming faster than others.
  </aside>
</section>

<section>
  <h3>Summary: Why RS-Focus?</h3>
  <div style="font-size: 0.75em;">
    <ul>
      <li><strong>Scalability:</strong> Monitor 500+ lakes across the Himalayas simultaneously.</li>
      <li><strong>Practicality:</strong> Entirely implementable in Python/Google Colab.</li>
      <li><strong>Impact:</strong> Directly visualizes the "shrinking cryosphere" using real evidence.</li>
      <li><strong>BTP Value:</strong> Demonstrates high proficiency in Geospatial Big Data.</li>
    </ul>
  </div>
  <aside class="notes">
    In conclusion, a Remote Sensing focus is the most practical path for a modern BTP. It allows for large-scale analysis, can be done entirely in the cloud using Google Colab, and demonstrates the kind of data science skills that are highly valued in both academia and industry.
  </aside>
</section>
