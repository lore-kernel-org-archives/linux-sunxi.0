Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4179B1DFE0B
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758935083; cv=none; b=Irg2DZJgjOtNVoVQ0O67SFZQUIoEmAoHDVb8GTcT883cNpAIeZQJ1Mz3iwXtfVoBeAr36ytcSnqxoLiYE2PdfQ/zPNLDDaH82R3OIK860V63o3ZNseK6wDc2VufN9xAPeoM+Po9eZR24BdJ1Dm5hLDU0QhMTSVEosliOqcwJ4vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758935083; c=relaxed/simple;
	bh=Q78XSS/y8JtPNnJI6s3J7ArXOP9v75Iaz+LCtP6FojY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ffeFBXy2abOA6RvvGIk9TUL7Wo5EXoTLYnvMIbuKoeO3KerkopBAhrP/MwzKtJVlZalYNl+kZgNCb0aKAWJoo3Miua7B86H76bvsn+JaCHT4o9YBVZn0ZyVrD7fUI8x9epBW6Ma8taWAhNM/16TnQj402irewz59zAJpzqMIf2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXxXeZpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXxXeZpQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXGQa011449
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Qc5ocY3tSciWpBAvhCZm/2
	AVYNgu26K/bDoBWBIx65s=; b=XXxXeZpQoQZGfQAi2J3GHrxvHFMaIqSGA8mLTB
	rnF2pRGvy4DfAWzwdfPwq1G1VkzwbRpa+DNA/e4Mod/7Hg5r4jyvIHCBDIYiVxjJ
	pnYpMjy6S9CKxRLa2Og1MkeO64/smHZWkYXXCODCFETfDud3kKM3TPx0WD0OBwx1
	NrFXorE+zOCSYPwPageBqGT23TBYlS4T4FXqsup/uf0BepZ1JVUjM0G3PFXYZyAf
	0yhiJZ3JSKwjWYtM02HVQDEVOTT9FMznbznv042MZBgS0UH23Ek/vnQs9A+7P7pr
	aaZWbwxX+5336Ur9HGVIokMuoMj+yfa3ZP+n8mBet6CxwVJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db324g9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Sep 2025 01:04:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4d602229d20so49456251cf.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Sep 2025 18:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758935078; x=1759539878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qc5ocY3tSciWpBAvhCZm/2AVYNgu26K/bDoBWBIx65s=;
        b=kJU0/6Ly3sCRUwgt1pxpFNRVhONvSqeSrFLPMNT1946iO5gQw2R8tJ3y0CPtJpgpF5
         8atNST9rwZIRbT2SwegxcethkpJJf+bZT/dV0C2yfzq+88covkmlY1peMs+OC5golSRq
         NYX0oFjPjB1uoRhCq6xoRNgcgLGBsv6gpx2wEONGPt+JCLT9b46Fs0B2H/RNlNgwCJ12
         BcsyCvv1FFTpC+wRVWsu9aRkcLdlS3Eb8B8nHTJEcUwAr3MkgbB3XMt6WN3Nl0JvHHpa
         j3nFfz7xD1/VUe64DJOLi2qk46rfT3/7imsygOUZu3o8TVvGbGIUHagd2SuWKFkEdsOw
         mgDA==
X-Forwarded-Encrypted: i=1; AJvYcCU9RkDaON9XcPZu4Ka7sO3x1pTXVxDoKvPpVEwE3Y8dpsnLsjfqNJaRVsoJRsjxwrP2idDwpwWtDR64wQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YybrV85widb+WtwR8vTKGxV3VqekZneQTyUT3+IyzV8YrFgw2wI
	KDx0+lVCLMSECKK0ymR0xkjuYCd9Y0+TOycTlxNB+OlNN99iOOOz+ZLEJaZFv395/6mnAIIedWb
	/AtUQT/5DGhv/Wete3l4CQ570iwELzMJLWlPVQgdud44bR35P2j2dppAiuMVjcZXBaw==
X-Gm-Gg: ASbGncuGSwRbSmZ3mib2c4dOmr3tyYPhznphFqcRv2Ejz6FmIaus53Ob6UVCt4Txd87
	kHIlpZhKj02eeLr4K5ytPhu719zmJ1BmP5GvELFSs8wBoI0uBYiRULdW4o1D3Engwd9H1nHKsi7
	bUk8sR/kNlO390X4sdA+SArU/j/TjO2DJpy1yMpyswoIT/BAGg/LvsYU3Fk3Hg6u88iSHE68QR1
	uIuJBpl6ISTqWum88YGl+vt0c0ntNv1X4sUa2gwNvIEXfcgVvRg9cvHKaenq412hRaj82lX3u8C
	q+dUeDDycrUnQIaKtJUkcYAnnWLGv/j+CcstgmYM6tjYNTP0iZwsMt0Jmvn4gPhRsorrwEGbSpe
	3XcDcNcYnihFKPZaf2WufL99ytiYTTaNeVSAQv1FSYgvSKAmyk/mM
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4da481d940dmr135262791cf.17.1758935077866;
        Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfLcwV5gyaQhWH6cMHnOYm2QjhypSrV9zAMf4Mjq0wafZNaibNe24/I99cJs5+682pxDxsRQ==
X-Received: by 2002:a05:622a:4087:b0:4b0:677d:d8e1 with SMTP id d75a77b69052e-4da481d940dmr135262141cf.17.1758935077228;
        Fri, 26 Sep 2025 18:04:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 18:04:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sat, 27 Sep 2025 04:04:29 +0300
Message-Id: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB0412gC/x3MQQqAIBBA0avErBsww2S6SrSwGmugLDQiiO6et
 HyL/x9IHIUTtMUDkS9JsoeMqixgXFyYGWXKBq20UaQtrrLJiRL87qPbOKHGZqCaDRFbcpDDI7K
 X+592/ft+cVBFNmQAAAA=
X-Change-ID: 20250927-limit-infoframes-2-6b93e599e79a
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2197;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Q78XSS/y8JtPNnJI6s3J7ArXOP9v75Iaz+LCtP6FojY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo1zgfvqV9tNwSDjjNu1bYmTuEZAt+bf4bJeYD4
 z1GvExeq5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNc4HwAKCRCLPIo+Aiko
 1YkbB/9JgqkHjaGTaOuUPOXbyqKe3xWoHX6CP+gZcmjWeLTPttNPll9tRPecwLTPJJzjqwb0Tpd
 eqnyT/OKyrEuPOjBZfBfYDV81Oe7BwMvlG9l+8UZrv7ek4sTJTW213DoX/sXyAsI9Pv4Xl9cAD/
 YZdFvqbUbR/PCDvU8iqBDjexW24uxIMybn+ywBSLeIRCCWkLYAkFXuvFTxTv+zAD/rqZXMfU/1J
 uxHBoTMU2CSIFXyngR6Ai9qcFLfRK8BZqqdUtMEVYvWvtKnlcfrNLyu0/IuFaKyobHtojURMCfr
 0qoCsi5cPINJIPi0VMgx0EIAwXBhbcnQKrtLOHJq5CDQ8gDA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ao6/yCZV c=1 sm=1 tr=0 ts=68d73827 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nzWYFid4u6m6PcWKGoNrf15ZCi0ww4P0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX332zXH+Sn2Zz
 EiauIhQ1Zdx1OvrTSIzBO4PTaiU41SHfWmOh7oPA6JIBNVWdueQ5NnMO9I+kZZBlFhKfsY/gDYL
 mnjbRCi6S44VYgx+OMAmRpiQ8jCDf8ylhNUmbA0FxKy1rA9YbI5ukItG+Uuwhn1QAGilDCDXAjI
 p6jLberIwtIriOwXR8+oC+aBPUmvyyGvaxeopZOgcjjz6gPIHkKcCj+2HAK9knoxG4ZfRjnQswh
 GyY5ShdLWITukqlDgQtJmlIOJLg0oGm02jFp+UPulhQ2KPzhmepbP+RdUAhBQLyAELy5WWhXXGK
 Cj+4gnTZnfdSZEbx3RbjPv5mnobQwqxV+54GYNwa1hey+tWTJeY038X0e6QB7xbpan/fZs2g3Wj
 hrJAg0sORT9MmxKx0bFWdTFOdFk4Ow==
X-Proofpoint-GUID: nzWYFid4u6m6PcWKGoNrf15ZCi0ww4P0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

It's not uncommon for the particular device to support only a subset of
HDMI InfoFrames. Currently it's mostly ignored by the framework: it
calls write_infoframe() / clear_infoframe() callbacks for all frames and
expects them to return success even if the InfoFrame is not supported.

Sort that out, making sure that all interfaces are consistent:
- In atomic_check() callback verify and disable unsupported InfoFrames.
- In write_infoframe() / clear_infoframe() callbacks return -EOPNOTSUPP
  for unsupported InfoFrames.
- In write_device_infoframe() / clear_infoframe() functions warn if the
  callback returns -EOPNOTSUPP for the frame which is set (or was set
  beforehand).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (9):
      drm/display: hdmi-state-helpers: warn on unsupported InfoFrame types
      drm/bridge: adv7511: handle unsupported InfoFrames
      drm/bridge: ite-it6263: handle unsupported InfoFrames
      drm/bridge: lontium-lt9611: handle unsupported InfoFrames
      drm/bridge: synopsys/dw-hdmi-qp: handle unsupported InfoFrames
      drm/msm: hdmi: handle unsupported InfoFrames
      drm/rockchip: rk3066_hdmi: handle unsupported InfoFrames
      drm/rockchip: inno-hdmi: handle unsupported InfoFrames
      drm/sun4i: hdmi: handle unsupported InfoFrames

 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c    | 20 ++++++++--
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 +++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  4 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 ++++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 46 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 38 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 49 ++++++++++++++++++++++---
 9 files changed, 202 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry

