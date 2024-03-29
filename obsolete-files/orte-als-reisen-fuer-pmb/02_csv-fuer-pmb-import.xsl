<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:foo="whatever"  version="3.0">
    <xsl:output method="xml" indent="true"/>
    <xsl:mode on-no-match="shallow-skip"/>
   
   <xsl:variable name="orte" as="node()">
       <root>
   <pmbPlace>796</pmbPlace>
   <pmbPlace>50</pmbPlace>
   <pmbPlace>146</pmbPlace>
   <pmbPlace>58556</pmbPlace>
   <pmbPlace>62041</pmbPlace>
   <pmbPlace>913</pmbPlace>
   <pmbPlace>91050</pmbPlace>
   <pmbPlace>40709</pmbPlace>
   <pmbPlace>58810</pmbPlace>
   <pmbPlace>44313</pmbPlace>
   <pmbPlace>44119</pmbPlace>
   <pmbPlace>45258</pmbPlace>
   <pmbPlace>91030</pmbPlace>
   <pmbPlace>91165</pmbPlace>
   <pmbPlace>909</pmbPlace>
   <pmbPlace>987</pmbPlace>
   <pmbPlace>34199</pmbPlace>
   <pmbPlace>867</pmbPlace>
   <pmbPlace>40336</pmbPlace>
   <pmbPlace>30</pmbPlace>
   <pmbPlace>874</pmbPlace>
   <pmbPlace>415</pmbPlace>
   <pmbPlace>213</pmbPlace>
   <pmbPlace>797</pmbPlace>
   <pmbPlace>91054</pmbPlace>
   <pmbPlace>91802</pmbPlace>
   <pmbPlace>90733</pmbPlace>
   <pmbPlace>91131</pmbPlace>
   <pmbPlace>521</pmbPlace>
   <pmbPlace>54760</pmbPlace>
   <pmbPlace>91324</pmbPlace>
   <pmbPlace>90057</pmbPlace>
   <pmbPlace>91383</pmbPlace>
   <pmbPlace>92089</pmbPlace>
   <pmbPlace>90843</pmbPlace>
   <pmbPlace>90060</pmbPlace>
   <pmbPlace>90981</pmbPlace>
   <pmbPlace>90911</pmbPlace>
   <pmbPlace>897</pmbPlace>
   <pmbPlace>91794</pmbPlace>
   <pmbPlace>91245</pmbPlace>
   <pmbPlace>91247</pmbPlace>
   <pmbPlace>92011</pmbPlace>
   <pmbPlace>44278</pmbPlace>
   <pmbPlace>49990</pmbPlace>
   <pmbPlace>892</pmbPlace>
   <pmbPlace>90063</pmbPlace>
   <pmbPlace>34946</pmbPlace>
   <pmbPlace>44374</pmbPlace>
   <pmbPlace>91298</pmbPlace>
   <pmbPlace>90342</pmbPlace>
   <pmbPlace>91514</pmbPlace>
   <pmbPlace>49135</pmbPlace>
   <pmbPlace>90132</pmbPlace>
   <pmbPlace>49343</pmbPlace>
   <pmbPlace>91846</pmbPlace>
   <pmbPlace>91798</pmbPlace>
   <pmbPlace>43520</pmbPlace>
   <pmbPlace>40260</pmbPlace>
   <pmbPlace>90237</pmbPlace>
   <pmbPlace>39615</pmbPlace>
   <pmbPlace>44246</pmbPlace>
   <pmbPlace>38096</pmbPlace>
   <pmbPlace>43471</pmbPlace>
   <pmbPlace>91574</pmbPlace>
   <pmbPlace>90989</pmbPlace>
   <pmbPlace>91973</pmbPlace>
   <pmbPlace>34344</pmbPlace>
   <pmbPlace>484</pmbPlace>
   <pmbPlace>90264</pmbPlace>
   <pmbPlace>91598</pmbPlace>
   <pmbPlace>92021</pmbPlace>
   <pmbPlace>90641</pmbPlace>
   <pmbPlace>53632</pmbPlace>
   <pmbPlace>90290</pmbPlace>
   <pmbPlace>967</pmbPlace>
   <pmbPlace>49781</pmbPlace>
   <pmbPlace>89841</pmbPlace>
   <pmbPlace>54223</pmbPlace>
   <pmbPlace>885</pmbPlace>
   <pmbPlace>91506</pmbPlace>
   <pmbPlace>91227</pmbPlace>
   <pmbPlace>90322</pmbPlace>
   <pmbPlace>90426</pmbPlace>
   <pmbPlace>91936</pmbPlace>
   <pmbPlace>60525</pmbPlace>
   <pmbPlace>886</pmbPlace>
   <pmbPlace>883</pmbPlace>
   <pmbPlace>168</pmbPlace>
   <pmbPlace>90550</pmbPlace>
   <pmbPlace>182</pmbPlace>
   <pmbPlace>224</pmbPlace>
   <pmbPlace>36448</pmbPlace>
   <pmbPlace>44273</pmbPlace>
   <pmbPlace>91626</pmbPlace>
   <pmbPlace>92005</pmbPlace>
   <pmbPlace>91348</pmbPlace>
   <pmbPlace>90069</pmbPlace>
   <pmbPlace>90938</pmbPlace>
   <pmbPlace>90048</pmbPlace>
   <pmbPlace>91417</pmbPlace>
   <pmbPlace>862</pmbPlace>
   <pmbPlace>228</pmbPlace>
   <pmbPlace>88392</pmbPlace>
   <pmbPlace>91928</pmbPlace>
   <pmbPlace>90168</pmbPlace>
   <pmbPlace>87802</pmbPlace>
   <pmbPlace>91395</pmbPlace>
   <pmbPlace>912</pmbPlace>
   <pmbPlace>90787</pmbPlace>
   <pmbPlace>90749</pmbPlace>
   <pmbPlace>90072</pmbPlace>
   <pmbPlace>90571</pmbPlace>
   <pmbPlace>90573</pmbPlace>
   <pmbPlace>34627</pmbPlace>
   <pmbPlace>92057</pmbPlace>
   <pmbPlace>431</pmbPlace>
   <pmbPlace>36515</pmbPlace>
   <pmbPlace>88115</pmbPlace>
   <pmbPlace>92111</pmbPlace>
   <pmbPlace>91622</pmbPlace>
   <pmbPlace>45549</pmbPlace>
   <pmbPlace>40201</pmbPlace>
   <pmbPlace>54863</pmbPlace>
   <pmbPlace>968</pmbPlace>
   <pmbPlace>64740</pmbPlace>
   <pmbPlace>75</pmbPlace>
   <pmbPlace>140</pmbPlace>
   <pmbPlace>44725</pmbPlace>
   <pmbPlace>465</pmbPlace>
   <pmbPlace>462</pmbPlace>
   <pmbPlace>91735</pmbPlace>
   <pmbPlace>412</pmbPlace>
   <pmbPlace>756</pmbPlace>
   <pmbPlace>992</pmbPlace>
   <pmbPlace>40112</pmbPlace>
   <pmbPlace>44271</pmbPlace>
   <pmbPlace>90535</pmbPlace>
   <pmbPlace>91478</pmbPlace>
   <pmbPlace>44317</pmbPlace>
   <pmbPlace>90519</pmbPlace>
   <pmbPlace>90759</pmbPlace>
   <pmbPlace>90727</pmbPlace>
   <pmbPlace>91715</pmbPlace>
   <pmbPlace>40892</pmbPlace>
   <pmbPlace>91959</pmbPlace>
   <pmbPlace>54767</pmbPlace>
   <pmbPlace>90825</pmbPlace>
   <pmbPlace>91147</pmbPlace>
   <pmbPlace>49880</pmbPlace>
   <pmbPlace>44397</pmbPlace>
   <pmbPlace>46447</pmbPlace>
   <pmbPlace>92109</pmbPlace>
   <pmbPlace>948</pmbPlace>
   <pmbPlace>90134</pmbPlace>
   <pmbPlace>1036</pmbPlace>
   <pmbPlace>91770</pmbPlace>
   <pmbPlace>91153</pmbPlace>
   <pmbPlace>91105</pmbPlace>
   <pmbPlace>91251</pmbPlace>
   <pmbPlace>91223</pmbPlace>
   <pmbPlace>531</pmbPlace>
   <pmbPlace>64265</pmbPlace>
   <pmbPlace>90233</pmbPlace>
   <pmbPlace>865</pmbPlace>
   <pmbPlace>91077</pmbPlace>
   <pmbPlace>90182</pmbPlace>
   <pmbPlace>91524</pmbPlace>
   <pmbPlace>842</pmbPlace>
   <pmbPlace>772</pmbPlace>
   <pmbPlace>390</pmbPlace>
   <pmbPlace>44172</pmbPlace>
   <pmbPlace>414</pmbPlace>
   <pmbPlace>1181</pmbPlace>
   <pmbPlace>33929</pmbPlace>
   <pmbPlace>40127</pmbPlace>
   <pmbPlace>90956</pmbPlace>
   <pmbPlace>90186</pmbPlace>
   <pmbPlace>424</pmbPlace>
   <pmbPlace>90905</pmbPlace>
   <pmbPlace>681</pmbPlace>
   <pmbPlace>52262</pmbPlace>
   <pmbPlace>52583</pmbPlace>
   <pmbPlace>50367</pmbPlace>
   <pmbPlace>41234</pmbPlace>
   <pmbPlace>90845</pmbPlace>
   <pmbPlace>90217</pmbPlace>
   <pmbPlace>47414</pmbPlace>
   <pmbPlace>90803</pmbPlace>
   <pmbPlace>49690</pmbPlace>
   <pmbPlace>64301</pmbPlace>
   <pmbPlace>43368</pmbPlace>
   <pmbPlace>884</pmbPlace>
   <pmbPlace>42572</pmbPlace>
   <pmbPlace>90138</pmbPlace>
   <pmbPlace>64401</pmbPlace>
   <pmbPlace>92029</pmbPlace>
   <pmbPlace>91820</pmbPlace>
   <pmbPlace>90799</pmbPlace>
   <pmbPlace>91397</pmbPlace>
   <pmbPlace>91360</pmbPlace>
   <pmbPlace>90859</pmbPlace>
   <pmbPlace>91318</pmbPlace>
   <pmbPlace>40290</pmbPlace>
   <pmbPlace>91916</pmbPlace>
   <pmbPlace>90141</pmbPlace>
   <pmbPlace>90837</pmbPlace>
   <pmbPlace>42542</pmbPlace>
   <pmbPlace>90831</pmbPlace>
   <pmbPlace>41072</pmbPlace>
   <pmbPlace>91181</pmbPlace>
   <pmbPlace>91320</pmbPlace>
   <pmbPlace>36296</pmbPlace>
   <pmbPlace>1119</pmbPlace>
   <pmbPlace>40705</pmbPlace>
   <pmbPlace>91983</pmbPlace>
   <pmbPlace>40700</pmbPlace>
   <pmbPlace>42675</pmbPlace>
   <pmbPlace>64393</pmbPlace>
   <pmbPlace>958</pmbPlace>
   <pmbPlace>1091</pmbPlace>
   <pmbPlace>90917</pmbPlace>
   <pmbPlace>90374</pmbPlace>
   <pmbPlace>592</pmbPlace>
   <pmbPlace>64766</pmbPlace>
   <pmbPlace>44131</pmbPlace>
   <pmbPlace>123</pmbPlace>
   <pmbPlace>90962</pmbPlace>
   <pmbPlace>47030</pmbPlace>
   <pmbPlace>58725</pmbPlace>
   <pmbPlace>64263</pmbPlace>
   <pmbPlace>91496</pmbPlace>
   <pmbPlace>90689</pmbPlace>
   <pmbPlace>93875</pmbPlace>
   <pmbPlace>90146</pmbPlace>
   <pmbPlace>804</pmbPlace>
   <pmbPlace>19527</pmbPlace>
   <pmbPlace>91857</pmbPlace>
   <pmbPlace>1022</pmbPlace>
   <pmbPlace>91552</pmbPlace>
   <pmbPlace>55088</pmbPlace>
   <pmbPlace>36189</pmbPlace>
   <pmbPlace>840</pmbPlace>
   <pmbPlace>90661</pmbPlace>
   <pmbPlace>91812</pmbPlace>
   <pmbPlace>90617</pmbPlace>
   <pmbPlace>34860</pmbPlace>
   <pmbPlace>40380</pmbPlace>
   <pmbPlace>91413</pmbPlace>
   <pmbPlace>91026</pmbPlace>
   <pmbPlace>90665</pmbPlace>
   <pmbPlace>91681</pmbPlace>
   <pmbPlace>41003</pmbPlace>
   <pmbPlace>996</pmbPlace>
   <pmbPlace>34194</pmbPlace>
   <pmbPlace>40632</pmbPlace>
   <pmbPlace>34014</pmbPlace>
   <pmbPlace>49469</pmbPlace>
   <pmbPlace>39752</pmbPlace>
   <pmbPlace>34048</pmbPlace>
   <pmbPlace>64703</pmbPlace>
   <pmbPlace>54930</pmbPlace>
   <pmbPlace>936</pmbPlace>
   <pmbPlace>854</pmbPlace>
   <pmbPlace>90515</pmbPlace>
   <pmbPlace>36477</pmbPlace>
   <pmbPlace>91336</pmbPlace>
   <pmbPlace>92117</pmbPlace>
   <pmbPlace>50004</pmbPlace>
   <pmbPlace>90472</pmbPlace>
   <pmbPlace>52051</pmbPlace>
   <pmbPlace>40483</pmbPlace>
   <pmbPlace>91604</pmbPlace>
   <pmbPlace>64657</pmbPlace>
   <pmbPlace>562</pmbPlace>
   <pmbPlace>512</pmbPlace>
   <pmbPlace>91284</pmbPlace>
   <pmbPlace>916</pmbPlace>
   <pmbPlace>88187</pmbPlace>
   <pmbPlace>92075</pmbPlace>
   <pmbPlace>91679</pmbPlace>
   <pmbPlace>90769</pmbPlace>
   <pmbPlace>90396</pmbPlace>
   <pmbPlace>91221</pmbPlace>
   <pmbPlace>90075</pmbPlace>
   <pmbPlace>90725</pmbPlace>
   <pmbPlace>90677</pmbPlace>
   <pmbPlace>90745</pmbPlace>
   <pmbPlace>92055</pmbPlace>
   <pmbPlace>91089</pmbPlace>
   <pmbPlace>41059</pmbPlace>
   <pmbPlace>36232</pmbPlace>
   <pmbPlace>44600</pmbPlace>
   <pmbPlace>44210</pmbPlace>
   <pmbPlace>896</pmbPlace>
   <pmbPlace>90627</pmbPlace>
   <pmbPlace>44156</pmbPlace>
   <pmbPlace>44153</pmbPlace>
   <pmbPlace>91749</pmbPlace>
   <pmbPlace>91618</pmbPlace>
   <pmbPlace>4845</pmbPlace>
   <pmbPlace>470</pmbPlace>
   <pmbPlace>90320</pmbPlace>
   <pmbPlace>42960</pmbPlace>
   <pmbPlace>36282</pmbPlace>
   <pmbPlace>605</pmbPlace>
   <pmbPlace>91081</pmbPlace>
   <pmbPlace>43059</pmbPlace>
   <pmbPlace>90081</pmbPlace>
   <pmbPlace>43062</pmbPlace>
   <pmbPlace>41052</pmbPlace>
   <pmbPlace>91350</pmbPlace>
   <pmbPlace>91526</pmbPlace>
   <pmbPlace>91490</pmbPlace>
   <pmbPlace>41013</pmbPlace>
   <pmbPlace>91932</pmbPlace>
   <pmbPlace>90715</pmbPlace>
   <pmbPlace>90446</pmbPlace>
   <pmbPlace>90084</pmbPlace>
   <pmbPlace>90208</pmbPlace>
   <pmbPlace>90436</pmbPlace>
   <pmbPlace>40362</pmbPlace>
   <pmbPlace>90170</pmbPlace>
   <pmbPlace>91431</pmbPlace>
   <pmbPlace>91608</pmbPlace>
   <pmbPlace>44311</pmbPlace>
   <pmbPlace>90647</pmbPlace>
   <pmbPlace>91885</pmbPlace>
   <pmbPlace>954</pmbPlace>
   <pmbPlace>50817</pmbPlace>
   <pmbPlace>90919</pmbPlace>
   <pmbPlace>88963</pmbPlace>
   <pmbPlace>40867</pmbPlace>
   <pmbPlace>43055</pmbPlace>
   <pmbPlace>64277</pmbPlace>
   <pmbPlace>920</pmbPlace>
   <pmbPlace>545</pmbPlace>
   <pmbPlace>790</pmbPlace>
   <pmbPlace>714</pmbPlace>
   <pmbPlace>91944</pmbPlace>
   <pmbPlace>851</pmbPlace>
   <pmbPlace>61062</pmbPlace>
   <pmbPlace>91780</pmbPlace>
   <pmbPlace>682</pmbPlace>
   <pmbPlace>49149</pmbPlace>
   <pmbPlace>92731</pmbPlace>
   <pmbPlace>48761</pmbPlace>
   <pmbPlace>90051</pmbPlace>
   <pmbPlace>49181</pmbPlace>
   <pmbPlace>90797</pmbPlace>
   <pmbPlace>90229</pmbPlace>
   <pmbPlace>40256</pmbPlace>
   <pmbPlace>90194</pmbPlace>
   <pmbPlace>90960</pmbPlace>
   <pmbPlace>44982</pmbPlace>
   <pmbPlace>90087</pmbPlace>
   <pmbPlace>49309</pmbPlace>
   <pmbPlace>90971</pmbPlace>
   <pmbPlace>91381</pmbPlace>
   <pmbPlace>40435</pmbPlace>
   <pmbPlace>90148</pmbPlace>
   <pmbPlace>91073</pmbPlace>
   <pmbPlace>90366</pmbPlace>
   <pmbPlace>91697</pmbPlace>
   <pmbPlace>90695</pmbPlace>
   <pmbPlace>90119</pmbPlace>
   <pmbPlace>38518</pmbPlace>
   <pmbPlace>90478</pmbPlace>
   <pmbPlace>91899</pmbPlace>
   <pmbPlace>91918</pmbPlace>
   <pmbPlace>90090</pmbPlace>
   <pmbPlace>34067</pmbPlace>
   <pmbPlace>90392</pmbPlace>
   <pmbPlace>926</pmbPlace>
   <pmbPlace>56147</pmbPlace>
   <pmbPlace>91282</pmbPlace>
   <pmbPlace>994</pmbPlace>
   <pmbPlace>44267</pmbPlace>
   <pmbPlace>445</pmbPlace>
   <pmbPlace>263</pmbPlace>
   <pmbPlace>91111</pmbPlace>
   <pmbPlace>91113</pmbPlace>
   <pmbPlace>91800</pmbPlace>
   <pmbPlace>44368</pmbPlace>
   <pmbPlace>608</pmbPlace>
   <pmbPlace>946</pmbPlace>
   <pmbPlace>43040</pmbPlace>
   <pmbPlace>92031</pmbPlace>
   <pmbPlace>90151</pmbPlace>
   <pmbPlace>40264</pmbPlace>
   <pmbPlace>91003</pmbPlace>
   <pmbPlace>92071</pmbPlace>
   <pmbPlace>428</pmbPlace>
   <pmbPlace>723</pmbPlace>
   <pmbPlace>759</pmbPlace>
   <pmbPlace>90093</pmbPlace>
   <pmbPlace>591</pmbPlace>
   <pmbPlace>40302</pmbPlace>
   <pmbPlace>91308</pmbPlace>
   <pmbPlace>36328</pmbPlace>
   <pmbPlace>91532</pmbPlace>
   <pmbPlace>90875</pmbPlace>
   <pmbPlace>45236</pmbPlace>
   <pmbPlace>91554</pmbPlace>
   <pmbPlace>92085</pmbPlace>
   <pmbPlace>91038</pmbPlace>
   <pmbPlace>90243</pmbPlace>
   <pmbPlace>735</pmbPlace>
   <pmbPlace>230</pmbPlace>
   <pmbPlace>44258</pmbPlace>
   <pmbPlace>88</pmbPlace>
   <pmbPlace>50910</pmbPlace>
   <pmbPlace>91314</pmbPlace>
   <pmbPlace>91914</pmbPlace>
   <pmbPlace>44151</pmbPlace>
   <pmbPlace>91993</pmbPlace>
   <pmbPlace>91691</pmbPlace>
   <pmbPlace>50925</pmbPlace>
   <pmbPlace>304</pmbPlace>
   <pmbPlace>90987</pmbPlace>
   <pmbPlace>91229</pmbPlace>
   <pmbPlace>90126</pmbPlace>
   <pmbPlace>427</pmbPlace>
   <pmbPlace>91903</pmbPlace>
   <pmbPlace>90152</pmbPlace>
   <pmbPlace>91480</pmbPlace>
   <pmbPlace>40808</pmbPlace>
   <pmbPlace>90428</pmbPlace>
   <pmbPlace>461</pmbPlace>
   <pmbPlace>88117</pmbPlace>
   <pmbPlace>44521</pmbPlace>
   <pmbPlace>91330</pmbPlace>
   <pmbPlace>629</pmbPlace>
   <pmbPlace>90444</pmbPlace>
   <pmbPlace>90245</pmbPlace>
   <pmbPlace>1283</pmbPlace>
   <pmbPlace>901</pmbPlace>
   <pmbPlace>48769</pmbPlace>
   <pmbPlace>906</pmbPlace>
   <pmbPlace>44129</pmbPlace>
   <pmbPlace>90190</pmbPlace>
   <pmbPlace>40881</pmbPlace>
   <pmbPlace>91572</pmbPlace>
   <pmbPlace>655</pmbPlace>
   <pmbPlace>91173</pmbPlace>
   <pmbPlace>824</pmbPlace>
   <pmbPlace>40384</pmbPlace>
   <pmbPlace>40804</pmbPlace>
   <pmbPlace>127</pmbPlace>
   <pmbPlace>41022</pmbPlace>
   <pmbPlace>92013</pmbPlace>
   <pmbPlace>91267</pmbPlace>
   <pmbPlace>90442</pmbPlace>
   <pmbPlace>36456</pmbPlace>
   <pmbPlace>847</pmbPlace>
   <pmbPlace>64763</pmbPlace>
   <pmbPlace>365</pmbPlace>
   <pmbPlace>92195</pmbPlace>
   <pmbPlace>91556</pmbPlace>
   <pmbPlace>91776</pmbPlace>
   <pmbPlace>52353</pmbPlace>
   <pmbPlace>413</pmbPlace>
   <pmbPlace>955</pmbPlace>
   <pmbPlace>90099</pmbPlace>
   <pmbPlace>44510</pmbPlace>
   <pmbPlace>91213</pmbPlace>
   <pmbPlace>90877</pmbPlace>
   <pmbPlace>44252</pmbPlace>
   <pmbPlace>44089</pmbPlace>
   <pmbPlace>91261</pmbPlace>
   <pmbPlace>90649</pmbPlace>
   <pmbPlace>121</pmbPlace>
   <pmbPlace>92063</pmbPlace>
   <pmbPlace>2351</pmbPlace>
   <pmbPlace>40933</pmbPlace>
   <pmbPlace>44240</pmbPlace>
   <pmbPlace>430</pmbPlace>
   <pmbPlace>92091</pmbPlace>
   <pmbPlace>92003</pmbPlace>
   <pmbPlace>91542</pmbPlace>
   <pmbPlace>91717</pmbPlace>
   <pmbPlace>90929</pmbPlace>
   <pmbPlace>90156</pmbPlace>
   <pmbPlace>91867</pmbPlace>
   <pmbPlace>90157</pmbPlace>
   <pmbPlace>1236</pmbPlace>
   <pmbPlace>45092</pmbPlace>
   <pmbPlace>91969</pmbPlace>
   <pmbPlace>92101</pmbPlace>
   <pmbPlace>91731</pmbPlace>
   <pmbPlace>91504</pmbPlace>
   <pmbPlace>40307</pmbPlace>
   <pmbPlace>90162</pmbPlace>
   <pmbPlace>93878</pmbPlace>
   <pmbPlace>91606</pmbPlace>
   <pmbPlace>40812</pmbPlace>
   <pmbPlace>4650</pmbPlace>
   <pmbPlace>89077</pmbPlace>
   <pmbPlace>667</pmbPlace>
   <pmbPlace>90294</pmbPlace>
   <pmbPlace>90567</pmbPlace>
   <pmbPlace>91253</pmbPlace>
   <pmbPlace>92033</pmbPlace>
   <pmbPlace>91046</pmbPlace>
   <pmbPlace>60017</pmbPlace>
   <pmbPlace>91639</pmbPlace>
   <pmbPlace>988</pmbPlace>
   <pmbPlace>51945</pmbPlace>
   <pmbPlace>467</pmbPlace>
   <pmbPlace>40474</pmbPlace>
   <pmbPlace>39874</pmbPlace>
   <pmbPlace>92739</pmbPlace>
   <pmbPlace>90340</pmbPlace>
   <pmbPlace>91999</pmbPlace>
   <pmbPlace>33</pmbPlace>
   <pmbPlace>90785</pmbPlace>
   <pmbPlace>90897</pmbPlace>
   <pmbPlace>90895</pmbPlace>
   <pmbPlace>91342</pmbPlace>
   <pmbPlace>1223</pmbPlace>
   <pmbPlace>91922</pmbPlace>
   <pmbPlace>90268</pmbPlace>
   <pmbPlace>91274</pmbPlace>
   <pmbPlace>882</pmbPlace>
   <pmbPlace>64281</pmbPlace>
   <pmbPlace>49714</pmbPlace>
   <pmbPlace>91564</pmbPlace>
   <pmbPlace>44269</pmbPlace>
   <pmbPlace>88767</pmbPlace>
   <pmbPlace>90204</pmbPlace>
   <pmbPlace>91385</pmbPlace>
   <pmbPlace>774</pmbPlace>
   <pmbPlace>49115</pmbPlace>
   <pmbPlace>90356</pmbPlace>
   <pmbPlace>45260</pmbPlace>
   <pmbPlace>34050</pmbPlace>
   <pmbPlace>90</pmbPlace>
   <pmbPlace>44493</pmbPlace>
   <pmbPlace>51937</pmbPlace>
   <pmbPlace>1090</pmbPlace>
   <pmbPlace>56525</pmbPlace>
   <pmbPlace>53850</pmbPlace>
   <pmbPlace>90221</pmbPlace>
   <pmbPlace>91924</pmbPlace>
   <pmbPlace>258</pmbPlace>
   <pmbPlace>34108</pmbPlace>
   <pmbPlace>58684</pmbPlace>
   <pmbPlace>43991</pmbPlace>
   <pmbPlace>51646</pmbPlace>
   <pmbPlace>91155</pmbPlace>
   <pmbPlace>47658</pmbPlace>
   <pmbPlace>90252</pmbPlace>
   <pmbPlace>44256</pmbPlace>
   <pmbPlace>49966</pmbPlace>
   <pmbPlace>91987</pmbPlace>
   <pmbPlace>941</pmbPlace>
   <pmbPlace>40407</pmbPlace>
   <pmbPlace>12589</pmbPlace>
   <pmbPlace>1138</pmbPlace>
   <pmbPlace>92105</pmbPlace>
   <pmbPlace>91083</pmbPlace>
   <pmbPlace>34387</pmbPlace>
   <pmbPlace>90581</pmbPlace>
   <pmbPlace>92622</pmbPlace>
   <pmbPlace>483</pmbPlace>
   <pmbPlace>92627</pmbPlace>
   <pmbPlace>51797</pmbPlace>
   <pmbPlace>52548</pmbPlace>
   <pmbPlace>52580</pmbPlace>
   <pmbPlace>91067</pmbPlace>
   <pmbPlace>90175</pmbPlace>
   <pmbPlace>90605</pmbPlace>
   <pmbPlace>925</pmbPlace>
   <pmbPlace>90153</pmbPlace>
   <pmbPlace>44303</pmbPlace>
   <pmbPlace>90114</pmbPlace>
   <pmbPlace>91129</pmbPlace>
   <pmbPlace>90517</pmbPlace>
   <pmbPlace>40725</pmbPlace>
   <pmbPlace>91371</pmbPlace>
   <pmbPlace>34896</pmbPlace>
   <pmbPlace>90172</pmbPlace>
   <pmbPlace>53150</pmbPlace>
   <pmbPlace>53152</pmbPlace>
   <pmbPlace>92757</pmbPlace>
   <pmbPlace>90883</pmbPlace>
   <pmbPlace>90286</pmbPlace>
   <pmbPlace>47966</pmbPlace>
   <pmbPlace>90747</pmbPlace>
   <pmbPlace>90601</pmbPlace>
   <pmbPlace>58094</pmbPlace>
   <pmbPlace>57941</pmbPlace>
   <pmbPlace>62679</pmbPlace>
   <pmbPlace>62297</pmbPlace>
   <pmbPlace>62282</pmbPlace>
   <pmbPlace>62289</pmbPlace>
   <pmbPlace>91934</pmbPlace>
   <pmbPlace>91661</pmbPlace>
   <pmbPlace>64261</pmbPlace>
   <pmbPlace>491</pmbPlace>
   <pmbPlace>64485</pmbPlace>
   <pmbPlace>58779</pmbPlace>
   <pmbPlace>91610</pmbPlace>
   <pmbPlace>90336</pmbPlace>
   <pmbPlace>91871</pmbPlace>
   <pmbPlace>43995</pmbPlace>
   <pmbPlace>64255</pmbPlace>
   <pmbPlace>91159</pmbPlace>
   <pmbPlace>64215</pmbPlace>
   <pmbPlace>90260</pmbPlace>
   <pmbPlace>92483</pmbPlace>
   <pmbPlace>41063</pmbPlace>
   <pmbPlace>91850</pmbPlace>
   <pmbPlace>631</pmbPlace>
   <pmbPlace>40655</pmbPlace>
   <pmbPlace>90613</pmbPlace>
   <pmbPlace>65723</pmbPlace>
   <pmbPlace>91265</pmbPlace>
   <pmbPlace>65733</pmbPlace>
   <pmbPlace>90123</pmbPlace>
   <pmbPlace>90129</pmbPlace>
   <pmbPlace>90468</pmbPlace>
   <pmbPlace>44248</pmbPlace>
   <pmbPlace>245</pmbPlace>
   <pmbPlace>47911</pmbPlace>
   <pmbPlace>90484</pmbPlace>
   <pmbPlace>44097</pmbPlace>
   <pmbPlace>54953</pmbPlace>
   <pmbPlace>90188</pmbPlace>
   <pmbPlace>91278</pmbPlace>
   <pmbPlace>90400</pmbPlace>
   <pmbPlace>34007</pmbPlace>
   <pmbPlace>90741</pmbPlace>
   <pmbPlace>90316</pmbPlace>
   <pmbPlace>90983</pmbPlace>
   <pmbPlace>90418</pmbPlace>
   <pmbPlace>50822</pmbPlace>
   <pmbPlace>91855</pmbPlace>
   <pmbPlace>90693</pmbPlace>
   <pmbPlace>40858</pmbPlace>
   <pmbPlace>58</pmbPlace>
   <pmbPlace>14</pmbPlace>
   <pmbPlace>817</pmbPlace>
   <pmbPlace>90771</pmbPlace>
   <pmbPlace>574</pmbPlace>
   <pmbPlace>92292</pmbPlace>
   <pmbPlace>96</pmbPlace>
   <pmbPlace>176</pmbPlace>
   <pmbPlace>92202</pmbPlace>
   <pmbPlace>90687</pmbPlace>
   <pmbPlace>55</pmbPlace>
   <pmbPlace>91530</pmbPlace>
   <pmbPlace>150</pmbPlace>
   <pmbPlace>92586</pmbPlace>
   <pmbPlace>91663</pmbPlace>
   <pmbPlace>113</pmbPlace>
   <pmbPlace>64219</pmbPlace>
   <pmbPlace>92463</pmbPlace>
   <pmbPlace>170</pmbPlace>
   <pmbPlace>90913</pmbPlace>
   <pmbPlace>90511</pmbPlace>
   <pmbPlace>90502</pmbPlace>
   <pmbPlace>455</pmbPlace>
   <pmbPlace>91014</pmbPlace>
   <pmbPlace>3721</pmbPlace>
   <pmbPlace>1076</pmbPlace>
   <pmbPlace>505</pmbPlace>
   <pmbPlace>90579</pmbPlace>
   <pmbPlace>966</pmbPlace>
   <pmbPlace>90575</pmbPlace>
   <pmbPlace>91449</pmbPlace>
   <pmbPlace>90386</pmbPlace>
   <pmbPlace>91034</pmbPlace>
   <pmbPlace>92271</pmbPlace>
   <pmbPlace>1075</pmbPlace>
   <pmbPlace>90757</pmbPlace>
   <pmbPlace>92388</pmbPlace>
   <pmbPlace>90440</pmbPlace>
   <pmbPlace>91143</pmbPlace>
   <pmbPlace>2734</pmbPlace>
   <pmbPlace>90889</pmbPlace>
   <pmbPlace>44413</pmbPlace>
   <pmbPlace>92280</pmbPlace>
   <pmbPlace>63</pmbPlace>
   <pmbPlace>92289</pmbPlace>
   <pmbPlace>8062</pmbPlace>
   <pmbPlace>1246</pmbPlace>
   <pmbPlace>90813</pmbPlace>
   <pmbPlace>112</pmbPlace>
   <pmbPlace>91568</pmbPlace>
   <pmbPlace>103</pmbPlace>
   <pmbPlace>69</pmbPlace>
   <pmbPlace>92179</pmbPlace>
   <pmbPlace>92345</pmbPlace>
   <pmbPlace>90633</pmbPlace>
   <pmbPlace>91518</pmbPlace>
   <pmbPlace>91818</pmbPlace>
   <pmbPlace>92107</pmbPlace>
   <pmbPlace>18143</pmbPlace>
   <pmbPlace>39334</pmbPlace>
   <pmbPlace>91028</pmbPlace>
   <pmbPlace>91462</pmbPlace>
   <pmbPlace>91151</pmbPlace>
   <pmbPlace>91470</pmbPlace>
   <pmbPlace>92225</pmbPlace>
   <pmbPlace>4043</pmbPlace>
   <pmbPlace>92533</pmbPlace>
   <pmbPlace>289</pmbPlace>
   <pmbPlace>91955</pmbPlace>
   <pmbPlace/>
   <pmbPlace>92441</pmbPlace>
   <pmbPlace>62</pmbPlace>
   <pmbPlace>991</pmbPlace>
   <pmbPlace>90753</pmbPlace>
   <pmbPlace>90609</pmbPlace>
   <pmbPlace>942</pmbPlace>
   <pmbPlace>24136</pmbPlace>
   <pmbPlace>17429</pmbPlace>
   <pmbPlace>92449</pmbPlace>
   <pmbPlace>473</pmbPlace>
   <pmbPlace>90821</pmbPlace>
   <pmbPlace>92059</pmbPlace>
   <pmbPlace>38129</pmbPlace>
   <pmbPlace>90225</pmbPlace>
   <pmbPlace>596</pmbPlace>
   <pmbPlace>91705</pmbPlace>
   <pmbPlace>91582</pmbPlace>
   <pmbPlace>90625</pmbPlace>
   <pmbPlace>91139</pmbPlace>
   <pmbPlace>22564</pmbPlace>
   <pmbPlace>51263</pmbPlace>
   <pmbPlace>91016</pmbPlace>
   <pmbPlace>91369</pmbPlace>
   <pmbPlace>92467</pmbPlace>
   <pmbPlace>169</pmbPlace>
   <pmbPlace>90546</pmbPlace>
   <pmbPlace>685</pmbPlace>
   <pmbPlace>92390</pmbPlace>
   <pmbPlace>129</pmbPlace>
   <pmbPlace>92296</pmbPlace>
   <pmbPlace>91893</pmbPlace>
   <pmbPlace>92267</pmbPlace>
   <pmbPlace>334</pmbPlace>
   <pmbPlace>92394</pmbPlace>
   <pmbPlace>91443</pmbPlace>
   <pmbPlace>383</pmbPlace>
   <pmbPlace>90969</pmbPlace>
   <pmbPlace>91367</pmbPlace>
   <pmbPlace>57700</pmbPlace>
   <pmbPlace>92316</pmbPlace>
   <pmbPlace>59364</pmbPlace>
   <pmbPlace>92557</pmbPlace>
   <pmbPlace>91711</pmbPlace>
   <pmbPlace>92572</pmbPlace>
   <pmbPlace>90827</pmbPlace>
   <pmbPlace>90508</pmbPlace>
   <pmbPlace>92232</pmbPlace>
   <pmbPlace>90659</pmbPlace>
   <pmbPlace>864</pmbPlace>
   <pmbPlace>92460</pmbPlace>
   <pmbPlace>575</pmbPlace>
   <pmbPlace>90881</pmbPlace>
   <pmbPlace>92273</pmbPlace>
   <pmbPlace>91451</pmbPlace>
   <pmbPlace>23511</pmbPlace>
   <pmbPlace>55901</pmbPlace>
   <pmbPlace>91099</pmbPlace>
   <pmbPlace>90979</pmbPlace>
   <pmbPlace>91091</pmbPlace>
   <pmbPlace>91482</pmbPlace>
   <pmbPlace>7390</pmbPlace>
   <pmbPlace>91538</pmbPlace>
   <pmbPlace>90995</pmbPlace>
   <pmbPlace>91316</pmbPlace>
   <pmbPlace>19892</pmbPlace>
   <pmbPlace>34354</pmbPlace>
   <pmbPlace>173</pmbPlace>
   <pmbPlace>92095</pmbPlace>
   <pmbPlace>91641</pmbPlace>
   <pmbPlace>92168</pmbPlace>
   <pmbPlace>8055</pmbPlace>
   <pmbPlace>12220</pmbPlace>
   <pmbPlace>91808</pmbPlace>
   <pmbPlace>90364</pmbPlace>
   <pmbPlace>90460</pmbPlace>
   <pmbPlace>5260</pmbPlace>
   <pmbPlace>91141</pmbPlace>
   <pmbPlace>91774</pmbPlace>
   <pmbPlace>90623</pmbPlace>
   <pmbPlace>90607</pmbPlace>
   <pmbPlace>92015</pmbPlace>
   <pmbPlace>92579</pmbPlace>
   <pmbPlace>10125</pmbPlace>
   <pmbPlace>872</pmbPlace>
   <pmbPlace>1145</pmbPlace>
   <pmbPlace>91211</pmbPlace>
   <pmbPlace>90565</pmbPlace>
   <pmbPlace>52958</pmbPlace>
   <pmbPlace>90705</pmbPlace>
   <pmbPlace>54</pmbPlace>
   <pmbPlace>91975</pmbPlace>
   <pmbPlace>974</pmbPlace>
   <pmbPlace>92484</pmbPlace>
   <pmbPlace>243</pmbPlace>
   <pmbPlace>66</pmbPlace>
   <pmbPlace>92547</pmbPlace>
   <pmbPlace>23775</pmbPlace>
   <pmbPlace>90558</pmbPlace>
   <pmbPlace>91217</pmbPlace>
   <pmbPlace>92589</pmbPlace>
   <pmbPlace>91592</pmbPlace>
   <pmbPlace>8880</pmbPlace>
   <pmbPlace>91887</pmbPlace>
   <pmbPlace>92518</pmbPlace>
   <pmbPlace>92516</pmbPlace>
   <pmbPlace>34305</pmbPlace>
   <pmbPlace>90538</pmbPlace>
   <pmbPlace>92471</pmbPlace>
   <pmbPlace>11543</pmbPlace>
   <pmbPlace>92351</pmbPlace>
   <pmbPlace>90801</pmbPlace>
   <pmbPlace>92364</pmbPlace>
   <pmbPlace>2520</pmbPlace>
   <pmbPlace>662</pmbPlace>
   <pmbPlace>92206</pmbPlace>
   <pmbPlace>859</pmbPlace>
   <pmbPlace>2448</pmbPlace>
   <pmbPlace>1059</pmbPlace>
   <pmbPlace>90675</pmbPlace>
   <pmbPlace>91753</pmbPlace>
   <pmbPlace>91824</pmbPlace>
   <pmbPlace>92754</pmbPlace>
   <pmbPlace>92186</pmbPlace>
   <pmbPlace>90496</pmbPlace>
   <pmbPlace>91373</pmbPlace>
   <pmbPlace>90434</pmbPlace>
   <pmbPlace>1046</pmbPlace>
   <pmbPlace>9443</pmbPlace>
   <pmbPlace>90933</pmbPlace>
   <pmbPlace>8176</pmbPlace>
   <pmbPlace>13786</pmbPlace>
   <pmbPlace>92257</pmbPlace>
   <pmbPlace>91655</pmbPlace>
   <pmbPlace>92097</pmbPlace>
   <pmbPlace>92374</pmbPlace>
   <pmbPlace>92458</pmbPlace>
   <pmbPlace>92490</pmbPlace>
   <pmbPlace>92539</pmbPlace>
   <pmbPlace>92603</pmbPlace>
   <pmbPlace>92566</pmbPlace>
   <pmbPlace>92302</pmbPlace>
   <pmbPlace>92362</pmbPlace>
   <pmbPlace>92506</pmbPlace>
   <pmbPlace>92236</pmbPlace>
   <pmbPlace>92152</pmbPlace>
   <pmbPlace>90655</pmbPlace>
   <pmbPlace>56</pmbPlace>
   <pmbPlace>92414</pmbPlace>
   <pmbPlace>44531</pmbPlace>
   <pmbPlace>92402</pmbPlace>
   <pmbPlace>92269</pmbPlace>
   <pmbPlace>92161</pmbPlace>
   <pmbPlace>92146</pmbPlace>
   <pmbPlace>92358</pmbPlace>
   <pmbPlace>91669</pmbPlace>
   <pmbPlace>92138</pmbPlace>
   <pmbPlace>92375</pmbPlace>
   <pmbPlace>91838</pmbPlace>
   <pmbPlace>90667</pmbPlace>
   <pmbPlace>91464</pmbPlace>
   <pmbPlace>92288</pmbPlace>
   <pmbPlace>92574</pmbPlace>
   <pmbPlace>38726</pmbPlace>
   <pmbPlace>92431</pmbPlace>
   <pmbPlace>88391</pmbPlace>
   <pmbPlace>92285</pmbPlace>
</root>
   </xsl:variable>
   
   <xsl:template match="root">
       <xsl:element name="root">
       <xsl:variable name="root" select="." as="node()"/>
       <xsl:for-each select="$orte/descendant::pmbPlace">
           <xsl:element name="ort" namespace="">
               <xsl:variable name="currentOrt" select="."/>
               <xsl:attribute name="xml:id">
                   <xsl:value-of select="."/>
               </xsl:attribute>
               <xsl:copy-of select="$root/descendant::tag[$currentOrt =@pmb-place]"/>
           </xsl:element>
           
           
       </xsl:for-each>
       
       
       </xsl:element>
       
   </xsl:template>
   
   
   
   
   
 <!-- <xsl:template match="root">
      <xsl:element name="root" namespace="">
          <xsl:for-each select="distinct-values(tag/@pmb-place)">
              <xsl:element name="pmbPlace">
                  <xsl:value-of select="."/>
              </xsl:element>
          </xsl:for-each>
      </xsl:element>
  </xsl:template>-->
  
      
      
      
    
    
  
</xsl:stylesheet>
