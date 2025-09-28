Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DD72BDC3B
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047901; cv=none; b=IbDCKl2VBpVdwY4ynlT2eOBTbwGyhU4gM4heXvtBhFCcMFHa+4KZyEoGVv60ubaZ6xt3IcGPSQocFrC3gTy9APKVyJTGR0TKePIbp8toMDja6818xjN7YRME2r+AvdGTlGuIlEFpNFnJUnm+sOTyIEntp4m94T/tXNvxmvyHPZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047901; c=relaxed/simple;
	bh=wXdpgIK2nMReHeFFkBUwQqE/S6v5i1Ns3S0QQzaiDpU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HQhYjAzNyrMFQh3iv3YNdNfg32VFuzRBA3yOpYGwG8XtuAT16dETuSnQO0u1kNV8BH6HVZ7zg0kDzSY4KpTDEnKHrggMBKrLdG5leWWdZV5PEx+BHMgZzsST2Cn4qWUmOlAC9F/pQyajgJ/RnGi/Vy9eIhuu8ZY3FQgfkpZLsd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMqOPF2R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMqOPF2R"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S8GuNm012669
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:24:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rc2O4wz2Xp3rHoz8/mUbsM
	fKLduyX74HJKpJIAxeyFQ=; b=IMqOPF2RwTNjYzv3tzCtFIDfj53rMbYzw9zi5a
	Y9LeTo/S+tjjGF9oJRxXAfKeFY3aIlPfVF7ujyjbB4MuT9rzcb703ByiNhpuxby1
	qY0pQRVdJB2gbPUSLPeC/V20uBZlwzoVbN2DgFnVxwXKYzHQnBqoXB+3wj89AXTv
	T5iQOHTFezAh18vkMe3bQuChogXu+EPxkSeoMcBmKrv1gVIRYH6ojpNWd/7URQAt
	HHBtgI5Qh0P598ZSc0tiu+zecOUipf5VdRGswtuO7JomOBiXqVek9SRrPBZ1H2MM
	5uJMjr/0yRfOhNGRl7NkImgXclV789e+a33pyEW5mTgSz5IQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78ftfhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 08:24:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4df60ea7a1bso15991381cf.2
        for <linux-sunxi@lists.linux.dev>; Sun, 28 Sep 2025 01:24:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047896; x=1759652696;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rc2O4wz2Xp3rHoz8/mUbsMfKLduyX74HJKpJIAxeyFQ=;
        b=SZYdhsktYYUw/vY2wbyP9neByjY9Br15hui7vkh+QGWQKVJ6daY+weuL3a8Rxuw+C4
         u9oD9WNd+c1ncDEJwK6II7WKGwm2Y1kbZ6anUobWrw97JJbfMxYU1KnLL+Co7EYBxE09
         XA8wVBroA7dfE/VYOKoOpfz/HakEqQ1f9QVDpxEJ/RxVyFsqSuIMHp30Y/E3QgSmp9f4
         Yw1m9pQNzYKDPCDiP+r9Hi7oqToVMBd8LOw4PxEaUd4woLq3F/dR8cTldmcQfPeXWqrO
         hQ5bepiI6eslvu0LMtH1te9Zn8Vnh7K11uK1YNdDMEUQKmEGL8rfDXs+/81PTeY0SyeO
         wUQg==
X-Forwarded-Encrypted: i=1; AJvYcCVIYZyVnz7h6HuAv1NwF9vubp71Kpgm38gnRq1szcUEKNUXH0dn/MjtrsS6aWQQp/gNWvR5H2FSKTougA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWVGpNTly1Iawr/jsjIoxv+mDusV9whDJCerVkm28OqW7c7iA9
	vNho6uqlYQTrEvYOmTJDgoEytiVyjMJTFv4wwtSJRdYR6H/LyFrpUkmGe3+RlbyR4rxgGXluPhz
	smU3guuoswjGJJV5OJ89eTv0RfofelN7/QVWW0QdA6nhBLh0V9ds8nxpS2srObSfFTg==
X-Gm-Gg: ASbGnctz0dx6TNejjSy/aKR8AcUvLFEHhHCyoNoBZd9ustPWG1lr4bXf8IPrWzfDG0w
	64o4Rm/ohr0dsgzFYrVqGS/SYQenxkm6BJXJQ4YLEdCn1A+lj2R1qePaSw9ybZwbANnv9i3oXMy
	FCyIImTf21hW+EHHWZAKo5cxHB44KoBlPdTNgQgktWo7cPcPCEVn71LGNdqNjJWzB02qsTCzgqk
	BXKjz2Lb8N1isakiwThGLOP7ISReDped/T30rwrEss1By6d06T48AXtdlNoeTCW7x3fc4I4M2Kj
	61y+7Y6uYerjpblNT40hON/qA0GmNIbUsNP8gxqV0tcxDXBMt4kUsAcpsatuoPV7fnFRreFMMvS
	vOtLFBQXf8VDUiyyBDlsgz4ZGoiuiTVNg21W9JpOi3z4irwUGDTpi
X-Received: by 2002:a05:622a:19a3:b0:4df:194:b46d with SMTP id d75a77b69052e-4df0194c12cmr55268971cf.80.1759047895981;
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSQGqS4aJ7VDAivVQk/ANpuwQy7ctS7IE9D3fgBdrHjHXtkW+JEen25AcKMFhLLPIqmo1upQ==
X-Received: by 2002:a05:622a:19a3:b0:4df:194:b46d with SMTP id d75a77b69052e-4df0194c12cmr55268701cf.80.1759047895487;
        Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:24:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/9] drm/connector: hdmi: limit infoframes per driver
 capabilities, second approach
Date: Sun, 28 Sep 2025 11:24:45 +0300
Message-Id: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM3w2GgC/32NQQqDMBBFryKz7kiSEiVd9R7FRdSxDhjTZqy0i
 Hdv6gG6+fA+/Pc3EEpMApdig0QrC8c5gzkV0I1+vhNynxmMMlY5U+PEgRfkeYhD8oEEDVatO5N
 1jmrnIQ8fiQZ+H9Jbk3lkWWL6HB+r/rV/datGhZWrrdZtr6xqr1GkfL781MUQyhzQ7Pv+BWNgR
 Ue7AAAA
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
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wXdpgIK2nMReHeFFkBUwQqE/S6v5i1Ns3S0QQzaiDpU=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTB73mP/OiC/2SDbHHGonN3evfKMNBf+mFV
 TAqz55+BLGJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1QGaB/dCkhCFXM3rS/LZOxNFSLK33p0eqjXUwRLj/k1HSm4nPT5ACqB10fJ3tODSDVscNubP0oR
 jfmyJiJzo6t6DoZD77G8Nj64HnQj5ie1loe2Gq8taQC/i6+qO0ReHUV68PcRZJ4/RjIU3SFWYGr
 B0zT0V5KzHabbu+gztU9ddfmCS5QCau8INJXipea8RT1wLTnGNAWjHjycLW4akzsWGYMGmTD3dy
 eYpOMrWIfTBaRqxQh18GUkTypkJLT/cx0JwTR2Tg040mVGp2fCpVCbTwweZgCSWyuuaRHRVeK52
 pmZkVNSrt+Wnj6FEnoqFtN3ELK6yNEwAzYWXHwb2GyWEDPE=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68d8f0d9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BiG78YgtQv3mHEaFN1cA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfX22FGqwWHMVUN
 o4J/JNlG4dtGel1cC/nhqckSliutVWXhDMPBwOR4nXajae0eFEZnroLygdrnwSdK+0A5m9dIE7M
 eO1fTw8TC534mHBuCbrQcqp8hEWj1/HW1wZEj+/urml8hGrUADQ1VElIqacoijVXghSnYEMLzcK
 BajnIUdG2bd/JOTQfydFnmBgNWQU4Asn9mKGDeG39EIXczTqs8AnlO6EFYS6F8Ge/XoiUdiaep9
 lhL/fw74TupbLXn6WaWV6BzMc++b+KW0VdjY1a7dlF7rsjDcqQyPIRf+K8wm2aKVZnNAjLOtntX
 73Ok2kGSJ9J7i/xk5f2KkUh5F46lUsCvNNhKQC2jubq++yBhugpsf0BTmjR/vteloyaS2eayGTm
 zuHvPBYaqYRrH4HkK6wO0KV3Q369mg==
X-Proofpoint-GUID: UBwyOOO1btSpX556Dh2Kyrul3UuFCvnK
X-Proofpoint-ORIG-GUID: UBwyOOO1btSpX556Dh2Kyrul3UuFCvnK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022

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
Changes in v2:
- Fixed build issue in common code
- Fixed comments regarding HDR / audio frames (Diedrik)
- In adv7511 actually check for the HDR frame (the comment was correct)
  rather than the audio infoframe (c&p error).
- Link to v1: https://lore.kernel.org/r/20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com

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
 drivers/gpu/drm/bridge/ite-it6263.c             | 27 ++++++++++++-
 drivers/gpu/drm/bridge/lontium-lt9611.c         | 22 ++++++++---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c    | 20 ++++++++--
 drivers/gpu/drm/display/drm_hdmi_state_helper.c |  6 +++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c          | 19 +++++++--
 drivers/gpu/drm/rockchip/inno_hdmi.c            | 47 +++++++++++++++++------
 drivers/gpu/drm/rockchip/rk3066_hdmi.c          | 39 +++++++++++++++----
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c          | 51 ++++++++++++++++++++++---
 9 files changed, 208 insertions(+), 43 deletions(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250927-limit-infoframes-2-6b93e599e79a

Best regards,
-- 
With best wishes
Dmitry

