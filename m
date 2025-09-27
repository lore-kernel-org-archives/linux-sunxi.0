Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6901EF38C
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935085; cv=none; b=K5ooNx0jR0pF15DT+SFob/dvmsKJ95aivkIHBVFODXIjwY3DuTpRtJaPcvquCAbs1HM/7rb00gnw/bibtLQbHsfxnOBOHhbgLuGBcSXB3/7XyxfsXGK7pbzbiBNmH4XHNTTOkCe77c/cttBTKONxZK3Y0/7Eh4ZEJuCnyrYNG9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935085; c=relaxed/simple;
	bh=3Kap+upNT87sFn+7RYq1dDaa62IPE0BRWOyWIEU3S6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ULa8wPL0sEUQkXOTrVDoHXMwPnmJVf+eSYkRlHK05vprL2k0w6xEXy/U9ecyiDyYuPe16tSajDJ/FmCJEApSFdMuczZjG+V/1l6Q1GByOJtC+pxlOmXP//G7pq3rYWo8DAxZFauCNf/S5+veCsWWDls4Jc+6xxW9r6ZHWePqWNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h2aCXGC4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h2aCXGC4"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXCdr012904
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tqL9/YMiIEc6tsQIKNZIjqHO6NoBtjrbfKTgbxxDbRo=; b=h2aCXGC4I/FFoMnp
	ArCQmvc7Xjl5wqsta2feYFgGDI2uIcwDXCd7J0Gmp2mkXhwM/90qPS3j99QD3eNn
	gu19rTNNMHJt7ZXdsPYO5qHfKW9KUaIGFwJlwA5VrvS8yr/bBE7QDMEitmdf1eZM
	k3bKPYzDMow0aPKNFhQvqlPgCShKom8IyZufpGAsNxFXU57aJFdCrvzRp7HkAwEB
	zV5AjopJDVGM1aGGaWsKrwJVMHBwNcQfhCBSQwYvpAJQuSQijHZ+ie/QXEHvJNrn
	X62z9DjXvsPxYiRBif5ns/q3sqsTLemg4FKeDe0ZM9s4ST3bZz8LvreCGTylgB8V
	MqJ+rA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q4gpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d77ae03937so75851501cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Sep 2025 18:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935082; x=1759539882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tqL9/YMiIEc6tsQIKNZIjqHO6NoBtjrbfKTgbxxDbRo=;
        b=NOIEqeCL1ec7L7fCBsDxQh8wSpOfg5RIoPsPPY0NW18A34iZIvC7Ivd8fRPMsJi3EY
         WuKUbaWJau86ce6AUSGdj5iuviapiy+SoHSXagwVrrIIlNCo/uT9IKMIU1NfObpOvOEZ
         zCDhZWxD/8EW1LD8EXG/BYLv8G9czQkqLByEWdtaWWFwM7tyuwuQNtk3Ng0BX2CwVMYO
         FQDFWCunxLfELACSoh1pdXaQvfWkmUF/LwCuoFInr0Da4VS/mLnO75hpbl4LMJYfgpeJ
         t7/vTlYhNgwozncL2Rg3UomKp7zvQXyQwd16YZ7amM6m0VpXs2VYWC38Diha2xH2Ehb6
         NL4g==
X-Forwarded-Encrypted: i=1; AJvYcCWYAzj3kI2h/or0e0KlZ7F0IArMBaUoIDf1Yt8isJKziwwVF/QhW3RBkvPYrUfvvmbrzPUINsFzzu4FqQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxLz6N2vO5N6oKjn+0JGIPe/eD53B4cPmivOpZUWDTUViEss/Ma
	QwsRetOOfpo2Xw9DEyhejDLFBFIL8iGMwUYyvWr24INjBSl7eh13uD7wB08XHmLBbHkNlYV/dPy
	YRMs1CrHoCXCIjh2gBvoY0O3az7cLsRh77I9pL0HIIeaVNC3mv7pRiW4I9rN698oRlg==
X-Gm-Gg: ASbGncsThYl1OVj5FLVYLIe7yfoKFzDmuyxk3gKg4D03Oz010laMkfXamosQGqQL6Ev
	JtQdq4+aftoben5qb3ieAV8SHqfiCGDIwxIVUGUXSOGfm2bEEqs5/k6ZuaP9A1k9HU6nEFnfo++
	m8OFBHXrjvbDjlDVQ8mP0xfv/EO2NQ2rsRWL4IH61B0yIIkmlUx5p1LZw1LIFzJgCpM9qBAH+qq
	bDPlCkEU8PJl51gFhYCOzjuWSwg1WYDQ+IPGhfEW2dey0gS3JLrkFITYnEvh2TYuP8Hz96ad95u
	nrvRs5a+7iFEQ7gbYhjAS7AqODZFM4E/58Z06dO+lntJo1Ov53b49R+zjYcmmHuQhhOib/ZfewL
	cMSXFrj/CkOTfv/TASABntTfaeJwLA8/v0KlPbq5sVjHNY/3lgWlt
X-Received: by 2002:ac8:5f53:0:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4da48c83a55mr117773491cf.29.1758935081756;
        Fri, 26 Sep 2025 18:04:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF75VibNMp5O2UtPKi1lry6nSqkB5lKg4XgBP9p5gbrQo+2jtHOvdb5uGII3iLSHRo8cejMHA==
X-Received: by 2002:ac8:5f53:0:b0:4b6:38f8:4edf with SMTP id d75a77b69052e-4da48c83a55mr117773001cf.29.1758935081126;
        Fri, 26 Sep 2025 18:04:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:30 +0300
Subject: [PATCH 1/9] drm/display: hdmi-state-helpers: warn on unsupported
 InfoFrame types
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-1-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1357;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Kap+upNT87sFn+7RYq1dDaa62IPE0BRWOyWIEU3S6I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgfX/GIreKBwo6aCquZZY/wID5t6jipXzkNi
 wTF056wjFeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4HwAKCRCLPIo+Aiko
 1f55B/9KVdsAJOIT3RmBfdpKQySqJj7khLyWlEyFtjy3loB2+1eEOtJi2XVpH99c6q6m5nmgika
 FDWK4UD2Q/faYp488okDacpcRd7LG2k1I/KXafk68W0yMIvO5PU37KKyl7UkZWxNov7p7+aHt5R
 Wwp8mCubhX8mMCmlOVFpNKA5ARDnIbuY5e3+fAnV7hsW1ppyyJaXajCEmTQZvwpQoU0oH5PmzTa
 OwUPXQEUskF5wjmeV0dhV8YVx7YAksWi40g7yInbW6g+Q9eVi2VGdPoFWcdBj1TOGc2d7/j1rgU
 PZOjdrVKqzO/S8m9Bgk8t7Er/wOQS12w80Pibwbavv/Oj8jS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX4J7bHKxDsEDf
 uU6sd0zfNxcCw7EIRfIViZWUtBeUAe/QIfem+ReZFGKvj3IR+nACSMF9RCInii1JzoOOOoS3JK9
 rjkTVcXXYXZPDSJKGXx5M1a7mAwiJkpbwOIX7VvyElyVTBdIRI/D01AVujrSSJk9745o1jjoxox
 6Eq8VT+go7hpGPE82xv7tMb0bNXTHFb8zUYugMVi/n7g2r1S8vk7sNSgkLakbUq4VypfeefFh5M
 0koN4Q++pTmIKr3b0JxIBFlKnE9+zL9qFUXOjZJIulTOU5GnJ0A2p+BVm7wgx88xFgyTjyrfsgJ
 nO2hBZKnSjg6qQZD3NtMbLghS7XvqY/xgAkveUg8shbSzVKSge43lBtvB/fHuiwwesHBqHCsRtA
 +Yfky38llq1kU+8i/44uibGJkNskvw==
X-Proofpoint-GUID: mkPExdiR4sThpRc6vu2lC9na0WqQOsg9
X-Proofpoint-ORIG-GUID: mkPExdiR4sThpRc6vu2lC9na0WqQOsg9
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d7382b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9qaGXxVFTICEpRVd4z0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

In preparation to tightening driver control over generated InfoFrames,
make sure to warn the user if the driver rejects the InfoFrames on the
grounds of it being unsupported.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..361912de2741939cfb5ec350c08d738a92e2ad37 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -920,6 +920,8 @@ static int clear_infoframe(struct drm_connector *connector,
 	int ret;
 
 	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret == -EOPNOTSUPP)
+		dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
 	if (ret)
 		return ret;
 
@@ -947,6 +949,8 @@ static int write_device_infoframe(struct drm_connector *connector,
 		return len;
 
 	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret == -EOPNOTSUPP)
+		dev_warn_once(it->dev, "unsupported HDMI infoframe 0x%x\n", frame->any.type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;

-- 
2.47.3

