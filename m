Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36865371D13
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380275; cv=none; b=F1pqAm6MLaK/MxetB2ITN/ze9Vh2oVPyUi3MjoEAi5UxZv+ohhD0Ly0zfY4ym4yeWcIBP8AN3/XHGCIgs4vOY919lZvWJiWuLgp/0GDpA0r1gVwUbmJOcuKAI1BfTSiBMgPpbOxow+xVKe0ZyLbqOBwutrA2ma3TQEPvRjQ7GaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380275; c=relaxed/simple;
	bh=R1ZISnQUY7zQ0PZsmMFsY+x1oAPmIiEBps5u+ab7lTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCLSif6sscYjhQOh4/GnKJ+JN32V5IA4MHGSJw5ZqdoxxyeW6bbWCiiOh2mIeMRFs8nliC8rYRdOll7xOfmn5ctnTPF2wMQKKULNw1L6zuv29vMPPC+P7Kfm45cZbSftqEr4L5IAQ6Fh19n8Iws4NJ4Ms8nowVAzje77L8wOmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZxmMMjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dghMo1r3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZxmMMjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dghMo1r3"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHKx02797345
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8JDjRVYqzUw
	0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=; b=EZxmMMjjSUe4iDpYendft8KMQIW
	QkTF2YwCjO/T+sAA0lM05BjucwS8gz5p8R9Y3XJ8dt3UKkChO5FXcmzEgXUYh5LV
	0eUM6KrEuBBs5kxP0uzF9gj5GfWUkp6aC6hqAqGb4Rt++R/dXixxZqPa/dj3gjgG
	VIondF8saW5VVamYQkiL3C+emxDxq886FpIUTmNoJIWi8eb7UMiAGOZ2JQ+QMhfO
	/oD7yrZ9fucXcKp59nfpx2XTZ4N06MhaW5AEiuqcHir5eQFTJnqvpTT9lAiTGR8C
	8XHq+Nb3SFVzm1xP/WolzePIlW8KkPNlVss4gLm+VQ3dA98z+xxFZHo6Lww==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9qd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2287038a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380272; x=1788985072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=;
        b=dghMo1r3uXkFcHT2m4ASfpavbTbW1VIoO9P8my4YG1651Sgq5l3jR3Q2iPJYVjH2/8
         JYpboys2vs+Bt1sb9l5KdaRzB071vA6bdJf/QURGXpAfKB/B6OjGmhWo5QLkkoquG2SB
         +qXtYKdjdQZ+HZ58SKMR5CzH5XfwhzU+bgzZRMM/87TwN6LY80ip9x3NI975VTjAW3xs
         mxsXcnjAu+z/7VEjSBfAk9ooqwiIT+iuNN/F3egXwBCAOCQeoaMGrrph4yB77FuH6N5p
         8oYgiCKf0znzufmSN4ImVkjAgjef+NCxt/LkXUkUyqb9yLDqTkcADfVm/BZyyxrwI2e6
         7Glw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380272; x=1788985072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=;
        b=Eh6dKBKKgnteIFVsieUbg9AS1LgjV50bBmiC25h4taLxeCPk/zZvjnXswdoAHWa0bU
         zeDHPeknoceQ0mZNjVLpXfyyRTMBoFMLK9rxqzy5srP7lPsQFw+satlrMUTlvtMvWEzM
         iarMkvUDufdFKkwj8tTrBaBaQZToxa8l5QgGjdbU2u3+/SKXKpVVfCImQ1sjHJ4RxFK0
         qnUgB1bv/JV8GiJFPQzn+yz0zM1CGaKwtByZR70WaWmfzxRhpuP5vuOWlXESmMrqODqk
         ClcgWVRrVOxIXSQQRmFFZifA1ZRKt1g+lc3QfVqED8brzgTA6k3zGx44gR/nKQQe2iog
         1K4A==
X-Forwarded-Encrypted: i=1; AKwUvBw8hGRoMKzQ+Sl4xCGGu1Z+UjNNVXTysc/CYTZx4/Qm95sDoJBpXeEFYhpM06iwkttcK8oI7Sr2vcj37A==@lists.linux.dev
X-Gm-Message-State: AFuF++lS1N7RaEtGUTyBPqUdDwHgy3Q314sDsNx5I5Qbnz6SYfqxEmzn
	8FUIDtXy3HjW0b/C4gOJKUTA+pNi1Ci1g4LPHJ7X2vlDL3E6KxnUdW1rrI/wB8ayoOXZcEUWTJb
	waDKLQ7DVeHHq/WDRecKJwOeoi79Fl06FKdST4LWZ5JhJxb+wi7ryFvivj/qsgT8cSw==
X-Gm-Gg: AYBFou0bGE58Ya/lGxl0ug4i+3+71q3zkzakRcl10HrG9OnahLJibvR9D341ao8jE4r
	mItTMjStcDCoICHoXDTJo1nwp6f2qHBBYAoSIZjKndWS4sBWxYl/Hby5oLoLRdfu15ZyUR6oIFm
	6FPgK8G2GBqSS2fZGv9rDeyQPSxmnJBxXiiDRbCizNXgyDaxtQ2MIB4SS04LJvHFVZJcVqC2QR2
	o4yAiI3elP9GgrO8eR/O+t/bjIFFA3Av0s48acy2SuEY2OcxYpodRUbg2N7YeQIZqS58pd4+5QM
	1UDBr7SwWG3A07pdMX7/J1r54o4SE1hwkEfgafCxLtGhrCugxdO3+qnJyDVdf7yT+b+ROEMHRSo
	H9tOuYCZCQ82ghKRCAQ6OF/AMVig=
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr11025919637.1.1788380271455;
        Wed, 02 Sep 2026 13:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr11025843637.1.1788380270956;
        Wed, 02 Sep 2026 13:17:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:50 -0700 (PDT)
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
Subject: [PATCH v2 7/11] drm: kmb: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:36 +0530
Message-ID: <20260902201640.2024648-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rTzEp_WiMMkh4kQcGuuwSeMkKsrC_1dC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5fqKdK+nfNSN
 c3MGYKVi1eD6t7h86bDQMR/SfGhM1/ZpeivK+6OakILxwE/lGR2T5LzY2z1bK6DdcMlkH7Pdta1
 FEtqWVZi/lPlK8zd1pfhpDuun41QTG0qCruffxHrtDbqzUJ/8IYuKWJ5J8Yzt5dYt43uEMDQG18
 pdnEed8r07og7E36r4455vUENEn4Bsn4gh73+pEU2SWppI4KnKBjBUPIgeRBmqjLJXgbh7HpslV
 KYxY+Eg3yYYAzfOO4stSi3WASQ/LEJwkRDgLjKdbz2yi212XnK2TPnNE2NCBZiyG8GYCP6XKONP
 1xZ3x+bEFbekKPTyHx73T96ljK2TbfyMank4LuZDUZ75d6aqRWQ3iYkUKEVUqWZsA2YxKDV4fW1
 ThdseDGgeo+y5BBeckzUVt4oWKnkwg3FIbzGYuG4382GMNJWuDwK5jXNTrH6F27XEu2msbzE+p5
 Sn2OdleLv7YWLsCbOtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX3ZonK2AXbCi8
 SuOQLtzC3mMpanVkbOQ275VmIRMXUL+wSudAWZ/iY0mIioF9SGA+tzlKn3dhru8ZWqVJNln4BGH
 T4oh4ifXUD2U/DCuca93u1v+3r+8P5c=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988470 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WgoW8aVLYYFOpEymBdMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: rTzEp_WiMMkh4kQcGuuwSeMkKsrC_1dC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.
Also simplify the IRQ error path since the release before init was a no-op.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..88fe377940f3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -140,13 +140,12 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	/* Allocate LCD interrupt resources */
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
-		ret = irq_lcd;
 		drm_err(&kmb->drm, "irq_lcd not found");
-		goto setup_fail;
+		return irq_lcd;
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -155,11 +154,6 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	kmb->irq_lcd = irq_lcd;
 
 	return 0;
-
- setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
-	return ret;
 }
 
 static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
@@ -465,8 +459,6 @@ static void kmb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
-	of_reserved_mem_device_release(drm->dev);
-
 	/* Release clks */
 	kmb_display_clk_disable(kmb);
 
-- 
2.55.0

