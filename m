Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB04D36DA14
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380216; cv=none; b=onXGauwrxTNB/koyxJCxv770q0UqxDMT1VpTFaBN3PyYXFg8iYIHB4lX7s24/i2Ak4Mgb8ZBBBVPM1KwyV3KR2z9aGsVL2YtFIf1nxKZ60QX+lVGZb0cvlb0nu3ouVnAMTU1eDs68vsnTQfL5P9DoEcjc9QxYbuTPOB6lbN0FNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380216; c=relaxed/simple;
	bh=5hzLQzPg3Siq2sAjeVrPq1UVjrMV+4INkOiCvhmskWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eTEXT/NAcWarx/etvgG6/pi3hxBgrk+/dy8aZoi+FBcp0MyjDxazC8geyQrDENEtOX4eX6HwyuM8TgxRAw6jRP4S273AtlBhIJQdNic8LnE9gGHYGzXI26wg1kB20pM/9Z9wNUcLhZHzMBZjR6RP24GvrmNS54XMzf3CbxvUrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WPo3DI7A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E0FzrTLF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WPo3DI7A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E0FzrTLF"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HquA72104761
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohah
	T+j6al9s=; b=WPo3DI7A9bAW4tlVrg0bqu4V+styJyUGUWS5W2JZCHN1MQPiTEi
	B/GveQ3mT/MrXBHqngiJvivPBht8vzfcWMVEe4SKqmIWxL6trNRvOAqeBCQxa9Cr
	CWxC7O6PRXcoIuZHFmx9f3HHaBfZ14Fm6UC9YMn3bMaA2GNvqkFiKTdYJzVrn8z0
	hJOGd1ybUsWB3nmQ5aLfFb0YTMEd1iqn7U0jVHt4/SGXznL8v5A7BR7nOU0B/Gyh
	gwvi2r+y7o9EnlAP8R003zg6xp9/l3tKssS7AOrIDul135GXM5UYereiVFD5t9Xu
	q6VoVNFAk528wRFtBLUFlQ4ltt5gNafAp0Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdsek1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:16:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso28340185ad.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380212; x=1788985012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=E0FzrTLFTX7dhFnS5J6C2EpP6NQWYBQeQfgZqtT7ll+qNmTyHHxb9NoYvH1RadFuAe
         zU/FaDtrgT1y6xfdymKVzOv8FR9xTx/tt+b/lHb2GvnOg5ff0jseaivw/nhfkEKvwZgB
         Im2v1JTMZ0z9CL/LKY7eJy2hJAvHFA62D+1IWP1TAJKsZIGvTlkGSn13gJp4HGBWrjBv
         PLx/5yQfZiCDe11AjOis0vo1NMkpnUoMQlpDEV+/qeDXmYsDlhuPLaYFj/GDiE95MU8O
         hqRsRyuD62bg2UFj785aEJ2sb1AfH8Fxxvppkcp6+XlBxNZf/Btj9hW1bXwQv6eCCbNl
         oGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380212; x=1788985012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=46siBCCvcvlpzJgw+UUQdDmQusxn/J6ohahT+j6al9s=;
        b=W1+yKrse5L+LNHv/QG5UkGVKb43NRIwDudcBZ9MLuUhjxFRnj1SzflqB4E1TcwLzdI
         Br5wlrGBWXiQ7k3Fb10D4EYSZBTCpb4xsLWqS/ArTrmB8PuFqDvxAMKk6jRDaaplfV7d
         BJsIpqEzozY4SyoJAyNZRUh4JkYTgPUjnL/sXDzw0CtcmJ/d6eDqnoqhBgx5LlUO2/x9
         dpV2abnrGkE0CqOK3x5oAORrJKAhE3wR7pJh+X9Gu14BT7ECSUzH9BUmNHx9x9RYy7d9
         Bku+pb5Zkv8bkahvaNGY51zQaZyFI/GMO/BMgTu1dWYuI0HB3/19WUcZzRO6IzfSq/Cy
         sAXA==
X-Forwarded-Encrypted: i=1; AKwUvBy3Cj+bvGmn2fG4ZhQECwoTmcq6+FEyU2GVXxKujF/Pa+IviOs3I/IakEemk+Bdra8ZHHBnunEkSIpgPg==@lists.linux.dev
X-Gm-Message-State: AFuF++lr89CbiQRGjkZ5r71+779QQPq5hGirW9D2g86uRhHk+CdH3F9o
	JkEQSdCxF58m8S/JQoFTOBxnXBbbBatcrLFCcwlL0Oh6iQ839wI/rPYa7z//mJB/9WnmPTLB3zm
	xBqRifO0camZk3tMHircG4SzEBJsVBsa3dwWx0ynPbyWj65Zlt5AVcdAvJLllgoHtgQ==
X-Gm-Gg: AYBFou3rhxrQFq8wraP8GUN7vElpP8i/K8LFI+LSDzpf0pQfSsb7X/pQdChF5O2dtNT
	lm1epuvE1I0m8/Bo2yIZCgDHYfxrx8g+w1Tcxd5m7SlTGC5E4ktb002A9HDaf4xTPhzOomiN8qU
	I6/dkHJl8c8JpfSdbx4AXmbHJGWEblWVhvVOzhdzfcEI6UqSGCsLiwYyCME48OEDbORU5FStAUz
	dulBdn5h2aw2cJCOngtMxsi0nmND0MgsO+7WDIa5JGVsUifdtrFm4mpzhb3UrVf+wWFGUP3ved8
	St78b4QpI1vizuyWniTQD2EAfjMbj773zJsasmEvjaOyXf4cygS7SWivfSPwon3nnH/Gy6IT5aU
	mFcQEOyNQlgAUb9QtVp4Tk1MxBNA=
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11956076a91.1.1788380212433;
        Wed, 02 Sep 2026 13:16:52 -0700 (PDT)
X-Received: by 2002:a17:90a:c107:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39aedf7c6bbmr11955961a91.1.1788380211806;
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/11] drm: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:29 +0530
Message-ID: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a988435 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nZq82LKI3H6k8voUjgcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: wgtUOu8eT5Zp_-Yrer850BNLlWuxTb2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX47kqWKHH1VLB
 8KbWGcdum5pNmijhWbATvrxsxTuCM/Yxjav6rscGYm23qPD/BqWc2tNdQvLI+bVIrF877zZPAsZ
 p64/GK2+UMonZ9vpcI0S8NX6Fjt3WudSpwtAfUd+qgVY/yPjM6KcOCuk6L/n4frYfmECty5uTk/
 xLX4WM3fnStizyjpp112vwIZD1f7J6mwib0v4rYQNrm4qBAAS6P5lo6d9J9xd3rxodWalO9MzKX
 L9DuRST8Vr/kK4XSbTSDyP7YZ2fXRYQPCNi72A+WgcozbSwB6Ywo211JIf9icscHLCpIqfWA9/9
 URGD8BoDKrqRVtZ8dl4qLmhvgT6OSIvlwhncPwohtSeUKHCWLMSrzDm19L0qgoKNguovwin6LRf
 04QJHmqyuCjgmIUnmgFrOh26bRGNEKJEmezh0wdFLbHPDapo7Nai773fk4XTjNh3mdxVhfUdSTD
 51ss8p1/JnJDBJPDCHA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5cQrJwZoeRfY
 rVvIM3HYMxruiaHqclp55tHSzncuOGETGDpT9x3drzf+F58mvqlvvQyguIIDoWXuh6N2BOtL54o
 E9yqTv9v0HrjHsD0pIGbW+dAkgPQGhM=
X-Proofpoint-ORIG-GUID: wgtUOu8eT5Zp_-Yrer850BNLlWuxTb2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Several DRM drivers manually manage reserved memory lifetime by pairing
of_reserved_mem_device_init() with an explicit of_reserved_mem_device_release()
in the remove or unbind path. Missing the release on any error path between
the two calls leaks the region for the lifetime of the driver.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
DRM drivers to use it.

Note for drivers using the component framework (hdlcd, malidp, sun4i): the
previous code called of_reserved_mem_device_release() explicitly in the
component unbind callback. After conversion, the release happens at device
removal (devm teardown) rather than at component unbind. For standard CMA
or system heap reserved memory, this is benign. Drivers relying on custom
rmem->ops with meaningful release-time side effects may need to retain an
explicit release in unbind; those cases are not known to exist for the
drivers converted here.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (11):
  drm: logicvc: Use devm_of_reserved_mem_device_init()
  drm: hdlcd: Use devm_of_reserved_mem_device_init()
  drm: pl111: Use devm_of_reserved_mem_device_init()
  drm: komeda: Use devm_of_reserved_mem_device_init()
  drm: malidp: Use devm_of_reserved_mem_device_init()
  drm: ingenic: Use devm_of_reserved_mem_device_init()
  drm: kmb: Use devm_of_reserved_mem_device_init()
  drm: sun4i: Use devm_of_reserved_mem_device_init()
  drm: xlnx: zynqmp_dpsub: Use devm_of_reserved_mem_device_init()
  drm: aspeed: Use devm_of_reserved_mem_device_init()
  drm: arcpgu: Use devm_of_reserved_mem_device_init()

 drivers/gpu/drm/logicvc/logicvc_drm.c             | 21 ++++++++-------------
 drivers/gpu/drm/arm/hdlcd_drv.c                   |  6 +-----
 drivers/gpu/drm/pl111/pl111_drv.c                 |  4 +---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c   |  4 +---
 drivers/gpu/drm/arm/malidp_drv.c                  |  4 +---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c         | 13 +------------
 drivers/gpu/drm/kmb/kmb_drv.c                     | 12 ++----------
 drivers/gpu/drm/sun4i/sun4i_drv.c                 |  4 +---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c               |  4 +---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c           |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                     |  2 +-
 11 files changed, 14 insertions(+), 76 deletions(-)

--
2.34.1
