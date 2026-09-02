Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CF0377006
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380234; cv=none; b=ndSsLH+X12FsqEw9UCGw89tszI/XqSJNSnPf0T66nby1ARk4OpZ4VCclZJudxz//T5cqFoYb3r0txfKMAgzmleZTnAHUc6BOX5HtwgU3RdQXK7p4alHRzQyar4WpRjZ2UrdVmuceUIycLzojF1r1Bfd6Uvb9VzrZ5oZQMI5C+u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380234; c=relaxed/simple;
	bh=X2JKT1rUwXBxTwGr+cj85lMsd/xn6QXY90i0q/UqNeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZbBROlt3uDtw1TfAAGPp7Jr14Mcc4/JdYnwW5qCCV19IWinowkF0bz9Bz39UM9Rjq2rJqajMiShIKh3ChCtnX20ISU0hPCtca1QtmW1PhMQ1nC5qPXsSFBhz9D4NvbLrc1n3EpAY6aarCC2igtxQNE5r4vWLDIpoRtDq+Mr5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YH71TVQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8XIVun0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YH71TVQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G8XIVun0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH9CT2523712
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5pBRbhbzo1P
	cOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=; b=YH71TVQXwSMcn3Fu/Uff9SK4nzC
	54IULE63yNKCuMTPEd49MGBUR9KKNNIN/QVTquPXtzIjMppcDurhMW02H3mw/HoK
	QpIWWpHShP1aC26/5Elx8gXqpOsaRWjvdKkLXCUSyLf1mZfjfZiZSS4H+mV1c8Id
	88ruhQ6RqKJIryjdqDsY4tS8gLQX3HTIOvazfZQQPjxVQiBY+Ozb/umbSbvelZan
	fwT6i3hl7FkpHSIJoP7vd8T9SpNtUG5AcXWPwBduK7YLtF34TKGVzNjoOtZ3ZMdN
	eB2EhtinE7Jy1HoAhoeMJRx0yJorifYNZ8msk5ykeSvB8lt2qUSCYqN0DjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4jd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:17:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1870919a91.2
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380231; x=1788985031; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=;
        b=G8XIVun0rojDr4ciPFi1KrtSUhTz8VygQYVP5swdD2sn7WznIZzGSMgXXlOE5kEt2w
         NFUF6xESb2FVmdEJRnRxjYn3mtgLuUkx6p3vh6Q1GnrlPs+Hkpd6cBuR0kkfyBfZh0nV
         xMWyeO5eVw6bqXMCdDUjOvmxzjchBxiOmVsQiJC4Bz1ekdJ6/hitXhTybGuSjBT4Kfqs
         8U2qjnoGwXoX5Y2bidgfu4KTvy4IfZLYYaLJgcfjNxI9wwnAWy7/iLgdRJHwrdmL7KFl
         aRLB3yd8fKKtatOQyfFiCH2WdfwtHD0AREDu1KjhBUvGE5GknMEet5FgwCoH1Sb8g3HZ
         Avuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380231; x=1788985031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=;
        b=gYKIeELkT8s1XCbw3LPFkn5RrvU4Z7xCtalvcmpyvQijakSKX410lENrzU5V37/6aB
         ukN+ru84KceGApCPs8Qc+bQ1bDzVKgqcjOWKCMBHX7XKMAqGwruwjy8DmBTrYAixWSYu
         dIU5XdLH0WrJTmcCm17Jl4GJd8BXkYkLfu7TkM2YzC59lA8ahve2f76dFIcCdxkmw6/X
         yCZjH6+rfzG5Ln9nLtjSnBfhgV85K8wr2TnxzoGXwdoY0s8WFOe7aMfhaFnnMHehNvqb
         3PZ42dHBLJqP9sVsn5J/JvorMGRMOx0etLWp4+jXjddn+2fl6dGIn6+gm6+4mBmqPwRX
         pGxA==
X-Forwarded-Encrypted: i=1; AKwUvBzZmRmqZJlji5Rv4GIqvQUAYjRXTFahJyx1WEY64Oul5kPhevDmxzn6Y9isdfxVudBVw3v6N7jIi3HxSA==@lists.linux.dev
X-Gm-Message-State: AFuF++mMN5WwIhs4oLBK3PPmtZ5fwuEWTXE+IPmmu7E1I9NksiLwmvEC
	NQdyLx6uryOok34zdGVY2ruVqwCbRbnp4GCsClx2Iemp/iOZMAj8QRifSkyUE2U/BBBUfWtU8Pk
	7ZxZ79WBOiBwzNTkw4ekmxGFwh0YKe9vI/nZ+pC0/gNkbbR97JsZkbalN4c+b6U7w+w==
X-Gm-Gg: AYBFou1uHbwSso2YAEGtHPSz0dz7Y09xPoMQEx2whvV097PrYOCUuPjhk8ExEBqonal
	JdrbESu0G912SZRfgIyV1e4JJvSrfGdyRP1jHPPN/VL8OQP7f87M/hCgpAiZjU3YX7bafwKJCQs
	NVnbfxdawxfb8SaG+tHjyqRFCZ9W+G+p+8GresZc6+9Wlzi0eOC9GONOFqWZnE684ShvZ2DLiMm
	Ws38+ePFkGw0SsdDouUSJ9d3YQAR2mjQ0WGodWxCweM+q0LUEKe2dju2IKvPOP1ctfYqkwoRVZu
	XQP0m4deQ7FuOwUZbY+/3FMMdGKY+EUIAVljrSjZuKl2HaLGLLSl9u1uXuXAmh8g7/ZucKmLjCj
	dRELwS7CKRI3ceCBV1lAtpfn7GHI=
X-Received: by 2002:a17:90b:2785:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39aedeb83e0mr11608247a91.5.1788380230713;
        Wed, 02 Sep 2026 13:17:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39aedeb83e0mr11607901a91.5.1788380228811;
        Wed, 02 Sep 2026 13:17:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:08 -0700 (PDT)
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
Subject: [PATCH v2 2/11] drm: hdlcd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:31 +0530
Message-ID: <20260902201640.2024648-3-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a988447 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=zu8Q1U5i7KxegdXecekA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: clc_g9niKQSrOWZWUTiDofCqkWQXWOGi
X-Proofpoint-ORIG-GUID: clc_g9niKQSrOWZWUTiDofCqkWQXWOGi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX98dfECxAXmBB
 ymKoZyuliBBm25za6Fi5C0uerfeoG6miWPsE94QT7+7u8UDRYcCPjxgu0NfSH25+pCYSCEwcIjH
 BVWBCxhV8fPJwG20scaG8ZlzVSIff7Kwo4vzFefjhyNtE8PBg8IUzqubpEaLbEMHDa8UVZhMovB
 f8nZnAnrZ/0dfrKWfOR/VyUXtoACtDqYeQwZbzrosf0GD/q8UOKxiRddEy3WI5cBvboGl0cZx8J
 Lwog+3A+q+y+7aHWFNLjPhB+zyn8URVpqqP8iw3E23wchRS8vfNr3+SNxSEUq/ZcOy58t208/sZ
 WyLNLdnUbgmY3ETw7vYWRqy5fHJoS/CPU1Woc51G1vQA6hEQcVDxP/rTBunAEgVMVyxvTQxYrkB
 uhCMHjgBsOuu25GHZy65xEPkryzLNGjsmYZjCqd566NI1iE4xlpZTgTn+6QCKDr64Oyv4yfernl
 K01T/X3KXZM0/s8Ai4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX4b3NH836k/7I
 MR3Esh8lR1vkgLbaw3ClN8goRM34e0oqZ3wFsMiqpPkztMtkWYenRqK0Uv9uy2pSkzS25fmkEiA
 xOQI1hVDHSIqj4Enw2TTSjAYzqrpf0M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Remove the three explicit of_reserved_mem_device_release() calls in
the setup_fail error path, the bind error path, and hdlcd_drm_unbind().

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 81d45f2dd6a7..67466fd441d5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -134,7 +134,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		version & HDLCD_VERSION_MINOR_MASK);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -164,8 +164,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 irq_fail:
 	drm_crtc_cleanup(&hdlcd->crtc);
 setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
 	return ret;
 }
 
@@ -316,7 +314,6 @@ static int hdlcd_drm_bind(struct device *dev)
 	of_node_put(hdlcd->crtc.port);
 	hdlcd->crtc.port = NULL;
 	hdlcd_irq_uninstall(hdlcd);
-	of_reserved_mem_device_release(drm->dev);
 err_free:
 	dev_set_drvdata(dev, NULL);
 	return ret;
@@ -338,7 +335,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-	of_reserved_mem_device_release(dev);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.55.0

