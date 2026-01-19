Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12330ACE8
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819243; cv=none; b=OVcCdS3ogtJFcw7guaYfcNh6SDM8/2jhn1z/ReVFodQZF9bj0rWqGu/LB+TTIP1DlmTcO9CqwsGwOlg1vxT/kGKPjqLgn2kbFtzIzJ42qovTQY/ksI1vkkkbDaYRGqxHpZH0QinNYsG3s/PODgHeYnfAs8G9aST2j186B/iekho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819243; c=relaxed/simple;
	bh=gSSXjbon2ZASCpjtfLFN1xl2k0rbvEgubK+ypiMfNAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KdfXm5VHq7Vso8Z6645QblkS+qSGrOQDUUcRYthbDDXTCyXRs5+NY4I/YCByFCj6pzOAEFbyCNRAeCFB6/3AWsOgpkPQQOK+A3GlrbU/QlaqRBJafWoBwNb5preYXPHiG8/FiNJBvUucwPRVg84dsc/BGujFc33lQ5/I4RA7Zl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE7LBSpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guNWbuEj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE7LBSpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guNWbuEj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9100x903091
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=; b=iE7LBSpE6amQc8ar
	jiHLqt30gssaEF/bVw8IpwLRRv7qEAR91BTg9brjbk6dHDzjJfRtEF/D0AAiLtC2
	5hX2fPjPf5Q1ytEK5qTvKeVCfoMGt7SaXYBrqMdIH+ooQs1ChLVljYkQqG4VIGRO
	vH44x5S1QxdLtbHZ43SAnljrll0rrH7Y+xJMKpmh0+RHQnGqSL7SEoRsclvzBIxA
	k6jA9eBtwM95qqJoSh5hvRpBABZgqJTp9Fhvs/hRqGm/UB76LL0hBY87EDxe+K0z
	fYOD0onxyiouYRm5/hxXPAvH6zy89u4pse+n8AZo6QYWDdZ2JPm/bMC0N5ojxe03
	wCZcow==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsb4ysgtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 10:40:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so1054122585a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 19 Jan 2026 02:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819240; x=1769424040; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=guNWbuEjtBYho4Zq6qW7XkNohpsLeA5I3hsVYndc2F8nUhy+Lq1oQvylOwptsgCGXm
         N54g7nYH+amR8QXUqe4A/itxYyUcg1hVqxmpnQ6c/EwDem6CXgJftXl5JI9oopyJFr+F
         9Il/I9yqh561DhZS5HdPhSlSOt253Z9fchqkq18YnlStV7c4gvYoysPyyB8H4QoOvD7i
         NXICUYNktOfsm1TRlirUpeMxEyRk8n5d9h1jyrL3lF7x+zv66hvzjDfw/Cycu8Yr5t4j
         XW1NFhHB4Binc4g4oD3b2qXq7Y2NujHlsgsk+UYY3DodGv6+etHnhkCnUmePHkL9CtNu
         Blug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819240; x=1769424040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=QFjsvGpVRZjulzkVeEFCRVy6cyi0n6IPqhH7yNhG2mhQM745UHq6wUY4m6qsvoQYfo
         jSP8AI15hrlzMxNDktsQL48mMyngGxdnakMdC6gRFZ21liQGuQGzI1egyn5eKFsqNmDR
         A6QZZ5hMTMhRnFXfw0CA5Gwqii6QnSGNI7/9k1D3zpY0MFXEKr1Cyo6iRODGon/843hG
         BPJFYQMwld+1/fm57P0gsUT8q9MBayMa5/COSA20Kgv5VOuzGcg2P3/2+OBYTcyIezGv
         U0h5Ba+jdoK2AZg3z2RvfuUfO8tKzxOGZCMcuMJEJz54X2Am6lOkr1+naxrb61as+kp3
         oHjw==
X-Forwarded-Encrypted: i=1; AJvYcCVfG4mVNhUgQs0kzQnpVqVc8+/qiyIPPU3KrrirIlOcoGSEg8dVyUS3Ev6svydJZDM015PphFHkXyFNlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeTHnE2eH9vILKOB8U17++RZX47fTUL7Abxeo9wTST4CRbPKhk
	dnPFt/ZFH0koFkka5IT96pSWu2oTKDwZYzDxrz3Hk+JdfbMr5GPdn6ffv/lyKIDcUmV8fyfC8ds
	EZxNoVPXBZJ1JJa3hOrjOC9B9wvEXBbYFdNiZXid3nH3wB7V/KWTEToQEVEBi5kEjGA==
X-Gm-Gg: AY/fxX6SDSMhXBBe8DmxeGlidfpUSWKwwIqlmmtNECX5K6AxTb4Fpe0bfWGcPPIATFm
	FEM7mQ0CYlvAgdOkOiJzzSRpWOeU1G+JGU3TLPswgI1CzL+TUq52G3u36Lv4tld4dxTrs64pjIp
	yewC5KpVNqc6skzd96KSM5izHSAVXvd4YQdr3JAosVBYuBIuUcZXXwJRDUsWwW1nt6jKJqOY2Ln
	NJpZxE0Nu7d4o8QokW0hOOej/tVG1IHQuEWSLMtYlS3wkCtK9NzB2VX35Ne1g5kPZS5D+lqioVT
	ht/W2qC6CNjq63HrJzEZets1qezZX+SHAHTcIszFIjz0Uy6q9RVdLNIVscTZrkfQxJUSAaWEs8v
	00wZu4oGuPcbTP0jsWEfaMiyj1agI/xcX7DmY2xBu
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325086685a.55.1768819239746;
        Mon, 19 Jan 2026 02:40:39 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325084185a.55.1768819239288;
        Mon, 19 Jan 2026 02:40:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:16 +0100
Subject: [PATCH 5/8] soc: imx8m: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-5-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gSSXjbon2ZASCpjtfLFN1xl2k0rbvEgubK+ypiMfNAM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoZ6/tFfNkSY0GLr/XdLYcw2kMLXLPjKjRzP
 XZ+QTLLN2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGQAKCRAFnS7L/zaE
 w21vEACSpoI0dRf9LOVGg6WzmVElZik9pD0oSo8OINntnyjEajlS4xcMHsKFLGnOaJVjwTvCE0D
 WE7jKkM+kIJE9SAahNxJJW0sfe5PHeeJ8b8Y7t+h2+Ep6U8dWNQygw6zkqGZsZrTurg6e83TK/O
 Qdw/eB0T9g5Y9QHmAN0yY/SUG20XCb6qlZ07150Aj4ZisW/KeQEWVaxzkSoQ9OCferh0bcyLLLo
 SdUsxsAFRynk1/tuxNkSs6xc5Kr6zZCDauKYeqRdXAbZliKDlm3CQEar1q270fYfOnh/UZsz1kX
 K0atU01JTCgQgZpviyvgySSqyp2djHwmiFFlzBtVDoH0H89xw86RO7MfYTcJKdlIFxWpvo7AK8G
 lWrzbrNeZPZLR+Si5albdiXZtop4+OCuEEO/GcIP/8eihf2EUwTwk1/cS664OooHL2VXAbute6N
 nksZwcxs6FlW5e0l1Wy4KlSZMR9qB3QMnxpXrdvIiNOYSo00O9RHaZYDMAYb9I4f9tKZDGSEyBF
 QUeXR+BInkIvNqw5FagKBy4Mc+tktceDeHtC6aHPnjVgmLRzMDpqvaqBdPoUiWHyZWx+HJ+DF5A
 zb5Yx4jFe9IgxU7KA+l+14Ox5Q8OtuPJJCz3n9QBCpLQWHWqW6ZWfSpJbMN5Y6VgIhQC1mEgyzF
 /jfgYN6e4M/P2gA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=SNhPlevH c=1 sm=1 tr=0 ts=696e0a28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q31YqNcWydnNWZc8Rm4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfX4h8WOvgYb8nF
 J1SjQI5k7zs15NIex0JeYoLJS1jlZlQS/PlP30YGEe1+L/LcY9BVwt/h+grOl/Cwka64IJ8nr8r
 tlmB9X86+CkYtQskzI7xnaVFtU2Y2WWtwjBFk7uj3g4lkh39Vg8xT2NyIIOZmqZi9TExWiF9hnQ
 Ls5vO87HIqbP4r0AF62JJje8ik9jkypzfDtUcxyp14ZbMb82PdjPST8JLVlXM53bIMlgujiYeq7
 e4isLW6LnMmlOYolIuO4DoKlYIHoR5LDqXh8ZXjWmJ+moI+ozGHhKBdMeeFBUP5rw6RJJ9gyYtx
 9NY8Mj0Vy+aTXIKglPTHDvSF7iuoRuoQHfJog4zG0G/snu+btsV6hHu/cP9vsW5w9RN0vfeBrFw
 Np2BYzjmvUd5qGZer36YYnxj4aqBb44QZlZDb2JmNlM03WC+DFwZaFcthOucqa/9SV6NrNupWbp
 Yn4UKQZJ2cqPHYV34+g==
X-Proofpoint-ORIG-GUID: XIaGIAh6qsdOCRToyCr3tcyaTzDoZueD
X-Proofpoint-GUID: XIaGIAh6qsdOCRToyCr3tcyaTzDoZueD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190086

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx8m.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 04a1b60f2f2b52cc374714f9a1205496c1762f39..925a9aed756103a5a74d5d840b54a2179cd78061 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -222,7 +222,6 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct imx8_soc_data *data;
 	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
 	u64 soc_uid[2] = {0, 0};
@@ -240,15 +239,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 
 	soc_dev_attr->family = "Freescale i.MX";
 
-	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	ret = soc_device_get_machine(soc_dev_attr);
 	if (ret)
 		return ret;
 
-	id = of_match_node(imx8_soc_match, of_root);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
+	data = device_get_match_data(dev);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
@@ -322,7 +317,7 @@ static int __init imx8_soc_init(void)
 	int ret;
 
 	/* No match means this is non-i.MX8M hardware, do nothing. */
-	if (!of_match_node(imx8_soc_match, of_root))
+	if (!of_machine_device_match(imx8_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx8m_soc_driver);

-- 
2.47.3

