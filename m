Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9E832277C
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755629868; cv=none; b=boeywq2euLwps20F+qpnHWojWN9FdKO1fBWPY5n8B+UzZMSPekCbXPk9V5hqMI2EZRstC969BPdvIVn20EP5ygPWD4CTWXO2boe6QD8BmV0esNt5LcPYRL7nLGkPkBGRSH8PqDoze9c2DWwUET/FfPYqUJ91M33tcuVScP25YuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755629868; c=relaxed/simple;
	bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlVBOzezUSaOmVO7gA8RrcAidZ+HkufwVzbsCv2p8PgIS+gI1K3jYe224Uqyzk3KcSTkW2I1IEBTg+9ZJRCYici7XZ/vCS1KNPN8NSZvrbNiInjjh3Qkp2fpj+KHHhpHxf46MKl6NE5nAZ9AWccOLkX7DIQSXlZqcaFuSbl/Do4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dl+mKYka; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dl+mKYka"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGxC0P023322
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=; b=dl+mKYkavx9jfaMA
	pxQZjyuWy6ApkP6xIBIp2SMVIRICIp0wxmhV7nhMBIRSvdjopk9vRHt5CYN5D5Df
	gLqKGiedMLp/PZNbePG1dNhpJjmbMK7kCP/AxuSYpD4fXH3A84UzGAUCQdknE074
	/aRuxQLfPQLqG41ItAlcFxxtg7dYd79jkKqtRnTWPXY1cPLux/M7lHq17viN3ikO
	fah3pe4J3EGxoQ028nhZKqBGYXZlQ2dFzNPrmO0NhDDQ2SFgR7aHouiDSu4CY4RK
	PqERRwTfzdyLIeFEGJD2WRq2FNcqPVCrHM3Z2a1a8/x3vKNyHRonQvhoyckHbAy7
	Mf2yGg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vmmkm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 18:57:46 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ba7aa13c3so178090716d6.1
        for <linux-sunxi@lists.linux.dev>; Tue, 19 Aug 2025 11:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755629866; x=1756234666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WheBIbMm8jmW4YxKN53JoUfaF7MiVG3M+ZhDR9++pK4=;
        b=ABod6nA7k/OaMC7Eicwnq6EfpjEVo9fpyF3VNiV/jcUU/yE7pbiyw3rXQ4nfZQnpui
         jEOn33Gnqu+7eBISd5R9BSFmM8G56/pbosNnoMIziWArAcQocFIT1RhaHvpY+hh4zZYi
         HW+/D7AGD1N/6mnEx7els7wbtTLtBNUOBiRMS0gJ+ltEqx5OObtUpkRow11mAFTtfjn4
         gVSwYa4C84MzHlYQA6vzIAIuOnO268hM3ws3C8Ufo1cVMXGUWyEkr9hPuTA4F5VtuWWM
         foc2u/1FNWIPiQ/fSfFiaJT4PPmMOX7ip+XYmKBZso/6wvzW+AJPwFI2ZSX49yJk8eMX
         u9tA==
X-Forwarded-Encrypted: i=1; AJvYcCV2ZmM/FLrcolrzbVbAdJ/H5se3dM3g6EN8AwmXtjk4VMeF0+9o+NDLTDl8xGSmWrzTo7zIu7STlOQU/Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmbsYaE6uPy3YuA//wChdJ+pCRt7I0q+ruoWcSLBydO8yHXf2x
	0GZKis9JilQ8bp3A05t55z7S/55+bcol5AWQFFgJuJK7ne2FNsdD1O/ldds/Kvkh3rpUlPPz7LA
	6Ori7aPWzqfJ3NCgr/MeC5Xt7IY/FsmomgsQN1es2FrhqHEO+P8r2NqQQS+mBYCXuuw==
X-Gm-Gg: ASbGncskkAWULKcnI7tDFatHH1vw8jVhLf5j2ttdsOYTW+j35W0106YEfN95JnZF2P1
	znQtenCVrVrWw5/pYvsZFAzsIUTJ5B9HwJMM3kRHGRfySsV1U76cZ/OW7U89p1Bsm3Xgqipxauz
	nHpEN2qUjielq8fFC+zIpUiO+P9bdEt/KE8bvx7RCJKA+OY7Q2/A9KD1PrgGO9jW5F+IgtqO2vG
	isAuAHswKYucp9hh0Q6/k1bGzY3KVsNtLJ50tm7iRvHf65GmYG2utotXS2nw8UIaD5emLzzdNxg
	3U4c2i525Hrx545XiAfFgkIoW/cZnCb+SwASsEj2Opxkh7r561cHjDYpZSxEaPbS0rRI0yo1N2e
	79Bn2Fo9gVAelH1RqV1Z/WVpe3LWpsLYY1TZV51npBC8YTZ/XURTq
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70d76f1b57fmr977466d6.3.1755629865600;
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEr9lG70O+e1XTcrpB3s7bSU3peWs1FenRfwedIgpf8VBr8B4XQM4LoKEEzgPGJdC9gGNvxDA==
X-Received: by 2002:a05:6214:300f:b0:709:3ab5:b935 with SMTP id 6a1803df08f44-70d76f1b57fmr977216d6.3.1755629865082;
        Tue, 19 Aug 2025 11:57:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef35f11csm2207314e87.51.2025.08.19.11.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:57:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 21:57:34 +0300
Subject: [PATCH v2 5/8] drm/bridge: synopsys/dw-hdmi-qp: declare supported
 infoframes
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-drm-limit-infoframes-v2-5-7595dda24fbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+Dfr1zh3DlBnrvVAtXMJg6eNn5T47Wh0MW2ToSAF+Qw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopMkc6uAxm7Nj8Fu5N7QPKSrbc88k7ZAuyOExK
 KQwTesFW6CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTJHAAKCRCLPIo+Aiko
 1agAB/9o1aDDfIY8MzTByg+veg862UBNIr6XxQEXInLmnD2NrcHjkS2h3H6hWZ6N5ehfnvYt2OB
 IfENqfzAoXBer32q85PKjMZRz2rbnEV3Q5hRMl3Yd+cLZ+Bgggm3SizKnyEUVEsOPG5u5e/UWdF
 VfWw6fncj22N8fWN4il1qeqCWwQpuYq1BbuxcWHT893G7cCwr+tEkLGlXL+RoeEhTZ79FjIOWLj
 nrjOzHE3F9R212pGr8mYVpoQim3b9qZFOAq3qjoZ0iRNLnROElCCvPsDxxdDhCMEznPjF+Lh08I
 s2lsMKsTVzytn+1wHItHP0kXCQgdfhgPAMPhTPoQ6pC3mpbH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX67FdY05UVolb
 bAHFn3AJnXT5mFFSxoitsv/JVrT5jvFPhtPCQFLXU8hwcCy+xv7Tgl1exaYuBfd0OwdnbYe4N/e
 SdZLbAhQIZjybjCHrPj+PCcDvnr7TZeuCTmNOMBg6/BNw0hOeQuCHGO1EaGynhiCBJAb6+bXGbY
 b30u6lVFwYAUO5sU+f0DJbD9dprv+yyOLiLa0JSyLItBnm5vcyStLTtMdMrhV00zsHld8M7Xjl7
 OFkRLQc7f8O+yNdxs0BNk5d8+SoRZM0MlQSrw+t0ggwMjkjMQSt/JurM5lg3OG7N+jkW9a8eBvf
 SH3vd33euUgIz2u45H6yZMpF2G3QStldCIWGAxjEbeCO9GqRc6HFwzPqQHcl/g57zuiGUNyjIq0
 IoZKNJHu
X-Proofpoint-GUID: Dx78pwrS1s65u5cg_i4IECrIjjjC99l_
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a4c92a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oy62-DSxHemnvxnUzX8A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: Dx78pwrS1s65u5cg_i4IECrIjjjC99l_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

Declare which infoframes are supported via the .hdmi_write_infoframe()
interface.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 39332c57f2c54296f39e27612544f4fbf923863f..b982c2504a3112a77fbc8df9a39236cb8e625ea4 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1084,6 +1084,9 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	hdmi->bridge.vendor = "Synopsys";
 	hdmi->bridge.product = "DW HDMI QP TX";
+	hdmi->bridge.supported_infoframes = DRM_CONNECTOR_INFOFRAME_AUDIO |
+		DRM_CONNECTOR_INFOFRAME_AVI |
+		DRM_CONNECTOR_INFOFRAME_DRM,
 
 	hdmi->bridge.ddc = dw_hdmi_qp_i2c_adapter(hdmi);
 	if (IS_ERR(hdmi->bridge.ddc))

-- 
2.47.2

