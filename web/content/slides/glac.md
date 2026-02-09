+++
title = "Automated Satellite-Based Glacial Lake Inventory and Change Detection in High Mountain Asia"
date = 2025-09-05
template = "slides.html"
+++
<section style="text-align: center;" data-background-image="https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=2070">
    <h2>Automated Satellite-Based Glacial Lake Inventory and Change Detection in High Mountain Asia</h2>
    <p><strong>Ravindra Kumar & Saurabh Vijay</strong><br>
    <span style="font-size: 0.8em;">Indian Institute of Technology, Roorkee</span></p>
    <p style="font-size: 0.6em;">Published in: <em>Scientific Reports</em> (2026) </p>
    <aside class="notes">
        Good morning. Today I will present our study on the automated inventorying and change detection of glacial lakes in High Mountain Asia (HMA).
        This work addresses the critical need for high-resolution monitoring of glacial lakes, which serve as vital water resources but also pose significant Glacial Lake Outburst Flood (GLOF) risks.
        Our research introduces a fully automated framework integrating multi-source remote sensing data to map lakes across 15 subregions of HMA, overcoming limitations of manual and semi-automated methods.
    </aside>
</section>

<section>
    <h3>Introduction & Problem Statement</h3>
    <ul style="font-size: 0.8em;">
        <li><strong>Context:</strong> HMA holds the largest volume of glaciers outside polar regions. Climate warming is accelerating glacier retreat and lake expansion.</li>
        <li><strong>Hazard:</strong> ~700 GLOF events recorded (1833–2022). Recent events like South Lhonak (2023) affected ~88,000 people.</li>
        <li><strong>Current Limitations:</strong>
            <ul>
                <li><em>Manual Mapping:</em> Labor-intensive, subjective.</li>
                <li><em>Semi-Automated:</em> Relies on global thresholds (NDWI), struggling with shadows, frozen lakes, and turbidity.</li>
                <li><em>Existing Automated:</em> Conservative area thresholds often exclude small, hazardous lakes ($<0.05~km^2$).</li>
            </ul>
        </li>
    </ul>
    <aside class="notes">
        The motivation for this study is twofold: resource management and disaster mitigation. </br>
        While glacial lakes are expanding globally, existing monitoring methods have bottlenecks. Manual mapping is too slow for the vast HMA region. Semi-automated methods using spectral indices like NDWI often fail in complex terrain due to mountain shadows and spectral variability of turbid water.</br>
        Crucially, fully automated methods tend to be "conservative," setting high area thresholds to avoid false positives. This means they miss smaller lakes, which can still trigger catastrophic debris flows. Our goal was to lower this detection threshold without sacrificing accuracy.</br>
    </aside>
</section>

<section>
    <h3>Study Area & Data Sources</h3>
    <div style="display: flex; gap: 20px;">
        <div style="flex: 1;">
            <ul>
                <li><strong>Region:</strong> 15 RGI 7.0 subregions (Himalaya, Karakoram, Tien Shan, etc.).</li>
                <li><strong>Buffer:</strong> 12.5 km from glacier termini (captures ~72% of distal lakes).</li>
            </ul>
        </div>
        <div style="flex: 1;">
            <small><strong>Data Stack:</strong></small>
            <table style="font-size: 0.6em; width: 100%;">
                <tr><td><strong>Optical</strong></td><td>Landsat-8 (OLI), Sentinel-2 (MSI)</td></tr>
                <tr><td><strong>SAR</strong></td><td>Sentinel-1 (GRD, C-band)</td></tr>
                <tr><td><strong>Topography</strong></td><td>Copernicus DEM (GLO-30)</td></tr>
                <tr><td><strong>Thermal</strong></td><td>Landsat-8 (TIRS), MODIS (LST)</td></tr>
            </table>
            <p style="font-size: 0.6em;"></p>
        </div>
    </div>
    <aside class="notes">
        We covered the entire High Mountain Asia region. A critical methodological choice here was the buffer zone. While 10km is standard, we extended this to 12.5km based on geomorphological analysis of existing inventories, ensuring we capture distal lakes formed by past glacial activity.</br>
        Our data stack is robust. We combine optical data (Landsat/Sentinel-2) with SAR (Sentinel-1) to overcome cloud cover issues. We also utilize thermal data from MODIS to classify grids by local climate, allowing for adaptive processing rather than a "one-size-fits-all" approach.</br>
    </aside>
</section>
<section>
    <div>
    <img src="/assets/glac1.png">
                    <p class="img-caption">Figure 1: Geographic scope of the HMA study area.</p>
    </div>
</section>

<section>
    <h3>Methodology: Two-Stage Framework</h3>
    <p><strong>Stage 1: Preliminary Boundary Extraction</strong><br>
    <span style="font-size: 0.8em;">Objective: Identify lake locations and approximate extents.</span></p>
    <hr>
    <p><strong>Stage 2: Refined Boundary Delineation</strong><br>
    <span style="font-size: 0.8em;">Objective: Precise mapping using high-resolution Sentinel-2.</span></p>
    <aside class="notes">
        Our automated workflow operates in two distinct stages.</br>
        Stage 1 is about "Recall"—finding everything that *might* be a lake using robust composites.</br>
        Stage 2 is about "Precision"—taking those candidate locations and refining the boundaries using higher resolution data and dynamic thresholding.</br>
        This separation allows us to use coarser, cleaner composites for detection, and finer, instantaneous imagery for delineation.</br>
    </aside>
</section>

<section>
    <h3>Stage 1: Multi-Source Integration</h3>
    <ul style="font-size: 0.8em">
        <li><strong>Landsat-8 Composite:</strong> Used <strong>25th Percentile</strong> composite (June-Oct).
            <ul>
                <li><em>Why?</em> Effectively removes clouds (high reflectance) and captures water (low reflectance) better than mean/median.</li>
            </ul>
        </li>
        <li><strong>Sentinel-1 SAR:</strong> Median composite to remove transient noise/icebergs.</li>
        <li><strong>Masking Strategy:</strong>
            <ul>
                <li><strong>Slope:</strong> $<25^\circ$ threshold (sensitivity analysis optimal).</li>
                <li><strong>Temperature:</strong> Adaptive thresholds ($-1^\circ C$ or $-2^\circ C$) based on MODIS Mean LST.</li>
            </ul>
        </li>
    </ul>
    <aside class="notes">
        In Stage 1, we innovated on the compositing method. Instead of the standard median composite for optical data, we used the 25th percentile. Since clouds have high reflectance and water has low reflectance, the 25th percentile effectively filters out cloud cover, leaving a clear "dark" water signal.</br>
        We fused this with Sentinel-1 SAR data, which sees through clouds entirely. </br>
        To remove false positives (like mountain shadows), we applied a slope mask derived from Copernicus DEM. We found 25 degrees to be the "sweet spot"—lower angles excluded real lakes, while higher angles included too many shadows.</br>
    </aside>
</section>

<section>
    <h3>Stage 2: Refinement & Dynamic Thresholding</h3>
    <ol style="font-size: 0.8em">
        <li><strong>Image Selection:</strong> Selected optimal cloud-free Sentinel-2 images based on max NDWI and min Snow Index.</li>
        <li><strong>Dynamic Segmentation:</strong>
            <ul>
                <li>Automated variance-minimization to find local thresholds for NDWI.</li>
                <li>Avoids the pitfalls of global thresholds (e.g., missed turbid lakes).</li>
            </ul>
        </li>
        <li><strong>Post-Processing:</strong>
            <ul>
                <li><strong>Histogram Analysis:</strong> Bimodal histograms kept (water vs. land); unimodal rejected.</li>
                <li><strong>River Filter:</strong> Removed streams using HydroRIVERS network.</li>
            </ul>
        </li>
    </ol>
    <aside class="notes">
        For the final boundaries, we move to Sentinel-2 (10m resolution).</br>
        Crucially, we don't just take a mosaic. For each identified lake object, we select the *best single image* where the lake is most visible (high NDWI, low snow). </br>
        Then, instead of applying a fixed water index threshold (like 0.1), we calculate a dynamic threshold for *each specific lake* based on local variance. This allows us to correctly map both crystal clear lakes and highly turbid, sediment-rich lakes that would be missed by standard algorithms.</br>
    </aside>
</section>

<section>
<div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100%;">
        <div style="height: 60vh; width: 100%; display: flex; justify-content: center;">
            <img src="/assets/glac2.png" 
                 style="max-height: 100%; max-width: 100%; object-fit: contain; border: 1px solid #6272a4; border-radius: 8px;">
        </div>
        <p class="img-caption" style="margin-top: 10px; font-size: 0.5em;">
            Figure 2: Flow Diagram of the methodology used to extract glacial lake outlines.
        </p>
    </div>
</section>

<section>
    <h3>2022 Inventory Results</h3>
    <div class="metric-box">
        <h4>Total Lakes: 31,698</h4>
        <h4>Total Area: 2,240 km²</h4>
    </div>
    <ul>
        <li><strong>Distribution:</strong>
            <ul>
                <li>Highest count: <strong>Inner Tibet</strong> (5,672 lakes).</li>
                <li>Largest area coverage: <strong>Eastern Himalaya</strong> (0.53% of basin).</li>
            </ul>
        </li>
        <li><strong>Size Classes:</strong>
            <ul>
                <li>Small ($\le 20k~m^2$): 53% of count, but only 7.8% of area.</li>
                <li>Large ($> 100k~m^2$): 11% of count, but <strong>70% of total area</strong>.</li>
            </ul>
        </li>
    </ul>
    <aside class="notes">
        Our 2022 inventory identified nearly 32,000 lakes.</br>
        While the count is dominated by small lakes (over 50% are under 20,000 square meters), the hydrological volume is dominated by the large lakes. </br>
        Geographically, Inner Tibet has the highest number of lakes, but the Eastern Himalaya has the highest density of lake area relative to the landscape. Most lakes sit between 4000 and 5400 meters elevation.</br>
    </aside>
</section>

<section>
    <h3>Change Detection (2016/17 to 2022/24)</h3>
    <p><strong>Overall Net Change: +5.5% Area Increase</strong> </p>
    <table style="font-size: 0.7em;">
        <thead>
            <tr>
                <th>Region</th>
                <th>Change Characteristics</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Qilian Shan</strong></td>
                <td>Highest expansion rate (<strong>+22.5%</strong>).</td>
            </tr>
            <tr>
                <td><strong>Pamir</strong></td>
                <td>Most stable region (+2.9%).</td>
            </tr>
            <tr>
                <td><strong>Proglacial Lakes</strong></td>
                <td>Expanded 2.4x faster than unconnected lakes. Account for <strong>56.9%</strong> of total area increase.</td>
            </tr>
        </tbody>
    </table>
    <p style="font-size: 0.6em; margin-top: 20px;"><em>*Analysis restricted to lakes $>10,000~m^2$ with valid multi-temporal data.</em></p>
    <aside class="notes">
        We analyzed changes over a roughly 6-year period. The overall trend is a clear expansion of 5.5%, but this masks significant regional heterogeneity.</br>
        The Qilian Shan region is changing rapidly (over 20% expansion), while the Pamir region is relatively stable.</br>
        The driver is clear: Proglacial lakes (those touching glaciers) are expanding significantly faster than unconnected lakes. In fact, lakes within 1km of a glacier were responsible for nearly 57% of the total area growth in HMA. This confirms the direct link between glacier retreat and lake formation.</br>
    </aside>
</section>

<section>
    <h3>Accuracy Assessment</h3>
    <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px;">
        <div>
            <h4>Detection Accuracy</h4>
            <ul>
                <li><strong>Overall:</strong> 79.4%.</li>
                <li><strong>Medium Lakes (20k-100k $m^2$):</strong> >96%.</li>
                <li><strong>Large Lakes (>100k $m^2$):</strong> 100% detection.</li>
            </ul>
        </div>
        <div>
            <h4>Delineation Accuracy</h4>
            <ul>
                <li><strong>Intersection over Union (IoU):</strong> 0.94 mean.</li>
                <li><strong>Relative Area Accuracy:</strong> 96.89%.</li>
            </ul>
        </div>
    </div>
    <p style="font-size: 0.6em; margin-top: 20px;"><em>Evaluation against manually digitized high-res Planet imagery (3m).</em></p>
    <aside class="notes">
        We rigorously validated our results against manual digitization of 3-meter Planet imagery.</br>
        Our detection is robust: We found 100% of large lakes and 96% of medium lakes.</br>
        The challenge remains with the very smallest lakes (under 5,400 square meters), where detection drops to 25%. However, for the crucial medium-to-large lakes that pose the greatest GLOF risks, our method is highly reliable.</br>
        Spatially, our boundaries match manual tracing with a 0.94 IoU score, indicating very precise edge detection.</br>
    </aside>
</section>

<section>
    <h3>Discussion & Comparison</h3>
    <ul>
        <li><strong>Comparison with Existing Inventories:</strong>
            <ul>
                <li><em>Wang et al. (Manual):</em> We matched their accuracy (~86%) while automating the process.</li>
                <li><em>Shugar et al. (Global Auto):</em> We achieved significantly higher detection (98% vs 63%) in comparable size bins.</li>
            </ul>
        </li>
        <li><strong>Drivers of Change:</strong>
            <ul>
                <li>Primary driver: Accelerated glacier melt/retreat.</li>
                <li>Regional variability aligns with mass balance heterogeneity (e.g., stable Pamir anomaly vs. melting Himalaya).</li>
            </ul>
        </li>
    </ul>
    <aside class="notes">
        When compared to previous "gold standard" inventories, our method performs exceptionally well. We matched the accuracy of Wang's manual inventory but with a fully automated, reproducible pipeline.</br>
        Compared to Shugar's global automated dataset, we detected significantly more lakes, particularly in the smaller size classes.</br>
        Our findings reinforce the narrative of heterogeneous glacier mass loss in HMA. The stability of lakes in the Pamir region corresponds with the known "Karakoram-Pamir Anomaly," while rapid expansion in the Himalayas tracks with high mass loss rates.</br>
    </aside>
</section>

<section>
    <h3>Conclusions & Future Work</h3>
    <ul>
        <li><strong>Methodological Success:</strong> Developed a robust, fully automated pipeline integrating Optical, SAR, and Thermal data.</li>
        <li><strong>Key Findings:</strong>
            <ul>
                <li>Identified <strong>31,698</strong> lakes (2022).</li>
                <li>Documented <strong>5.5%</strong> area expansion (2016-2024).</li>
                <li>Confirmed high detection rates (>96%) for hazardous medium-sized lakes.</li>
            </ul>
        </li>
        <li><strong>Impact:</strong> Provides a baseline for routine, high-frequency monitoring of GLOF hazards in HMA.</li>
    </ul>
    <aside class="notes">
        In conclusion, we have presented a verified, automated workflow that produces high-quality glacial lake inventories.</br>
        We have mapped over 31,000 lakes and quantified their rapid expansion. This dataset serves as a critical baseline.</br>
        Future work will focus on applying this method to intra-annual timescales to capture seasonal dynamics and integrating this data with downstream population exposure models for comprehensive risk assessment.</br>
        Thank you.
    </aside>
</section>
