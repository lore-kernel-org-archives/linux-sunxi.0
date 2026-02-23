Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C50D24886A
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853883; cv=none; b=tdTqpEAa1ERdrqMJLGpJM/KWOIMaI7vGtxXq7Q37C3YNi1sBWWPLUafjO0SkdjL8arDbrDSdtB04QoL0uuyCrx0XVyZ1nNasqV4iZFwGdDy956TH9fmBP/JDbWMeL8HJjG0sPSPypTnLvSTkGgpewfsNb5TMuXumuRqzKybEHG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853883; c=relaxed/simple;
	bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdOuIacfLvD6T9IcD72jMqYLt4z/XT1pE+NJ+Cy/Qu9BcqyqroZjvgYp97S3Fc6JN59WjO+1MNBE17cDSQsGq6cFtcKz0QkqYaeC2fjF12+GCnT/VE7Z9fFx7G36StznxTfvALlf5cnQcgf3QTULUOesdqBtbmCVj02TJhhDfa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKPEA8Fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/fEyxRq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKPEA8Fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/fEyxRq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Y21H1444090
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=; b=FKPEA8FgiRKeXm9J
	CxfKM9/iMzcE+Gk5wEvWu5Kn3jdWqUGr4q+mhSly82EPrBiUZLxmUAId5zieD0uS
	b/e3qKrZ7lX7XI5ePLkFOIyloPBK7ln4unmLKt5bHmraRfcAGEvRnLt+iaI/5zYb
	cKk6pcUAvtErYGISlTVYtEiim/TRnJQGZqxYraeoRaYMZU9wvyrgmLjSTfYdkzRx
	/R+xQOGvH+Pn3gsEn8ZkZw9rmVRVENB1Q0u0XrpcSDSyzYmAcD5lhOARsBPaRyOj
	nrJACCpNaM+0mIP4So7pfxAbupEy+KKuG6Yp3xsBfZpKCUV04i2M/vBn6pfbtjP8
	TobfjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb42f56c4aso4555828685a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 05:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853879; x=1772458679; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=R/fEyxRq8RZmtt2aZ9mULE1+Uc1qGQF/tRUK6eftGM62ULHyVtUvcCFgUpu9LiVsLn
         iRh+H9FShfl1HXIXptxDwhTaEoajol+/xwNaqY00Z+IIzLMt5eNYCtwpvPtKK4NKcz8s
         b82BD1ftoPLgnkvvpCxGqTp2kOFTwJqGxzvfzE/qOGza0EQh0t+yMY7+OTKeHhc7Wp/S
         +X/Y10AXfej6Fe4BxispRzRnHELF+l5DJGw0pe3DuZhJ1SQGKDHs7g9nX3d5sUWFV7b4
         UBB2tPyHZn1VSv98t2vVzVQODxwe8avknhOpnIJ7ZjX86K+3wtREUpQzuwCTHkmlWMM/
         QAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853879; x=1772458679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=rts/Ohifg1okDip8HvR+DdnTkuG/V5os9lQvBP1TwfzNadpWVtWFJnljaeD582UeS8
         Qv32OxBS9fZ+bKn37xkRSUeBNXKgvQ8TQbt0jMKwTXIYJKGq84WVVvWWHgNr6lv8MtBk
         /A5MyzxZ/TlSOWInwzToNnNOJ8D8/K3ggErI6iDTj+45H+ngXLaeyuuD0EfIMY7F6F+O
         fKQpf2ZbYZGzsDmHcY0JmwugDezzbFWP3KXJR7kENZANNJkv/T00oIcQUgX5TjrHECnE
         Uh6VvKLwQ9Os+mwEubPXyBfCCFlaoKugbQXKNsVJXLS9iwDnnepiKxShmZkXKWkyJ2nC
         T0qA==
X-Forwarded-Encrypted: i=1; AJvYcCWWJBm0Cu/GmwGXK9IcDEVXs2jcoJe1QBKMV5VDTwc+P9p72pdlapiPB+/VdHE5N5F/pGCfEdJNNtiqPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAW4BR2cJ86QjBVjVIOAcz/E5gKr1B0gvP8is2QXnduZVUYLfY
	3eT/N0Qwl8Okm3VU5MCVIeT5M/XsBksofY1EiQ1toSQ0/Oz89iUh6MamPL7Yyaoy0AjiMkTTLYG
	pJ5nbCjYCAzUPpVcDqza18Law+N10QbRA9b3ZY/qrTcTprOgz+7RV52LMJTIideIhgw==
X-Gm-Gg: AZuq6aL+pXXUE2vl4JrD1clflVojZ4lWdslkVJN0vokDJoT5mesfymKLrdF5zIKhnjK
	P+6qCPVThgW1y3rRIr7U6gPApRcOqvqgEhY2zkEUZ2St3FMwWdNfh08cg8CS/xSxnv8hl9l531O
	wIiP0QinjaYjJ5erx4y8OZiRXoRESuu1K6reh9scV/UazEgWNN3eVWqj8gAeFt6nhuYF7ICkhrU
	Wp4gPyEJyKSG50evxedAXNyRFAGGrn5fVkSVZex4/mKJXhrjoxFKosJ7tAxCx4UxLuMQ0WUjEqF
	l2rcRbcSNcfmgUZV1HIWFxbtSseB8GwHJ6ZhRxStljMu7Ck2M36L5Shwib+V196wxHaEJhH9ZCY
	M7OYqXRwK9AgeED9SRtYYFPX9QGoWwBALMR7SMem6Mmtpggb2lXU=
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976096685a.7.1771853878682;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976091685a.7.1771853878214;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:22 +0100
Subject: [PATCH v2 7/9] soc: imx9: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-7-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFggsAfK2L599u52s0jxxDBJVDwECvhtJQ6BZ
 ShZXXzZl6aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIAAKCRAFnS7L/zaE
 w9TLEACvx7EUOkNExR6rxJvbiPrwBxde+MzYk8WnOY0KUo2qQYe2IV3v4Y2OLkNQxLORHNTmTet
 tL8qdFdcA7/EtkfNAUf86JGuaHxQWgvPaQLo82VmtcJXrb3s4ChhMHQTxwSIzk57nVcuxBwXaoC
 d6cLiDC/nMwvrZAeyb+0Z1LBwzE7OMUXdzVztRyUlBioOA+aG7+h03mNocovFYbn8rvTos+rY0Y
 e7h5NIVlwUODtq0Ev51CGoFbC6CaCwiNXJba+UycfegX2W0Kkhwf0Zyi6DiT6gQq2D9oI1fRdMD
 xIzw0mWS+oLN1VnrqlYu5wL/Ku4iTSggD+ob4YpLXraU5R+wYi1r0Azeg8et0za9it4PFjFPnfh
 Dl7dYRS50ulZCrHTUPGGGGvZLPZT0QgfYfmQTBBovf+cs1qrWcAVJPUnA+5OIsPfTAX4tiEFRts
 P28q4vNQSZ0M8Ztild3VhrhzLubEMw6II5ymoX4cbhfI53GoFeJAcgxeL3sNXMCDZjbybvyP/7+
 P6DMYb8Zm0nYj6H3x+3/s8WEK2ZkHPtYYlR/xxt5DIZKaoXnhqi5T+1/EOjQ5KwLwJVLhLEEqcO
 /410xgEfAAQKBXmwObvlKe9pciFTnNXitRVoM55CA5VOT0ToZ4cE5MSg6+N9VqPGbRfWHk49buK
 slcXvQ/kjdLSnvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX414mwkDS3lQ/
 H1I0w1aKcZjuIZ1YvE3HA6Vkj+mfgad+oqPED25yi5wqJM7iaH8dueIZ+amszlT2Sy0s+9Ejfbj
 4wpUTvvMl+hFvIkbdNUYgYrIFgNAMnQtY1jM9Fsl+QaDZplZ7HKePsNOTZ1R8mgc+FB2bb96TJo
 SK/TRZTx8mj5thnPGN0S9Ow4E9j5VKVFHQro7BMpqeA8mhSnz09ky1K6xHuHVpSstCSUF+VaC3G
 3OcjcL8G29g4Panf2AG/JqmXKa8id+AINYr2YAf3bahd9tTY+Mwm8REkplJDqyZMGUzBQrZLDYy
 m11qJZoEk2XaMj/mK42cCKw+jmAsPRhRKB1CLyI3tjJyAvBwDVNkhS28KDMEDYzUrqW6EMg8TLz
 dL1ypv03DqDiAMxmsPFARh+5PBBMXdc4Z9l7zmaN615m2/EoaeoeQ7i4pnZHqTj7IvZHP9kJlIw
 d5SA4lbrrITuT/PuYvg==
X-Proofpoint-GUID: ZJeId3CkyBO_ZS1QjrPqEmdarxAfbAR3
X-Proofpoint-ORIG-GUID: ZJeId3CkyBO_ZS1QjrPqEmdarxAfbAR3
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5837 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=PMAhrox8fQbXPR-8CfIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index d67bc7402b10e2966ff77cbf3b15c087540bd377..58eef7d4f9089ae56891507e8dec383e69884ec5 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -30,7 +30,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr)
 		return -ENOMEM;
 
-	err = of_property_read_string(of_root, "model", &attr->machine);
+	err = soc_attr_read_machine(attr);
 	if (err)
 		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
 
@@ -89,7 +89,7 @@ static int __init imx9_soc_init(void)
 	struct platform_device *pdev;
 
 	/* No match means it is not an i.MX 9 series SoC, do nothing. */
-	if (!of_match_node(imx9_soc_match, of_root))
+	if (!of_machine_device_match(imx9_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx9_soc_driver);

-- 
2.47.3

