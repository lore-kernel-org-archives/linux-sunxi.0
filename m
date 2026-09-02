Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C66330D4C
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379647; cv=none; b=Vnxic3BWYmE7hoI16jedoo7D9rvVJko0XfWQ2kOjTF3KnpClfzF5AoQAai0jc/k7kngu/6RtxT3dSB4AbnxfnbddIl40uzgD+6o2GYCqkXiao7Wgo/eedasLcCVZMUGGNDsQBlEkMw88xhxyTSaZNDVcQTkcJxObOE60kM7fXTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379647; c=relaxed/simple;
	bh=+JRsAXUkPd/zCxfFhAsZWhnWtV5dxWny5nzrwbSSkXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UZSDb9DLyB9ZFwBEbVI3cBaR1PFVuWBwW6dQ5opelKfqsFaVksJjSk0JbqThGsICImNjDoWBXN6x4Goync/eNP83SNpFZ+IOm6smsT1p+uT9pB5gPVut/WYGmL1HpzYNHwAb+UmvnCaA1SPzfhvnK3GoDg1TA8ZY/0iCcmGrnyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o8qTZHJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dyg9UUqa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o8qTZHJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dyg9UUqa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682HsPxv2485892
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOgl
	gLUq3iAA=; b=o8qTZHJ9wPF3L6nko83fbw4RSA3+laqGNZFT6uDbpl+YVhbI4Bh
	AiRHxzRb6pGr6xp1CtxCYePGu78jL9tipjO+GqINkNKz9aKmqQETyzIoUWGhomIb
	iHj2NQn7DXHMQGBwbiTG3w8x6S+gXIGWDSIGmvst6TY1qfC9HSx2tamypr9XuoZ4
	uxtI+2HSG/JmVkElTyVouC3zK8UcSsL79XGYNVGgsHptK9GY2nADRzhKHoajUrxa
	+OkIh/NIGe1kQa57LP0JOI/jkm6d3OdjCGYpl6KGAT0xozaNsl2RXZKAkvZlr6Op
	jeOzEpXx21MYBqscJHxbUbwqhNyliYP0sag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9p6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:07:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1951903a91.3
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379643; x=1788984443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=Dyg9UUqaaPjIUta4M9/FGNg/RSIiRE/aTC7fIne2hzpn281DLafzc8h1ADpOi+JhWx
         K9ArAue1114A5igHI1fvfQGOUGegKDXU0z9N9RmdUkdHlvQYcwrt86rWvrxpWFEz3j+2
         xCZx4KWPqnA0plLfcTEYpfr7z/oRuYXwHCciH06Vfe/80VhUcfIIFXFnaF2xBZ2arSEN
         +mMfj6GReYWeU/NDKtZU1FLEIWOr0XPix5vYF4ekWQsds/ZRFL48l7UFEOkoZdPi09VG
         VthGibORae0xNCa6/i03/j0oD69sL7RoD0lOTB20AzVaCnhFMrqMUlUTfGq+tGhJ+HXO
         /XDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379643; x=1788984443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoRunoHQ0ZfKUnR/gnkdF5veRCY4NTnXOglgLUq3iAA=;
        b=qv09wLONbSjfE3hAOoPGcE46KXtPGPz4uiWRHjYO0DVL4xCldca+3YVbshWE0kh41F
         cwCP50zGlD3qKvXeCtKnQdqv7UCWvqyEJr5Dt1ZXgtycFhosROWjPq5bPjDtwlWrQ66j
         kJk0Uhv3o8y9KlXRMMfVYX5O2D3hP2w9JDL8TbCVWOFnOUu2udaBqKTuGIhwb642kHD8
         yDdcveZKBcHnPdGbsHkJ/QgUCiOHSfFN/tNq40In1v84ge/ma9e5WYj5OPdBbaX/cmC0
         QrLaNfMoVPNFpm31K/1PgE28NxBZDBnPBm5NKZDMULO5sua/m4v093j7xtE4pGQWNRwM
         R4pw==
X-Forwarded-Encrypted: i=1; AKwUvByiihlsInos1sh8Kfliehgzo87vGdoOc+aQYhdqG2IYs72hlDLhx9g/428QkWsl1Mt3JKensEji1c/k8g==@lists.linux.dev
X-Gm-Message-State: AFuF++lfpEBHPAcCTFvs139b0TBZr9qqZT31PBC4M/wIPUhOkvhOPr7h
	BceX4D9D7xVyDPY2pN0GIEpUeABECSIB/g2AiJ2/znoa7KB8PsrUTQa9MbyH9dbHsAtdPwvkY92
	L7JdKISiAq7QiDlUEEa9jZ86o7l0QMsZjYweq0vzBWRUv68dCEgz21Mfc0cijrlGHqw==
X-Gm-Gg: AYBFou0SJSJyig9K977MaqX96al6f2REndNRxCdh5MUljgPjino7/A1AJxUGtPo1jMt
	Bn+xzB6nCKuUlLAOMAfTKkPLl4zVciQ2X3EfC/6bmBlZSxWblPsBmCvv7mo/rU6iaN3mednF7st
	nFIMLMIyxVZdRxHGqLoXpcyJTi/p7BMSdPoqIqJboU2TnlVFYkHxwczk2kWQZzI744aRTLVJ0Q3
	8u3iqJro+etV7y7t6tFxLw/FVJ2cGPr/Iyvf/snHuTVWpOSZhaP5uCG3Ayg42gPm36q4RcInI9b
	saxFELd4lFwfITQxh8WPPjnGbaP60sQnhLBMkjWXoTrIODbC9TJiDEVDcTZpXkqW0M7aZFoTpwY
	2E7Bh+0Q9wKRInkhUZnWFGxa8PEc=
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604313a91.4.1788379643365;
        Wed, 02 Sep 2026 13:07:23 -0700 (PDT)
X-Received: by 2002:a17:90a:cf88:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39aee9b4d19mr8604229a91.4.1788379642783;
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:22 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 0/6] media: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:36:57 +0530
Message-ID: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 97OpdADkYOaYzt4kM7g6ld5jV6UeePlX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX2grhiFEKLDyV
 e1g/BQ2dhQUYCdnFwKHvRoB3o8NUPqeewJ4a/Sr3lWtn33fM61oaeLBhRqKyRnlBmKg7yxjPmsy
 Bq0cjwRyEBJG5Sryc4Kxuktkr+OReFuhI68Iubc0FpK4GZtxfXh/Ae+gQMESPtsQnuDQhAXtNQm
 X4qPSSu/7Px+Gd/sQJLYuQDydriXBM5rGLQGxYtC6Cdn6M4ZB0lGLWKrtTneXBY5rUkXtBk1S4n
 7x1JlnTKNr3lauilZS0Y8sL3ko1YJwaMMk9ARIbqORi8QlBpwMPtbBsjBpXmh2ZxPKd53V6nuU+
 lBpsmpVNfJl3WmhC3am9x6v0FYwCxMbRw9lx7bNV7tjjRNpRHJlZ+BZGwTJ3tvzf7UwRBSG8Xdh
 a4RqCG8ANBPV35tYyVI0ce/Jiq3eCj8DmyEpjRbMTaFKPpBekw6mEEnu2QSPnhF4hYoV16DBfxH
 Dw+kW13FxpUx/2fiKzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfXwJzz5CgGDQCS
 bJ99koSC0iOxCX9WDIavgRZBPDAEN/upT+BBJSMKPolPIFPlkjpYvg682RLe1tmBCCgiFsk4oIy
 Rt9Dy/cdvLdnsJ+ZpaC8tJ5zYoyRoDU=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a9881fc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5ojLyFQZJBwMi_iZTBgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 97OpdADkYOaYzt4kM7g6ld5jV6UeePlX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Several media drivers manually manage reserved memory lifetime by calling
of_reserved_mem_device_init() in probe and of_reserved_mem_device_release()
in remove. Drivers that fail to release on every error path between the two
calls leak the reserved memory region until the driver is unloaded.

devm_of_reserved_mem_device_init() was recently introduced to tie the
release to the device's devres lifetime automatically. Convert the affected
media drivers to use it, removing the manual release calls and any wrapper
devres actions.

Changes since v1: https://lore.kernel.org/lkml/20260703193855.110619-2-mukesh.ojha@oss.qualcomm.com/
 - Carried R-b tag if any.
 - Rebased it.

Mukesh Ojha (6):
  media: synopsys: hdmirx: Use devm_of_reserved_mem_device_init()
  media: aspeed: Use devm_of_reserved_mem_device_init()
  media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
  media: arm: mali-c55: Use devm_of_reserved_mem_device_init()
  media: mediatek: vpu: Use devm_of_reserved_mem_device_init()
  staging: media: cedrus: Use devm_of_reserved_mem_device_init()

 .../media/platform/arm/mali-c55/mali-c55-core.c  | 12 +++---------
 drivers/media/platform/aspeed/aspeed-video.c     | 12 ++++--------
 drivers/media/platform/mediatek/vpu/mtk_vpu.c    |  3 +--
 drivers/media/platform/nuvoton/npcm-video.c      |  9 ++-------
 .../media/platform/synopsys/hdmirx/snps_hdmirx.c | 16 ++--------------
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c   |  9 ++-------
 6 files changed, 14 insertions(+), 47 deletions(-)

-- 
2.55.0

