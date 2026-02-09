+++
title = "Remote Sensing and Modeling of the Cryosphere in High Mountain Asia"
date = 2026-02-03
template = "slides.html"
+++
<section>
  <h2>Remote Sensing and Modeling of the Cryosphere in High Mountain Asia</h2>
  <h3>A Multidisciplinary Review</h3>
  <p style="font-size: 0.6em;">Based on: Ye, Q.; Wang, Y.; Liu, L.; et al. <em>Remote Sens.</em> 2024, 16, 1709 </p>
  <p style="font-size: 0.5em;">
    <strong>Presenter:</strong> Yogansh Sharma<br>
  </p>
  <aside class="notes">
    Good morning. Today I will be presenting a comprehensive multidisciplinary review of remote sensing techniques and modeling efforts focused on the cryosphere of High Mountain Asia (HMA). This presentation is based on the 2024 review paper by Ye et al. published in MDPI Remote Sensing.    HMA, often called the "Third Pole," contains the largest reservoir of ice and snow outside the polar regions. We will explore how satellite observations have evolved over the last 60 years to monitor glaciers, snow, frozen ground, and lake ice, and how these data feed into hydrological models to predict future water resources and hazards.
  </aside>
</section><section>
  <h3>1. Introduction: The Asian Water Tower</h3>
  <div style="text-align: left; font-size: 0.7em;">
    <ul>
      <li><strong>Significance:</strong> HMA feeds major rivers providing water for nearly 2 billion people.</li>
      <li><strong>Current State:</strong> Rapid change due to global warming:
        <ul>
          <li>Glacier melting & Permafrost thawing </li>
          <li>Snow cover decreasing </li>
          <li>Lake ice duration shortening </li>
        </ul>
      </li>
      <li><strong>Hazards:</strong> Increase in rock-ice avalanches, landslides, and Glacial Lake Outburst Floods (GLOFs).</li>
      <li><strong>Research Volume:</strong> >11,000 papers published on HMA cryosphere (Feb 2024).</li>
    </ul>
  </div>
  <aside class="notes">
    The cryosphere in High Mountain Asia is critical to the hydrological cycle of the region. It is identified as the "Asian Water Tower." 
    However, the system is under stress. Global warming is driving rapid changes: glaciers are retreating, permafrost is degrading, and snow cover is becoming more erratic. These physical changes have direct consequences for human livelihoods through water resource availability and the increasing frequency of natural disasters like GLOFs.
    The academic interest in this region has exploded, with over 11,000 satellite-based studies published by early 2024. Glaciers remain the most studied topic, followed by snow and hazards.
  </aside>
</section><section>
  <h3>2. Data Acquisition: Satellite Sensors</h3>
  <div style="display: flex; justify-content: space-between; font-size: 0.6em;">
    <div style="width: 48%;">
      <h4>Optical Sensors</h4>
      <ul>
        <li><strong>Landsat Series (1-9):</strong> Longest record (1970s–present); free access since 2008.</li>
        <li><strong>Sentinel-2/MSI:</strong> High temporal resolution (10 days).</li>
        <li><strong>MODIS (Terra/Aqua):</strong> Daily revisit; key for snow/lake ice.</li>
        <li><strong>ASTER:</strong> Stereo-pair capabilities for DEM generation.</li>
      </ul>
    </div>
    <div style="width: 48%;">
      <h4>Microwave & Altimetry</h4>
      <ul>
        <li><strong>Passive Microwave:</strong> SMMR, AMSR-E/2; All-weather snow depth/SWE monitoring.</li>
        <li><strong>Active Microwave (SAR):</strong> Sentinel-1, ALOS PALSAR; Deformation and velocity.</li>
        <li><strong>Altimetry:</strong> ICESat-2/ATLAS, CryoSat-2; Precise elevation change.</li>
      </ul>
    </div>
  </div>
  <aside class="notes">
    The backbone of HMA research is the constellation of Earth-observing satellites. 
    Optical sensors like Landsat and Sentinel-2 provide high-resolution imagery for delineating extent. The Landsat archive, open since 2008, allows for multi-decadal change detection. MODIS provides the high temporal frequency needed for snow cover and lake ice phenology.
    However, optical sensors fail under cloud cover—a major issue in mountainous regions. This is where microwave sensors come in. Passive microwave (AMSR-E) monitors snow water equivalent (SWE) daily, though at coarse resolution. Active SAR (Sentinel-1) is crucial for tracking glacier velocity and ground deformation. Finally, laser altimetry (ICESat-2) gives us precise vertical profiles to calculate mass balance.
  </aside>
</section><section>
  <h3>3. Glacier Inventories</h3>
  <div style="font-size: 0.7em;">
    <ul>
      <li><strong>Major Inventories:</strong>
        <ul>
          <li><em>Randolph Glacier Inventory (RGI 7.0):</em> Global standard, 1950–2021 data.</li>
          <li><em>GAMDAM (GGI-18):</em> Manual digitization (1990–2010).</li>
          <li><em>Second Chinese Glacier Inventory (CGI-2):</em> Landsat based (2006–2010).</li>
        </ul>
      </li>
      <li><strong>Methodological Shift:</strong>
        <ul>
          <li><strong>Traditional:</strong> Manual digitization & band ratios (NDSI).</li>
          <li><strong>Emerging:</strong> Deep Learning (CNNs) for debris-covered glaciers.</li>
        </ul>
      </li>
      <li><strong>Key Challenge:</strong> Debris-covered glaciers mimic surrounding rock spectrally.</li>
    </ul>
  </div>
  <aside class="notes">
    Accurate inventories are the baseline for all mass balance studies. The Randolph Glacier Inventory (RGI) is the global standard, with version 7.0 released in 2023. Regional inventories like the Second Chinese Glacier Inventory provide specific high-resolution snapshots.
    Methodologically, we are moving from simple band-ratio thresholding (like NDSI) to complex deep learning models. The "holy grail" right now is automated delineation of debris-covered glaciers. Because supraglacial debris has the same spectral signature as the surrounding bedrock, optical automated classification often fails, necessitating the use of thermal bands, topographic data, and coherence images from SAR.
  </aside>
</section><section>
  <h3>4. Glacier Mass Balance (MB)</h3>
  <p style="font-size: 0.6em;"><strong>Method:</strong> Geodetic method (DEM differencing) & Altimetry (ICESat-2/CryoSat-2)</p>
  <div style="font-size: 0.65em;">
    <ul>
      <li><strong>General Trend:</strong> Significant mass loss across HMA.
        <ul>
          <li>2000–2016 (HMA wide): $-0.18 \pm 0.04~m~w.e.a^{-1}$.</li>
          <li>Himalayas acceleration: From $-0.22$ (1975–2000) to $-0.43~m~w.e.a^{-1}$ (2000–2016).</li>
        </ul>
      </li>
      <li><strong>Data Inconsistencies:</strong> 
        <ul>
          <li>Eastern Kunlun estimates range from $-0.07$ (DEMs) to $-0.49~m~w.e.a^{-1}$ (Radar Altimetry).</li>
        </ul>
      </li>
      <li><strong>Altitudinal Effect:</strong> More negative MB at lower altitudes; near zero equilibrium at ~6200m a.s.l. (Mt. Qomolangma) .</li>
    </ul>
  </div>
  <aside class="notes">
    Quantifying mass loss is primarily done via the geodetic method—comparing DEMs from different epochs—or satellite altimetry.
    The general signal is clear: HMA is losing mass, with the rate doubling in the Himalayas since 2000. However, we must note the significant uncertainty. Different techniques yield vastly different numbers for the same region, as seen in the Eastern Kunlun example where results differ by a factor of seven depending on whether optical DEMs or radar altimetry is used.
    We also observe strong altitudinal gradients. On Mt. Everest, mass balance approaches zero around 6200 meters, which serves as the approximate Equilibrium Line Altitude (ELA).
  </aside>
</section><section>
  <h3>The "Karakoram Anomaly"</h3>
  <div style="font-size: 0.7em; text-align: left;">
    <p><strong>Phenomenon:</strong> Regions where glaciers show slight mass gain or balanced budgets, contrasting with global retreat.</p>
    <ul>
      <li><strong>Locations:</strong> Karakoram, Pamir, and Western Kunlun Shan.</li>
      <li><strong>Western Kunlun MB:</strong> $+0.14 \pm 0.08~m~w.e.a^{-1}$ (slight positive).</li>
      <li><strong>Surging:</strong> High concentration of surge-type glaciers.
        <ul>
          <li><em>Identification:</em> Rapid velocity increase (order of magnitude), terminus advance, and surface elevation changes.</li>
          <li><em>Inventories:</em> Vary from 137 to 890 identified surge-type glaciers depending on criteria.</li>
        </ul>
      </li>
    </ul>
  </div>
  <aside class="notes">
    Not all of HMA is melting at the same rate. We observe the "Karakoram Anomaly" in the Karakoram, Pamir, and Western Kunlun ranges. Here, mass balances are neutral or even slightly positive. 
    This region is also a hotspot for glacier surging—a flow instability where glaciers advance rapidly. Identifying these surges requires analyzing velocity fields and frontal changes. Interestingly, the count of surge-type glaciers varies wildly between inventories (137 vs 890), highlighting a lack of standardized classification criteria in remote sensing methodologies.
  </aside>
</section><section>
  <h3>5. Snow Cover & SWE</h3>
  <div style="font-size: 0.65em;">
    <table style="width: 100%;">
      <thead>
        <tr>
          <th>Parameter</th>
          <th>Primary Sensors</th>
          <th>Limitations</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><strong>Snow Cover Extent (SCE)</strong></td>
          <td>MODIS (500m), AVHRR (5km) </td>
          <td>Cloud cover requires temporal compositing or cloud-removal algorithms.</td>
        </tr>
        <tr>
          <td><strong>SWE / Snow Depth</strong></td>
          <td>Passive Microwave (AMSR-E/2, SMMR) </td>
          <td><strong>Saturation:</strong> Signals saturate if SWE > 30mm (underestimation).<br><strong>Overestimation:</strong> In shallow snow (<30mm) or frozen ground.</td>
        </tr>
      </tbody>
    </table>
    <p style="margin-top: 20px;"><strong>Trend:</strong> Significant decrease in snow depth in HMA from 1988–2020.</p>
  </div>
  <aside class="notes">
    Snow cover is monitored using optical sensors like MODIS, but cloud cover is a persistent issue requiring gap-filling algorithms.
    For Snow Water Equivalent (SWE) and depth, we rely on passive microwave sensors (AMSR-E). However, this technique has severe physical limitations. The microwave signal saturates when SWE exceeds 30mm, leading to underestimation in deep snow packs. Conversely, in shallow snow or frozen ground areas, it often overestimates. 
    Despite these issues, long-term records indicate a significant decreasing trend in snow depth across HMA over the last three decades.
  </aside>
</section><section>
  <h3>6. Frozen Ground (Permafrost)</h3>
  <div style="font-size: 0.7em; text-align: left;">
    <ul>
      <li><strong>Extent:</strong> Covers ~86% of HMA; Permafrost specifically ~28% ($1.27 \times 10^6~km^2$).</li>
      <li><strong>Monitoring Techniques:</strong>
        <ul>
          <li><em>Thermal State:</em> Land Surface Temperature (LST) from MODIS/ASTER used to model Mean Annual Ground Temperature (MAGT).</li>
          <li><em>Active Layer:</em> InSAR measures surface deformation (subsidence/heave) to infer active layer thickness (ALT) changes.</li>
        </ul>
      </li>
      <li><strong>Observed Changes:</strong>
        <ul>
          <li>Ground temp at 10m depth increasing $0.02\text{--}0.78^\circ C~decade^{-1}$.</li>
          <li>Widespread subsidence (~2 cm/year) due to thawing ground ice.</li>
        </ul>
      </li>
    </ul>
  </div>
  <aside class="notes">
    Frozen ground is the most extensive cryospheric component in HMA, covering 86% of the region. 
    Remote sensing of permafrost is challenging because it is a subsurface phenomenon. We use proxies: Land Surface Temperature (LST) is used to model Mean Annual Ground Temperature. 
    More recently, InSAR has become a powerful tool. By measuring seasonal surface deformation—subsidence in summer, heave in winter—we can infer changes in the active layer thickness. Data shows widespread subsidence of up to 2 cm/year in the Northern Tibetan Plateau, directly linked to the melting of ground ice.
  </aside>
</section><section>
  <h3>Rock Glaciers & Aufeis</h3>
  <div style="font-size: 0.6em;">
    <div class="fragment">
      <h4>Rock Glaciers</h4>
      <ul>
        <li><strong>Definition:</strong> Periglacial landforms moving via permafrost creep. Significant hydrological stores.</li>
        <li><strong>Detection:</strong> Manual digitization on Google Earth; InSAR for creep speed.</li>
        <li><strong>Status:</strong> No comprehensive HMA-wide inventory exists; local inventories only (Tian Shan, Himalayas).</li>
      </ul>
    </div>
    <div class="fragment" style="margin-top: 20px;">
      <h4>Aufeis (Icings)</h4>
      <ul>
        <li><strong>Definition:</strong> Sheet-like layered ice formed by freezing groundwater seepage.</li>
        <li><strong>Inventory:</strong> 3,848 recurrent Aufeis fields identified in Upper Indus Basin ($298~km^2$).</li>
        <li><strong>Role:</strong> Temporary water storage; discharges in early spring.</li>
      </ul>
    </div>
  </div>
  <aside class="notes">
    Two often-overlooked components are rock glaciers and Aufeis. 
    Rock glaciers are mixtures of ice and rock that creep downslope. They are resilient water stores in arid regions. Currently, we lack a complete HMA inventory, relying mostly on fragmented local studies using Google Earth and InSAR.
    Aufeis, or river icings, form from freezing groundwater seepage. Recent studies using Landsat have identified thousands of these features in the Upper Indus Basin. They are hydrologically important because they store water in winter and release it in early spring before the main glacier melt season begins.
  </aside>
</section><section>
  <h3>7. Lake Ice Phenology</h3>
  <p style="font-size: 0.6em;">Key Indicator of Climate Warming</p>
  <div style="font-size: 0.7em;">
    <ul>
      <li><strong>Parameters:</strong> Freeze-up date, Break-up date, Ice duration, Thickness.</li>
      <li><strong>Techniques:</strong>
        <ul>
          <li><em>Optical (MODIS):</em> High temporal resolution, limited by clouds.</li>
          <li><em>Passive Microwave (AMSR-E):</em> All-weather, coarse resolution.</li>
          <li><em>Altimetry (Jason/TOPEX):</em> Lake ice thickness retrieval.</li>
        </ul>
      </li>
      <li><strong>Trends:</strong>
        <ul>
          <li>Delayed freezing, earlier melting $\rightarrow$ Shorter ice duration.</li>
          <li>Some alpine lakes shifting from perennial to seasonal ice cover.</li>
        </ul>
      </li>
    </ul>
  </div>
  <aside class="notes">
    Lake ice is a sensitive sentinel of climate change. We monitor phenology—the timing of freezing and thawing.
    Using MODIS and passive microwave data, we observe a clear trend: lakes are freezing later and breaking up earlier, leading to shorter ice duration. Satellite altimetry is also being innovatively used to measure the thickness of the ice based on the waveform of the radar return. Some lakes on the Tibetan Plateau are even transitioning from having perennial ice cover to being seasonally ice-free.
  </aside>
</section><section>
  <h3>8. Glacier-Related Hazards</h3>
  <div style="font-size: 0.6em; text-align: left;">
    <p><strong>Glacial Lake Outburst Floods (GLOFs):</strong></p>
    <ul>
      <li><strong>Database:</strong> 697 events (1833–2022); 6,906 fatalities.</li>
      <li><strong>Drivers:</strong> Glacier retreat $\rightarrow$ Lake expansion $\rightarrow$ Dam failure (ice/moraine).</li>
    </ul>
    <p><strong>Ice-Rock Avalanches & Collapses:</strong></p>
    <ul>
      <li><strong>Chamoli Disaster (2021):</strong> Massive rock-ice avalanche (~27 million $m^3$) caused >200 deaths. Analyzed via sub-meter optical stereo (WorldView, Pleiades).</li>
      <li><strong>Aru Co Collapse (2016):</strong> Twin glacier collapses analyzed via multiple sensors (ICESat, TanDEM-X).</li>
    </ul>
    <p><strong>Detection Challenges:</strong> Requires high temporal/spatial resolution to capture sudden onsets (e.g., PlanetScope).</p>
  </div>
  <aside class="notes">
    The changing cryosphere increases hazard risk. 
    GLOFs are a major threat, with nearly 700 historical events recorded. The mechanism is usually the rapid expansion of proglacial lakes followed by a moraine or ice dam failure.
    We are also seeing massive structural failures of glaciers. The 2021 Chamoli disaster in India was a wake-up call—a massive rock and ice avalanche that destroyed hydropower infrastructure. Post-event analysis using very-high-resolution commercial imagery (WorldView) was crucial for understanding the volume and mechanics of the failure. Detecting the precursors to these events remains a significant challenge.
  </aside>
</section><section>
  <h3>9. Cryo-Hydrological Modeling</h3>
  <div style="font-size: 0.65em;">
    <ul>
      <li><strong>Role:</strong> Estimating meltwater contribution to runoff where in-situ data is scarce.</li>
      <li><strong>Major Models:</strong>
        <ul>
          <li><em>GloGEM / OGGM / PyGEM:</em> Open-source global evolution models. Couple mass balance with ice flow dynamics.</li>
          <li><em>SRM (Snowmelt Runoff Model):</em> Temperature-indexed.</li>
        </ul>
      </li>
      <li><strong>Critical Inputs from Remote Sensing:</strong>
        <ul>
          <li>Glacier Outlines (RGI) & Debris Cover thickness.</li>
          <li>Surface Topography (NASADEM, Copernicus).</li>
          <li>Ice Thickness: Inferred from surface slope and velocity (High uncertainty).</li>
        </ul>
      </li>
    </ul>
  </div>
  <aside class="notes">
    To understand the hydrological impact, we feed satellite data into numerical models. Models like GloGEM, OGGM, and PyGEM are the standard. They simulate glacier evolution by coupling mass balance with ice flow physics.
    These models rely entirely on remote sensing inputs: glacier outlines, digital elevation models, and debris cover maps. A critical missing link is ice thickness. Since we cannot see the bottom of the glacier from space, we infer thickness from surface slope and velocity, which introduces significant uncertainty into water volume estimates.
  </aside>
</section><section>
  <h3>Hydrological Contributions & Peak Water</h3>
  <div style="font-size: 0.7em;">
    <ul>
      <li><strong>Regional Variation:</strong>
        <ul>
          <li><em>Westerlies (Indus, Amu Darya):</em> Meltwater dominated (>50% contribution).</li>
          <li><em>Monsoon (Ganges, Brahmaputra):</em> Rainfall dominated; glacier melt is secondary.</li>
        </ul>
      </li>
      <li><strong>Peak Water (tipping point of max runoff):</strong>
        <ul>
          <li>Most basins: Expected within next 20–30 years.</li>
          <li>Indus: Projected later (>2060) due to large ice volume.</li>
        </ul>
      </li>
      <li><strong>Uncertainty:</strong> Glacier melt contribution estimates vary widely (e.g., 30% to 73% for Rongbuk catchment) depending on the epoch and method.</li>
    </ul>
  </div>
  <aside class="notes">
    The hydrological dependence on cryospheric melt varies across HMA. The western basins (Indus, Amu Darya) are heavily dependent on snow and ice melt, sometimes exceeding 50% of flow. The eastern basins are dominated by the summer monsoon rainfall.
    A key concept is "Peak Water"—the point at which glacier shrinkage causes runoff to decline. For most of HMA, this tipping point is expected in the next few decades. The Indus, with its massive ice reserves, may not hit this peak until after 2060. However, estimates of melt contributions are highly variable, often differing by huge margins (30% vs 70%) depending on the methodology used.
  </aside>
</section><section>
  <h3>10. Major Challenges in Cryosphere RS</h3>
  <div style="font-size: 0.6em;">
    <ol>
      <li><strong>Uncertainty & Inconsistency:</strong>
        <ul>
          <li>Different sensors/methods yield conflicting MB results.</li>
          <li>Lack of ground-based validation ("Ground Truthing").</li>
        </ul>
      </li>
      <li><strong>Subsurface Knowledge Gap:</strong>
        <ul>
          <li>Cannot directly measure ice thickness, permafrost depth, or sub-glacial hydrology from space.</li>
        </ul>
      </li>
      <li><strong>Physical Limitations:</strong>
        <ul>
          <li>Signal saturation (Snow water equivalent).</li>
          <li>Geometric distortion in SAR (Layover/shadows in steep terrain).</li>
        </ul>
      </li>
      <li><strong>Equifinality in Modeling:</strong>
        <ul>
          <li>Different parameter sets produce the same runoff result, masking incorrect physical assumptions.</li>
        </ul>
      </li>
    </ol>
  </div>
  <aside class="notes">
    Despite our progress, significant challenges remain.
    1. **Inconsistency:** As shown, different satellites give different answers for the same glacier. We lack enough ground truthing to know which one is right.
    2. **Subsurface Blindness:** Satellites see the surface. We are blind to ice thickness, permafrost depth, and sub-glacial water flow.
    3. **Terrain:** The steep topography of HMA creates shadows and distortions in SAR and optical data.
    4. **Equifinality:** In modeling, we can get the "right" answer for river runoff using the "wrong" physical parameters (e.g., wrong ice thickness balanced by wrong melt factor). This limits our predictive confidence.
  </aside>
</section><section>
  <h3>11. Future Directions</h3>
  <div style="font-size: 0.65em;">
    <ul>
      <li><strong>Technological Innovation:</strong>
        <ul>
          <li>Integration of multi-frequency SAR (L-band + C-band) for better penetration (snow/ice).</li>
          <li>Utilization of Big Data platforms (Google Earth Engine) for scale.</li>
        </ul>
      </li>
      <li><strong>Methodological Advancement:</strong>
        <ul>
          <li>Machine Learning/Deep Learning for automated feature extraction (e.g., debris-covered ice).</li>
          <li>Data Assimilation: Combining remote sensing observation directly into physical models to constrain state variables.</li>
        </ul>
      </li>
      <li><strong>Strategic Focus:</strong>
        <ul>
          <li>Cross-verification of independent datasets to reduce uncertainty.</li>
          <li>Prioritizing determining debris-cover thickness and glacier bed topography.</li>
        </ul>
      </li>
    </ul>
  </div>
  <aside class="notes">
    Looking forward, the review identifies three key paths:
    1. **Technology:** We need to combine different SAR frequencies (like L-band and C-band) to see deeper into the snowpack.
    2. **AI & Big Data:** We must leverage platforms like Google Earth Engine and Deep Learning to automate the processing of these massive datasets, particularly for difficult tasks like debris-cover mapping.
    3. **Data Assimilation:** We need to move beyond using remote sensing just for calibration. We should assimilate satellite observations directly into hydrological models in near-real-time to constrain uncertainties.
  </aside>
</section><section>
  <h3>Conclusion</h3>
  <div style="text-align: left; font-size: 0.7em;">
    <p><strong>Summary:</strong></p>
    <ul>
      <li>Remote sensing is indispensable for HMA due to logistical inaccessibility.</li>
      <li>Vast progress in 60 years: From simple photography to complex interferometry and altimetry.</li>
      <li><strong>Key Findings:</strong> Widespread mass loss (except Karakoram), permafrost degradation, and increasing hydrological variability.</li>
    </ul>
    <p><strong>The Path Forward:</strong></p>
    <ul>
      <li>Move from "observation" to "integrated prediction."</li>
      <li>Need for interdisciplinary approaches combining glaciology, hydrology, and computer science (AI).</li>
      <li>Improve ground-based networks to validate the "eyes in the sky."</li>
    </ul>
  </div>
  <aside class="notes">
    In conclusion, remote sensing has revolutionized our understanding of High Mountain Asia. We have moved from simple mapping to complex physical quantification of mass, energy, and flow.
    The data paints a clear picture of a cryosphere in rapid transition. To manage the consequences—water security and hazards—we must now focus on integrating these diverse datasets into robust predictive models, supported by advanced AI and validated by strategic ground observations.
  </aside>
</section><section>
  <h3>Selected References</h3>
  <div style="font-size: 0.4em; text-align: left; columns: 2;">
    <p> Ye, Q., et al. "Remote Sensing and Modeling of the Cryosphere..." <em>Remote Sens.</em> 2024, 16, 1709.</p>
    <p> Yao, T., et al. "The imbalance of the Asian water tower." <em>Nat. Rev. Earth Environ.</em> 2022.</p>
    <p> Shugar, D.H., et al. "A massive rock and ice avalanche caused the 2021 disaster at Chamoli..." <em>Science</em> 2021.</p>
    <p> Hugonnet, R., et al. "Accelerated global glacier mass loss..." <em>Nature</em> 2021.</p>
    <p> RGI Consortium. "Randolph Glacier Inventory 7.0" 2023.</p>
    <p> Farinotti, D., et al. "A consensus estimate for the ice thickness..." <em>Nat. Geosci.</em> 2019.</p>
    <p> Shean, D.E., et al. "A Systematic, Regional Assessment of High Mountain Asia Glacier Mass Balance." <em>Front. Earth Sci.</em> 2020.</p>
    <p> Kraaijenbrink, P.D.A., et al. "Climate change decisive for Asia’s snow meltwater supply." <em>Nat. Clim. Chang.</em> 2021.</p>
  </div>
  <aside class="notes">
    Here are the key references underpinning this presentation. The primary source is the review by Ye et al., 2024. Thank you for your attention.
  </aside>
</section>
