Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A63735334B
	for <linux-sunxi@lists.linux.dev>; Tue,  9 Sep 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429551; cv=none; b=AZJ3nqBTp5WyzM3EvIyVWJDHgG+Rfq2fZDbj8iSJlQqzDZ47vNYiHvIlhsHhPL7OeXULAx8a67mgYLPEkxJ9smaYaQ7ediKnAj7l7DO+ejKfpQrNpYIPZCMOBYlPecZvM8eGLD59NmQm4gnZ0H+yCaYSZlNKGHgGcOyYLKtX3SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429551; c=relaxed/simple;
	bh=IJZghCboJx+n0r036AP0jF7y3adcwBpcry6IF9spRKw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qe6+UmLhMSO/4d79BIDvraC6baN7pIdFgCbU86FeXEEIdLxYBUhgN8JKPZUmGAeSDjG/6cdigu8RQtUQKzNABHa+vKgbRvm9wUie5uOowHPEBL8KMq1BRK6fCajdzgv5vsgWvYatXFdGEkIb0ks2ngtLVF9fvo9JSIwl/XNXRrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7JfrdUk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7JfrdUk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M2h6002298
	for <linux-sunxi@lists.linux.dev>; Tue, 9 Sep 2025 14:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=; b=g7JfrdUkeQXpz3WB
	OyCGDQ9wCTBCRS5rGQFEfBzOPiI+/p79Q2bFuHoCn5lQFzB6i4qKOOgDo8O0HqF9
	XoQd/I3lBgRDrZgY5Z7WHV3lxMUZfEJA8rZlr4/DpAjL6Ab205xe7xOQdPI4MQpc
	6VkHDPT8TPU+VHe5J90awHK/zwUMKMuubVcjQtxieSdinEL10JSq0V6kVJmbySt+
	7vtXwdUZtUnI6iQN1BTe7sNWRYGKCTI6n2NKdv8e632lyzitClUIou7e29TEgQEH
	QjcG6raauWUzdsWDvMb1oj+sUUWu2ow2pbXrQXCW4x56/6OhLCoiZW/D5NTVoMuu
	F+GMHg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0e02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 14:52:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7296c012f6bso116933666d6.3
        for <linux-sunxi@lists.linux.dev>; Tue, 09 Sep 2025 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429548; x=1758034348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rn4+Wi525+F0z3MVcWKrKeV/0wAxSecqgj2MgM3DOG8=;
        b=Ml2rEDIZvyKFhjmeYslXWsRDreuMg83ZsN8fW3RN5cuIzPm7KFnt1pqYuLrfVLrFGe
         FOe6Jin1UXie8VTebuMMPZZW/OEcmWSnR1wMw9g6OxgZuVYVcwz15rt76jPipS06N3ta
         I//wYN+x5evhrOLHLC8IpfjZvJcfwDt1ystu1AGsL1SMuwyx8blG/4MST+5VVHz8vkEk
         PrBYoSQEErUc9xlaPLjqBntY0IVH3mHeq4K6CQtfc6ueYtICsDIwwPkUuw/ijQSmFont
         uaXfqAW5FHXuIR4PkMoe8RGPiP/u/navKXqVm52hGLCnNqgtHg2Gcz8F2+alQn/Rs8r2
         ICFw==
X-Forwarded-Encrypted: i=1; AJvYcCUNCAI0z26Qf4y2A91cWTDv+jZe/q3AXboQMz3tbxSy8XLMycGW6C0L1e/mbxXxzYdegDICzPZEvsnpWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqNEF4d5wInss+4DVVeWwo934r1ohOh3qIG+eHXckhp5cJA+zX
	kVqoBjKm8Q7w5AcxfKTZyuavFmpPpPVjvB8/gEaUNw6X8kKd/yNKWXLdIXFPK9cXeNgO8QxG5h9
	lwYfhrbCx/Vmbu+FIWBk4DRj60MtF5bl/Rn5dPH03QkYBkEMHcbTOV50xq4MwCUrFhw==
X-Gm-Gg: ASbGncvi4sZoNtWagBnnRFGSt7ceSdViNAFuw8+de5DYaaNIf38ZwE0oZ6kD6Ww6KFG
	CDvmojodp0Cxeh+607bW5STJltTeaUg88n4m3Cqx3ChAXBVyVn7s9MiriHORoEHUgkcDb/mIk4M
	3TLCEy6UXDNIu3OO0x3vyAHlMGRT9je4MVrg17ukAr6ckkoX3HdrfHECFZmKtEeMQf/ziwrseSK
	POneDu91xWmIJgeraTtC2mGgct9LyJKhrDAu3uPGbjqb7H/yqLzd0iuHLjok9muzBp84IEhYCH/
	akEqnxSRVgzZLHNsTz+eIxr5EZEUhi+LNUiC/illvD6oIbIF10uHFkeXHjh/sHvlcQwKIVvOXI/
	8i3oCL9XXdfCXJIzsydRUthg1i8MJddCqvr1SN9kO0amfuZNjvciE
X-Received: by 2002:a05:6214:20aa:b0:732:10ae:d55d with SMTP id 6a1803df08f44-73919c9e239mr146164446d6.4.1757429548181;
        Tue, 09 Sep 2025 07:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkZ1SyNAZOKwaZjgWGgZYNxsRKTBuelhQ+O6Fw6gKcHDoTAWyspctjVqKaotztS7CYCn5cWA==
X-Received: by 2002:a05:6214:20aa:b0:732:10ae:d55d with SMTP id 6a1803df08f44-73919c9e239mr146164046d6.4.1757429547463;
        Tue, 09 Sep 2025 07:52:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:04 +0300
Subject: [PATCH v4 06/10] drm/msm: hdmi: declare supported infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-6-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IJZghCboJx+n0r036AP0jF7y3adcwBpcry6IF9spRKw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8b8ieAgxj637Sq4ws+QM7LjLkOdE7Yn4gby
 LcXsEN9pQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1SNdB/4rCLhDfybuoskGcE1VGyhQHDNRop907iuQ/KfMohI82tNkUxmqn3fcViK1Dvdys80Wyfp
 VAFYFQHBID4DL59qRb5c/LSwkwDodGdGXF6y07zpgxsnTUegD7KDvUX0gzJjwgj9tZzVv/UQOm6
 hFYKV1nXm6oA8QLpbayUSXqTlXnckkVr0Ihc4Za41VQ1aLTz8F/M2jqh+pmgwN9myyOiAZfrt8x
 2+zvee2f6gaeDcRIlcvUKZ1zM/HLgIxJ91eERe2/sZ/wV6xMCw5TMRlCArGjeIHU+4Ha9MmneeG
 bl7XeBkt3LIIaXdjnUXmsUCAPLNsip2K9VKmZWaOQh8k09Hj
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mfT-zqVDKeU48sbqq35NFbzuvNrHdJWZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX9bUdT6qdNqhL
 FAFddIWfwXh+tJMWnfbbqIQjk1/mMFDp1GUow6vAlcWmk/d4Mp4YE/m5K0lLzqzRH5o5M33SB7C
 eeWsr8aYXQWcQ+n7cz1stBkrVy9Ogou+6ws/0/yDzY76MLrYM7RIeCm07NeWhSfZCAbaZ1skwMU
 jyR+e8qiHyppNjxBOb2GM4XuDQ3pyS+OsGabF42nv/0m+1vsUr7hhLzVJFyQVEawz/YrtH8GTYy
 9JDmkgPmbzDaO9VIIdz1Gf0Dm0SFjhRn2c0GbGe+rCLzYnKO8Ge7F0X8g2qhZ8PoZRWuVVD6eol
 hOE0ECStw7Ez8tiDBzgi7h5LDElzsR45dFDQ27qYW6gavjItHqCWdZL9dkDf3WTFVUO0CvOFkk6
 hdMWx4AG
X-Proofpoint-GUID: mfT-zqVDKeU48sbqq35NFbzuvNrHdJWZ
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03f2d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=8AirrxEcAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=HI3Jv4oHZFu9xgwai2MA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface. Return -EOPNOTSUPP if the driver is asked to write or clear
the unsupported InfoFrame.

Reviewed-by: Liu Ying <victor.liu@nxp.com>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 46fd58646d32fd0611192595826a3aa680bd0d02..f6ba8032904187a2f169456052b0e4cbd60ab919 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -249,6 +249,7 @@ static int msm_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
+		return -EOPNOTSUPP;
 	}
 
 	return 0;
@@ -274,7 +275,7 @@ static int msm_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 		return msm_hdmi_config_hdmi_infoframe(hdmi, buffer, len);
 	default:
 		drm_dbg_driver(hdmi_bridge->base.dev, "Unsupported infoframe type %x\n", type);
-		return 0;
+		return -EOPNOTSUPP;
 	}
 }
 
@@ -498,6 +499,11 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 	bridge->vendor = "Qualcomm";
 	bridge->product = "Snapdragon";
+	bridge->supported_infoframes =
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_SPD |
+		DRM_CONNECTOR_INFOFRAME_VENDOR;
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |

-- 
2.47.3

