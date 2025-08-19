Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548E341AA9
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629871; cv=none; b=TEscg33ewOZwWa8ZtGbv958OjIxI4eqMMFdLq+J5wAST5l3oKKNLuBGUi8tEPJszWPKFuqzfTjwGO9FyxhLUy3RPkUguMR/KI6EovL5KzwZZ3LADniloGrVlId2vZIrAwQFtcnpRkzEwxwZJFyBbXD15B+XpHY080+0CfemTWjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629871; c=relaxed/simple;
	bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASKgLmi5fEyeL6AoeDWnSRNUi3h6tAmkgH5ZNwwVd/m4/4iLTt5kcJf/z/69Qalu80Y1bgMcWr/V/ArsUmRd6iBCE7tNEFLUcLknbAtwttJdLITbzrRcVwrHKsh4MJ0zvsgZCa7i4Uk4JljRwFHF9itfmbJYaN/wv9ft8ai6Hx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIb0QRa8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIb0QRa8"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHTe1O021776
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=; b=QIb0QRa8heAIzrGP
	AXBqzKI4ZHoUfSR1eAb8IDNQwoM6dTZ8QzzO33m+pcHsZPU2mh4+8JDIOEKKfLD/
	RCin2Ol4oAV9CCWBL+mMoXJT3flTPK1uxYersHokYLdxrdouCcea743RP+Vrb7FG
	YkyrVHNrMgGE+BIrkqr485rdSu+CdoUFsZjZMRlWCYye4rHVYwG7pPAczwy4ODNN
	6ArnXqWbguFKRFZRoqcRqLjXkXIRooAx4kVaRlLV55sokedXGdRxH/arCJHkAtw+
	148WK3+3kWYxrgsAGsG5oh+sre0XUowP5XizgM1Stmk63+Ft68IehdKO59/HqOWJ
	9vmx0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cme3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e8706a2bbfso659533785a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629867; x=1756234667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTXVZvn8yUTRjhlUwhGxkNee4aGkCZL4GH6QswhQXtc=;
        b=UjbxafOUtBK6BNkrEwwZLKgfXfCLZD4FIa0GZvlCosptHagHqQ25LDYlQXrgPaX+hG
         zZLs2QefAvBpVx6olaq9YBKI7FHfUWjW2yZ7pD+bkXoKgBZat7aQVyzTywlLlKkY9onV
         BjSOcyUoF7i4PXI/fr6gK5YoHPJv2Lum0MxIe2mEwJwM5xvVuCZXaM+maGsjZIjxMPSt
         aRfmwZHMQOFFWSfeNHyL17Thfl6fuTcqxpaWst0V7ulGrW7ZowmYoodTEsTcdFVPHm79
         G9f2c/XU/9uB9WddWIYAe1YYJMZcM6MFNxHWDvtkWArBIGB3iD3dIaLXS+aXeTQRpslH
         /ZbA==
X-Forwarded-Encrypted: i=1; AJvYcCVSzAvfe7NBBL4unRWWyfXK3ZekSi/h/kCMJ6IFOhwYWzBCpKRQ1rgjK9XOoCBLPC51742frIzL5F7z0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyh0R1HKE//g5bGPnJJA/Zhc0bBLVgnmxf21GNjjrUPeVj1+cRt
	W3P9bh0es7UmxOYs2QUrja5s3XazGkCvqLdc802UW0FMn1mYfdL8B4vk5/H5mJpga/F70+/I/gv
	iTnVs5g4EpAUmceRY7+Sb7dm69BVXPCuwHBVcurRoD9Rgahr0h+BD1QKMCWwd6kYzbw==
X-Gm-Gg: ASbGncvajgUb7+ckXw+PxvC69TWGNa7fwk1BV6UU0mmvMSj/FW4u0raonrPZo3L1v1k
	ftusQmpbukNLIbGJE1U8T7ZmSSdvNEw1O9YkivyMgUgmg8OiRTabw1+jkkhBbKZiNGOrSsGgUPB
	YvSCRTpuAIw68yz5OWsjBptcXp7qgq/Rx/gzek2LUK7230bA+cQ0aIPMVcHbQJlGV9+Xyl/zEzC
	ELQ7qSriW4Y7B+P+Lr+Ji/CeYg2RT/7CWLqA343gXSHmScRjOwDariboMjdhL6BJVJ17wxFVFB/
	mltzxyFk1q7eRTFmU6mqGxnGy+LxefZZaOxeLC94SK4t8AHJx4HXa+PwTM8JMWLMuvhKVso01q0
	dOzwNY6/rz2vIvxymn8rWCk0liFIEflvSi3POzlMqKUyTP/AVZavR
X-Received: by 2002:ad4:5ca7:0:b0:709:e54b:262a with SMTP id 6a1803df08f44-70d770ebb1dmr764696d6.44.1755629867283;
        Tue, 19 Aug 2025 11:57:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHHRhBEXHu7meuKjfvfUMQyn/xX4sNy+2tihw2l9EfepkouN6qL54x+P99KY0cIm6m4WW1Tg==
X-Received: by 2002:ad4:5ca7:0:b0:709:e54b:262a with SMTP id 6a1803df08f44-70d770ebb1dmr764446d6.44.1755629866811;
        Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:35 +0300
Subject: [PATCH v2 6/8] drm/msm: hdmi: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-6-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7pF6L0JAujP/P/iu+e8rZjaaHJekyZiCiogkcTbsoPg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkcjJzhrdtpr84jU23CUsYEilRvFhX2YX678
 OfZlm01HoqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1UoSB/4jVjE0YR5wd+GnJ4DK5xi52Yuek7jhDdfrlSH0K80rX/NeKDdZbhLPORAVZ6CFMmsGvPw
 evXQXVUKHZF4ZuiuYTU4gmioVd6RB9vt5FPallgHoGlUW3qgaftCPXNKrZeH5Wovx396cpCFImt
 QfDLUlANeAi0ageLVmUbhJXpqnX242+4QNBYG9U5T8LvWXMljEEaSxbIashznRokT1+T4g6+sIt
 srqvF+4q1MJNHBUQkQYGmlT2/jCX6lrir1n57VxR5ZNFnhR9QrSUMvq7EgZKAfcL9yo11tVpDxN
 OUkM0U9K++rQnD+B1bCpD/MrmOIzhCArcz2/bcZQCfzch/Wd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Xb_sOS0nmHIYYfRKwlVNR189ggOT8Etq
X-Proofpoint-GUID: Xb_sOS0nmHIYYfRKwlVNR189ggOT8Etq
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a4c92c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gXnERKRtccFGBIMzwWQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfXw7x2dQ3W0db+
 kZhm7IfPMbYbHphHdQIM3P983YrQSsDqRoQ6wpol9MIDdYe0BwV56514tHWtc8+/woKSN/I7MLF
 PrEqkpz8R6OE0BAZrBjn77GkfhN/2O+ewmCCtA1qeasDY7jx1SFYAwj3PPjwLAxgNMD/01IDMTN
 VsHz9YkqLDr5oaPrUMc4B17jP4jMuNlUuM+uXT1GMI5/qKOhWrm/7/Rmg7OTJpMDO5X9Z1W7fz2
 QBoavUrl9MSr1lWolv42TScL0ldB84o0ILVtBLtPwvOXVMk57+a1M0OHTOERwkEc8eeo/+7zDdb
 6cF8yYSQsDYC77zqge6/TFYZUKBS0M1v6QK9KDNsp16Xo5V0PSv5Pyx3n4C+bALDYFGOlyLB1Kr
 JKUHl7SG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..aa36d203f38f0f5a197afa8493fafb20cdc43476 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -498,6 +498,10 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes = DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.2

