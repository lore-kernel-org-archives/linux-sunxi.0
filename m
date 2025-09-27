Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523A6209F5A
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935123; cv=none; b=WkM2s0Osw+hpJKDxlL4mMHzkKcLNrW/WFsR1TLHz8tVIrW/AjEB3vL8vhYS/q8s1F1/lvmPHX4KfTSSkQf0xsLanUoj4s0+TCFeFj45uC7L3sUkEu3Z3aaCOAZJLmCwZo9BQFx4UIXfpfsj7ZZZFh463E5Nbqp/L4q8pwhvGgHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935123; c=relaxed/simple;
	bh=Lc2tTQYfaN7zqRa7FcjPg44+fL+8LeTUVnX4T4zpQNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TILe/2bo9diwejjL6HEC2APt/bEbuCaCnqotapYMrqefO7hCLbpwyiA7p8EC/nOV1kgJA81Tka+O0DQXkoCxbTXwOmrBEGJ6zUUCY4tcunIOXnMUK1Wgt0YYs+9vBEeZ8aIfZo9v45yEYYmDYSvo5w6iKd+7D9lmngRrIb40olc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOTli0M4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOTli0M4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXJq0032710
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=; b=UOTli0M4CsntoZrE
	7T1c1P0BhQ3Qki+HUpNz4BE2hfj8yF1BkmCLcVTjSWAXEHqhLuSRx3HwWjkhMrDh
	BtPqcZ8FF+/LyCWZdF1VUiaZnVfZ6zojoQD8ewIkLrTAOu5rMjNFvChKjxM0XN5h
	N6g36shxoOSY3S4x4TtW7e/OSp9M1EDkD84rkuRhY1PDPSMCkrymnxt8pUnS+F3H
	31QMFsC9TnCD7cQexdfzx9Jjh4m4E/nyPb8UvuJqpKERZgGbD19aMh1M7GKv4gtv
	CzDyQ1n0bRCxaz32uZYXYv/yVxdY1Q8Khfuu1AXGqFm6i/xee8Z6+u5E649uR32m
	0l08lg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tchf3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:05:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de4fb840abso25083491cf.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Sep 2025 18:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935108; x=1759539908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=;
        b=nkVyjeMU7AEkjGggMw6nBxuwV+82ZJD2CfPP57Wjo6c68muODZrQ+tFMIhotlG5itk
         2td4AQVeDzO992mBNpdBoiyBqoNOEBDJqYvw0VPPJ6l1Zq5OLR89NYzvD5BhG7my4Adv
         FHh/HJJuA8bZJ02d+PnvWwXVpmIB4ovHRytomy49I1MgX+SKWHpOnVAXVolCaq8NhAFD
         /+F+qkItbBLRjPoOFnF666KqaF05hVxWH2wNbXiascmE+biLMOx5bfUPt1G6+e9IE+Xg
         w/6QLRe/mqERJ1XaVe36TB4Heqeg0MY20ls4NuMZO8t+6G3BbayBE6MS8CefgkBcG4hU
         /i5A==
X-Forwarded-Encrypted: i=1; AJvYcCWXaavhsRgNCVIXHAZ0KrMYMtZLQg/5VeLXxdd/6NnSLblsoOi9TAp2tOBBVPvhzFmhvcYNd/9imiXfUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKE4UxvO3V/wmGe5hiKdtQJSxkuTFOSWschF1z3BHEB/Cz+YVo
	s3d02+MG6uskW9Acrtc3Lc3bLdHFt8KdYQB/C1JeLQQp3Pn/9Zr8geoLttRSAgNFEyliaZ025RA
	A0iLe+xkhP3oufEOUu0bFpcTS+yY14VnkmOFkZVgXos8Kb1hHNBIwy8DxUuzlj5kndw==
X-Gm-Gg: ASbGncsjPSXzjymD49DUI1ms98mPICjnAv8yrfOBfI+y4AUe4KJs2qOnxwyfL/tw8iz
	G2qSOoovhYp0nbSBvdCQ6g3cvrG4VPCwuF8GrZ/SHZLoEFd6REeVpaVlNIwkhoEZ428C7k4xcAu
	lpzGeVh9/AT+9YpUDjvzlnLN7yhkH0ZlD6MIS2YlcSMcfpcNCxoy4gm34F+CBgVeAAs4wnwI+tU
	7lt2wNeosqPRAXGW0FFF40N0kViE6rmH1VJTLqOIPr5FIym5H4+BIU5ouDm5orDivHVNCtisOzc
	+88btc+X4YavnGYbpMpsUeE15rA7V12UKSjqCxO5blEyq0SBPcYdPISubBRCnWNAzdkQ6szJrQG
	3VpwryTqmj59gk5qPqyeOxlnzCmyzJSF2GPwTbZ5TJLhmaTQJ32ae
X-Received: by 2002:a05:622a:4d4a:b0:4d1:6bc9:8794 with SMTP id d75a77b69052e-4dacc7b3838mr95542911cf.23.1758935108440;
        Fri, 26 Sep 2025 18:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4GFghpOB7X5hfVz4Kb96HCFDTN4uTdC0uUTICAAv034gi7/1wnQGm5inpTe2Y4vlchBVykw==
X-Received: by 2002:a05:622a:4d4a:b0:4d1:6bc9:8794 with SMTP id d75a77b69052e-4dacc7b3838mr95542331cf.23.1758935107900;
        Fri, 26 Sep 2025 18:05:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:05:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:37 +0300
Subject: [PATCH 8/9] drm/rockchip: inno-hdmi: handle unsupported InfoFrames
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-8-697511bd050b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lc2tTQYfaN7zqRa7FcjPg44+fL+8LeTUVnX4T4zpQNQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C0V9TUOdBzd53hj9kTaa8f96WMDi9NcP7Le/9/e9w
 poYpaLdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJbHvMwTBN/K/sz53FzjMm
 MaXGnrPvubO9r9f2X2Tc6j3Fmps9nohc3VX4Zf6GuQmaUWWzpZ3lTKZs+n3FK7zAeVJm3wMOY/1
 rPBwCa3oSOJXPxC8+dHRdnPrRWmm3iKTQUtnMPAUT1ZBZaxhZP8R9V2F+wbjaZq30LqHTyoL7M5
 NOyNas8f/mJhH9aAWvf/Img/NfVvt7MrnL7L6yOLfZ8tsKV4uiyVNiWU+eWS/NsEGiPv3Einxex
 doLLRL3Np4qkPCtved913RyeuiNj3a+U63nyChLF0rlTHQ8sF4x/eyBnEQ2tZV9tVcOXT1uwa4X
 MaXv7hO5IFG17R5X1zVqWsnuZ/+mwBJ7wSN9ldbKg+31AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JwqO19h_zDuRqAlYKMC3eeAEqochP_zr
X-Proofpoint-GUID: JwqO19h_zDuRqAlYKMC3eeAEqochP_zr
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d73850 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXw28MQ5IYwg81
 KWg8OLQml9QR/8K6HCTxMZzVOR06wPCjtekJMSxIenzNJ8suH2bHkFy4En0lohA6d74GrvnzEx+
 BVNODPFlCU+ofoL8QPpOePHQ+821aXY1lZUr5t4bQdm8txkHX7nce6uxJvF35qS8mvlfLzi85I4
 f2doq+m+GE9BmpiHQ9ykSLHTpSFqRnVvqmcbnLcra0wfAIufWXJ3OsjNO1Rk1JfT+U8eQeR+bh/
 9lh0abxA7qCVwhQqDiEhhg5KFDzk3nTp7pFOYytLHlkwYTG6PzzOOrhLfpadaFEu+GAtJTIuMh3
 KHx6UCKi4ogjYnLCuavLgdFDwXG4cnSe0nz8++LJ15fgmi0WPHohgshiergKRt0UrONbA9SA4gP
 PLAwnnILZ8mKm2RGI61IjWXQfafo7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 46 +++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421cf5e0c1be63a80da23d645cf3f24..dc2d68b9c87f7ae7b06ecbeaebc82b9689c1abfd 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -641,11 +641,8 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 
@@ -659,11 +656,8 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	inno_hdmi_disable_frame(connector, type);
 
@@ -673,6 +667,36 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
 	.clear_infoframe	= inno_hdmi_disable_frame,
 	.write_infoframe	= inno_hdmi_upload_frame,
@@ -1029,7 +1053,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
+	.atomic_check = inno_hdmi_connector_atomic_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };

-- 
2.47.3

