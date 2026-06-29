Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F563D669C
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732559; cv=none; b=fh2g5EzESVPyLtvhHuC9Ul3Y1FwRR/9SVw/xQEq2Pt3S2wlsciYjJAM1cncCncRqxbWLNPLDJM9TTor1SyBBgkXdjC3Lyw9Kqp4Aqdq6AOK+NQTtEW4+devNA6UmugyZRnCIjhPsQXbEERRNG9unw/RSVxdTRvnnhOgJQS86okg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732559; c=relaxed/simple;
	bh=OFyFIYba4yDJjHIOFWWcs6aVl9zR1OAh6XyBHH3ICVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kh91WDP6UwI+sEyOP1Jm0eLSVx/zlxxpG3QhaoVRGzVfAvX/EEQ7yZAMbGOK99eftVJ5lNtjeTPnskyGpoIvVAYnfT0BcKEcHTTDKGuv+zhzaj5VNeEiES/2KeD3LGedxXn46fhMR6KzAibxMRXmeSvfObLgXqIHQZpkwBqo1DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mDoLn51y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TFBN0ZZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mDoLn51y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TFBN0ZZW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATeQ22648345
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 11:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=; b=mDoLn51y1+n9c+LX
	/uFOfzjryd4fR2ExPRPOfIXZtNSwDJNcyTOtjbzWDTOZBWMyugD7sJkoSPvrB5wO
	8kXIBQcn49GjQUL+q/jVdB1CkwqtGpIkW2ioZH71DFlDTpdZKhNCYR1kCIGtyzwE
	pMSK85M4O/Mw2GX3aVt5CKlkTbELhbsWp2ImFRXJhp2LSD9byS7BWFnATmxMfTGa
	RwrbnX/+nM70popR69Ac+CjBKdodkaOi51fWAtTFemCDx/MMiUJNTdnveuoDzzfY
	orBZ8QQ2KEsVOfVmmZzIeSKiXpQJnzmPWJPiwlSy0q1LeslTDLK1pNNaBCHdMp6N
	Fise9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjh1gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 11:29:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5e38fbc5so36939485a.2
        for <linux-sunxi@lists.linux.dev>; Mon, 29 Jun 2026 04:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782732556; x=1783337356; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=;
        b=TFBN0ZZWaNfAD/rayIG3SZW1xReSVGBpjoQVq9cg2vlotcKZMDKABhVdmJKgcjsRMV
         z9Ri1St1ZJvhkGbc0hJ5TmLnUmZeOmG79Us1SkHzwHJXjqkoOlUpVWbn/8a3gw4/hsG2
         yH3zQt2JRKY3P82GRGkarzeRInAB3wrYpNTQgPOw4xawR9fEbo7mJiqU4xclhZmQ81Sv
         KvLSNeYRGPv8VLJKkpJukafARHvMcEDddk3ixZ2gyvdJPfYfYVsXj1dYL6gP5VP/JbSa
         PoWXvZ5OZV/WSY1C5EYMiJmWTiNgjUJhST39hEdjWojOu32QJa0cxjkwynov+7LMH0l5
         xPfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732556; x=1783337356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NEs7bGF3MT53DTpn4rxxmvvki1v1O+0myshhgrdym4U=;
        b=XspUkZ0ZwZg9f9HGq6I1ff7HAK05z7w6g7NCKAvofzrlQrkZQj9E4YEyD3Avnv3A8E
         UGNe9scxMPNkn2NlfEGrR4dU1Tk5wzhaFcRRv0787K7laZl+LiD5vqXPdb5rWnT17ahD
         pAS9MCXWFyjY7/HjX6Lg/Hd9m2+X2lelj4akRdxkezLaEfVKpJBNQ/vyS58eDwm0W3pW
         R32VGzRNFZC2Vl6Py1HB5jMWHcddD/GBwoSvkaA+ksRAk1gJNfxwbWhWv7fbj7W/7iap
         xYfVMxSitEAjtz01B8By0Z+0XH1W3rTyWPFZnEQlDLVgdSVSLSknhzcIOnpRijhtAdiG
         FjTg==
X-Forwarded-Encrypted: i=1; AFNElJ85VEDAmWBXI5zVFvNttjK7MkWDxKRegXzvCiYDJYMOFZhRvXyFuvxO7DEIY7UeuawBtiNWThLz80SiOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwY7vhLC0Zp57Qdad3n+JpZYt7Ml3gswjRxP+RCRyJ7H3IYrWGH
	10bwf3jtumM+Mk88Id3MTtBFDigVqXTUnScGQo81Cs3LEX6cx24gksP5Soky1tei15rsZ+oBaZF
	B6wh/fXbYzfaTda+VdcPfvVeecfLip6OzCIVDWH0KhwfPRRL3IgNmgQXWRGUUdNqdBg==
X-Gm-Gg: AfdE7clZxd/LoRjRLBzsZlLEUh1hOM1HuCK1YT3NMEN8UV10jLPyqkIvbMsw1XY18ut
	kA7CRdJCWSJVBbHYn4tF5m8tiFgODTcv1yNwjCzVH6NrF3ziGafYUyjb6A61lENZLRpS3ehPNRQ
	9YWE8+0ot27HWBSPkYBPOMU065dre9rK6yEYHRHP/P0jiaacMk9oqpCNMVQ5UamgxrDB6PbLrFQ
	/iGSI6hBaryCPW8KZSfWwMzknLhSDqSRxP2fxHaqV1V/EfoF8pFqMW+Pn7+DTBwOAWoUunpyxhG
	Txun51KamZC0R1dmEHVmg9Qz2dvgVuFwbU3PYcPilYOLY9nBcn6BkslEIUWVHEgY3sjS44RVaqC
	zN69DLKlIXdgYI2tOojKjOSmYtQcRLsWXBwOSyrQU
X-Received: by 2002:a05:620a:8811:b0:92e:4613:5b0b with SMTP id af79cd13be357-92e5f3e9a4fmr49742285a.68.1782732556126;
        Mon, 29 Jun 2026 04:29:16 -0700 (PDT)
X-Received: by 2002:a05:620a:8811:b0:92e:4613:5b0b with SMTP id af79cd13be357-92e5f3e9a4fmr49734185a.68.1782732555518;
        Mon, 29 Jun 2026 04:29:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46d86960983sm41936351f8f.4.2026.06.29.04.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:29:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:28:47 +0200
Subject: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes PHY
 on sa8255p
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
In-Reply-To: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OFyFIYba4yDJjHIOFWWcs6aVl9zR1OAh6XyBHH3ICVs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQlb9/FP9ORrwIL+ZXHhc4b/L5Vtd7JbT7/lyW
 6CTLAJxkTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJW/QAKCRAFnS7L/zaE
 w9DkD/9MZJRrtOsV5vLrh1qrBZUZqJ2J9P8RRMHcXW1H6bhugDvmWsApILNySh2JSvj/F75OBxe
 G/pjESTF0lriIWKZ0+AMeTHCvhTp+m41R1GmLxCqFVKAicTOXqKmgAiffSSBkBqVaNeeWlZ83sL
 6GLB1/MvboM7lOBK7c0kM+Q7W6L8mYDjhKMDrJEu7SJ1Gm/CeG71rEWMC0nrlutq+IMg3Fsl+KG
 8oQVK/BqD00erY7V6zhduQycUgvTDvlMrA0LVCGZNDD58EYhNTWUaP82QxlIZImo2D/QXFZFCWW
 NHk7KncIU8gjJxo2AlVAsVSl15s0QPL6iEtQ2YDugZyToITAyww/uLfUjzoOJg7EP2xGDBFXiER
 m6HrIZtcTkiRst6J6Ye1inXnGCTLjybVyT9FiqyYAwhW6xCKZHJz+X0xI7shjpvTJoAohGVbt2m
 X7d4hOW9l6tZi9IOCcLymOb51eOmK1TsCByx/q4A/HjihTwQmy5VsGv+TDW+zC23d9w5iqz4CuE
 MpNFlr7NUEUqgqmDh0hR/C8xQldgjn2QV+bMmIoIGn9M+Sb5UU88qOIgcXi4/Q4J7jR4tDnlzED
 7Mp0XiPmZaXaouKbY2axFMyY3y6MveKZQ0lVz3KLZgmiVOQKTmYQEgOXDbZt1cXRgf5FBbKnTMI
 DRZ6xiS1vJOJEXw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 34wuf9v4zeH39f2Q1XRJH0udl7Z5RQbA
X-Proofpoint-ORIG-GUID: 34wuf9v4zeH39f2Q1XRJH0udl7Z5RQbA
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a42570c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wENndLYK2PIMvs9AUu4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX8YpZQBDlbvdi
 o0/IwhRQvH0jiX3dcETvNwZUsp+S8PMp35RkoruPlgrrml/KNTjgCuzemwtd/AhAHJtgkvq64+6
 8+samTkUMJiuIS/5wumWoFWWqxg5FAA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5NCBTYWx0ZWRfX3sVvkpuS0W5O
 zLdnXaBNO2eDoALwY2x6K8PUlp5nF2t6PLa1TZyt1DaD8Y86gg1HFNhGJBwqoCUxKcaakmRdZX7
 Di5UWlIpjJjsAytOkja6WvvijlPlT++Qkqx4bvCBUQ51310hJhoMM/oNkm0Q2Ds1ipCVdRO+xn5
 nodzmJefZvhEHOEdgUiS6Idm/5eViEqhwJaGk7JlyyHcUejXUu6HSMipQ/lhfYgUngsbtvYdLFb
 ACqh+gX7qDMDvVUKbk6vxb9WYNsfDydgj4vQ6sndA5JBJzXV7gS8VI/5hkox1XIm5AP5gTKr4RH
 cRkyEb/noK3yYCRHq1JsoMVVHniwbjtMZ1NC6zvErW1Ox2P2vSHC61hpDNv91ePfVDUH+HjqF7O
 mEVOY6sIi1ImYgYskr06L/ZLLkpDH/HXPbUpk1EKVTLxWHqr9Hhi2D2QOuAedjolkjGHnfaYdrB
 am5Z3bpCmf2W0Th1RCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290094

Describe the SGMII/SerDes PHY present on the Qualcomm sa8255p platforms.
This is essentially the same hardware as sa8775p rev3 but the PHY is
managed by firmware over SCMI.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4cea6926d1c28872ea7b7aad53088dbbcb74fa99
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sa8255p-dwmac-sgmii-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SerDes/SGMII ethernet PHY controller (firmware managed)
+
+maintainers:
+  - Bartosz Golaszewski <brgl@kernel.org>
+
+description:
+  The SerDes PHY sits between the MAC and the external PHY and provides
+  separate Rx Tx lines.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwmac-sgmii-phy
+
+  reg:
+    items:
+      - description: serdes
+
+  power-domains:
+    maxItems: 1
+
+  power-domain-names:
+    items:
+      - const: serdes
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - power-domains
+  - power-domain-names
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@8901000 {
+        compatible = "qcom,sa8255p-dwmac-sgmii-phy";
+        reg = <0x08901000 0xe10>;
+        #phy-cells = <0>;
+        power-domains = <&scmi7_dvfs 0>;
+        power-domain-names = "serdes";
+    };

-- 
2.47.3

