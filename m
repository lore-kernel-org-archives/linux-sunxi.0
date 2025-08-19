Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0A32C320
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629867; cv=none; b=VoPaI4ZkBT1vhxem+5lgv/kq8RzMdSzUAx4Bw2ACSmbPYINGbI1/BCRSIvKWrqaLTvsVo87HHgsU+sdjpt21EX3j4rJjoasv07nvlLyQrNcfg1ORxO+orrW/W2GzgLvlxneRqsFKNSSZH+EovwrFKT9NhZgpYqvjh9b5lKXc33U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629867; c=relaxed/simple;
	bh=juDAsWub75mHxwaDcxpjH5487zukYFMn1kp/7OjeF0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k7N3EXig0wXZvO46Sxg3RVdMTLfsvYe8eUQZAGsUgWyFOasORck4NVcyPyOTFRLOS0z5blJHnuzja35YDJIsxZMFeoxASNJnAyPczD3MfbHJvAwQvSGSJ0Zy/KThSQ41TzZVH2eA5Dn0mO6My0kBqG593fiDc5mWaorii+luxo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NtMlo2zu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NtMlo2zu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHV039032174
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+zXyN1a2bnqpBRyBAM++GE0cnz1QaFhTiRC3XSmnvs=; b=NtMlo2zuHwaiL9oG
	+6oBzhNADdym+pcp4UfP4pxGo6CXzfL1l55KjQPOH62+3+KvrdLqGWJ0Q9BN9lGP
	0PWBwMECEWUIHBRPyPVzKTHkzpbZuBG4vFnHmvob0QBqfW5l0U+b2VbcPruf2egR
	eMdfBxl1Zodj+wTfwzpDSPzCgWBRYeElbfMqmgYQuzGeiFgIz5f2QFokoago8M8e
	meAkjhtgdfQuo9Uc5D3H99PuDfOmuBpJoB6E42bR0SyDHt+lVWlIQbxy6zAB3TvZ
	Fk8ghk0t8bReHbTflKO02GPrGqigQ/sF1UgvC8AXN4VQwVAvGP2U78G4gBjmgqUe
	nHoTcw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj2uhqa8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:43 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a928dc378so134397906d6.2
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 11:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629863; x=1756234663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+zXyN1a2bnqpBRyBAM++GE0cnz1QaFhTiRC3XSmnvs=;
        b=M3pHEinzggoa0yz7za1pHEYVpH6Vmx5u25tj6i1/gHnWd5FbefRBhd0mrbecFPOUMv
         ZVaSjXKb8vDW+Uh/iJ8JJiZ4eb9vycdBOnkPXFwXSubdjZXwzoSL6XkZPDCgQUl7LWN7
         qMX7id+9PRKy4Vz+bXS+bxJ5vLnzG4IQBPlNYSVBWsh57a0YcyzpKfg3fSsaG9Y75s0W
         5YFB8LabuR8xXbX8OAf3QyUaLK9VcQzS+VqQYABVxUunLSl0Qj/JA9zsrbEr946Aa0Y6
         /LCCzYgr+w+zv5RAxL2mYsOj7l5gI+HzMxY/BFT4hFYzo2iY6uG6liYD7NTCH2SrmhHm
         eufA==
X-Forwarded-Encrypted: i=1; AJvYcCXVz5ZrI4+ZG0F3VeY8l1sD/48bPY3ch7pGO1UjNJ9J+RUltP1BNwIlkGafaHpxQZu4DNUTHUQNT44YZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0bTTkhTKR/9KUHly4/DxDOTDcN5MDkeGEAA5gLK3vP/vyYQCp
	8u+ZdtXhfF3K9+SI0Pd1fBRVXgVXoGFFa0BIWFA60m0BdBh4zm5cIMtKRjcEgi/oKyabTEDynmH
	gtxli/ejPgdg6+m0Qv9V4uAKXybuy07G8UTNpJVUT34G6zuAihRaDNY5q7uTpYmAerw==
X-Gm-Gg: ASbGncssyrtOeDRCuHGcJLlEtkmInrjoX8oLTTLLzeTOuF4aqcJVMhsavqSIYeo1tps
	yh2HtougR0o04sMQrGxGLpn5GWkYG0XBhntx+Y8EwlobK7qpwAChqq4G+NHb1OYAH5j0tQHEMLj
	Kf7jZ4pqsoQnlVA1c/wTQanym0gZnTBgi0F4SFKtcFKWAaWbeDziuSTh8yctzWHa2czHcESISwd
	E5rIK00cmVuyOc+rbkDFm2vN5qDGQsdjeHAWgnDq883YLgswWGljsrvk+KkEQIaJaiM3crZpgYW
	l1A6yR2reCwIdQGx3mOhKNL/+Qxiz6woY8d10V46uX/17fIVXvmw7PofpBiMVeToVFnP36esdXH
	x07PfUkvBV3lw6jxsWjy2cuQjeUbDRpnNg1qCt4oGduOgHPACq2Cp
X-Received: by 2002:a05:6214:1c85:b0:709:22e8:af63 with SMTP id 6a1803df08f44-70d770fea50mr922786d6.43.1755629862597;
        Tue, 19 Aug 2025 11:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKM9kPLVNwAU+bvUfA+7/m/OHAH6NtrmF/qIQAh9YPaU7rN8LrKKEiWT6K2FNQ1P8YaY/sGQ==
X-Received: by 2002:a05:6214:1c85:b0:709:22e8:af63 with SMTP id 6a1803df08f44-70d770fea50mr922136d6.43.1755629861896;
        Tue, 19 Aug 2025 11:57:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:32 +0300
Subject: [PATCH v2 3/8] drm/bridge: ite-it6263: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-3-7595dda24fbd@oss.qualcomm.com>
References: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
In-Reply-To: <20250819-drm-limit-infoframes-v2-0-7595dda24fbd@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=874;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=juDAsWub75mHxwaDcxpjH5487zukYFMn1kp/7OjeF0c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkb8nOT8FASvsz3bMJPIraDMeMAkHyPHsS3Q
 Xv/SOD/116JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJGwAKCRCLPIo+Aiko
 1aLtB/9MqLp+3iH3JT+lENH5R0C1gr4ued94BGnwQe1nEDKXwvO/EuCNITfHqWdOnakv9+TLs5C
 sYMtHIxsmUUWmkXrom0z3ihAtphZhlfkAZYvx06wQnjz0ipG3VEMTs0PgzYqbbg0cmTH4+OGuXD
 FIww+if45ZCZfnDtDfviMT/LPQpva3PA++LXedI3Mn2QncxY1FIrNrMGRrz3C0XkpWjYCpN/cKH
 KKlR0dDwoP9hRAz95mZs8t3XIgpaovsWwYsRm4kyFAAEKEp/8cZgJN8cpwrRu+5P9B/7OtZmN7F
 RQpSbXy8k9NYU0pz0jhxxwgWauZriRfjrQJ+0sQVOX3wOA5I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=MJ9gmNZl c=1 sm=1 tr=0 ts=68a4c927 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=0nAs0j3DZZh6uBALfPUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: N58yo2pRoN7G7X1WavJ9xEPQ49-YRtV-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMSBTYWx0ZWRfX6FpXI+2vMspj
 uz0syKA9ZGG13Pr4WY2V1rgiNC2Zra/5i4JzdplZc4syKrDBTP/KeZUmlX1lmyPYieHcOLW8Mds
 YqL0NIdDQ7CafXiuivBSg09qDL2J10s/hgqmeXyi9LGOFNzhQlMuW3K5ptl0VKlOpdvUXPRwK0V
 kdRU0qKKNF2nnqUrNP+slilH9ynuWclDW1QURhHOM+Ni2lGo2/rmHkIDmlFjJfLuQSnFILDOEF1
 FdiXlf/RSkTnK1xM15snasUnXWtfzvGvuvIcR71qF9V96ZV+WSbvHJowinvosw0/AHe/Xav8C18
 4vxn0z5+KS46tr+yL3ktuZffKpPzJ5OIdUGqiWK5+4LrJ/tGa3bRVLSu8Zay/m7FuIGJlTn0HIA
 ez+a2jm/
X-Proofpoint-GUID: N58yo2pRoN7G7X1WavJ9xEPQ49-YRtV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160031

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/ite-it6263.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
index cf813672b4ffb8ab5c524c6414ee7b414cebc018..b1956891a8388401c13cd2fc5c78f0779063adf4 100644
--- a/drivers/gpu/drm/bridge/ite-it6263.c
+++ b/drivers/gpu/drm/bridge/ite-it6263.c
@@ -875,6 +875,7 @@ static int it6263_probe(struct i2c_client *client)
 	it->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	it->bridge.vendor = "ITE";
 	it->bridge.product = "IT6263";
+	it->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI;
 
 	return devm_drm_bridge_add(dev, &it->bridge);
 }

-- 
2.47.2

