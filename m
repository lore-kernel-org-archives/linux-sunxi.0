Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400593E314A
	for <linux-sunxi@lists.linux.dev>; Wed,  2 Sep 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379676; cv=none; b=al/qkcDc2G2WYZnqf9Z2ZN9SuTsExdjWpLZGqqjngbXkd08lZNJNVjr/DBdPRCuuUikxV31j5S1n6OCIcbuPcEYWheN4STcs+qqP6tdMd2CO7feRiJkgEpY2e1bRfcvepl3cwZkK3UogwHYhm3FFf6GC5QpDbPrITLUGTTO+o2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379676; c=relaxed/simple;
	bh=QGQ6whxqf+OX3FYh6lKdjsPxftUzslebmpalWNd/V/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0dz6t3NhKn7hpCgAqGcREk8gcFFWNdR4JnE9FH2AwFHMuBWpL0fx9HPQEoC7xCWWaxfqvXnYuhr0LNlB12vxpABR/h5Iy/jcxr6fEFC0976kwsVxGCac5f7OeU1gaOI3lCImtIAuoxf2g11VF1+oqlPpeDVFEPrvbAuNbN4QjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RkLi7WnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bSYTWB+r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RkLi7WnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bSYTWB+r"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hr8oS3378618
	for <linux-sunxi@lists.linux.dev>; Wed, 2 Sep 2026 20:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nNFPGVLFvx/
	AoejV7EuP46spvaHGIWdJXEE92/o9lnU=; b=RkLi7WnJT32eVWIHPuqGyOBqrKx
	lRcdCPBgHIjmgPf3yvBqtGbaQixnj6ftcYW0RJFHwL1GxlPgt8fDs7l5XahvDSXv
	GBzLzbnu6xQhFr9WEDKDxSv5ov5rp0a2WbO3TpWzXL2SluF/ACdKwDJ//vR0sczS
	dlp7itw01lxD0F0CYFvVxThG3wBhuSnbxhVD3HCV9DzZZwH9kFX9l0w2JiCQUvOh
	9B5OowQg2lXl+5sIheMW/+4e3m8E4zXF/O5piBworS15amrwo81Cl99TqwmFfXPT
	UxdW7ISqBefM7BMGUp2qga0M4hsnsK05gBLNm3AWfehEX8FVad/Q6GKSY9A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrnhfxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 20:07:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d55d8cd938so25688955ad.1
        for <linux-sunxi@lists.linux.dev>; Wed, 02 Sep 2026 13:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788379674; x=1788984474; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=bSYTWB+rblEuLKsmmWV+GaX1eHfoUb6cyZJXArqsGk9C66+T94BQ94RnYGOqLPiHfd
         6fhmAdWAHzguJspOIxU+eos9Kq/d2XHMLQ1S6RVH1uJhL1hk6UR3T3IsjihhoS6KeK1w
         2KujLOdiyL1PoQKFm8ad/G20CmB1YFMhg8cmdBMWYj1WxiMsdFFDsN5KFR5CCylZu9IK
         fRIKsYEaQy9hiivjRRBLd+Al0/I0MJfiMniJ0f+BRgh6C0EKvRUEKW4yO974HaOBZ1LK
         npRgtyzG3dUoiEC7XLxqvWwAcq5cCYlp5eHqJz3oPNNkirf2rgDg2odaOBEDN1vcSuCI
         2GRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788379674; x=1788984474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nNFPGVLFvx/AoejV7EuP46spvaHGIWdJXEE92/o9lnU=;
        b=kGLyu76Tgc9p2uQYLWAP6VDHw5QusNlkhR+o2V4rdaz+PFQah2rHsz37keeRIL4nfT
         ey9JdQAUGV+CCojbst7zdpZTfnkhCIWlxvRghY7SiDdhI8oy9A58VZyvGYplzY0hzLJD
         Xp4QJZMvdiC0xFAgmbZxHT+coeeUW4XL95mLAT140i1uamjAXk5sdfBpEkT71LC8RY6a
         NIsg0erg9+scEkrwH9jOO9AJeE7QgS+ovMwitx7/3UHEpcDrfiWImxuUlnRMpogra4gh
         C+TJpzLPNlqSEUfSd3CK5BDuucSytnf0KRMlYRrgT5Mj0utpgt42r8VDM15hO4ymlibv
         nQUw==
X-Forwarded-Encrypted: i=1; AKwUvBwxMJ9Ht1fkP0JQJrX167thURaA9H+lDniPxohBLTYEAstX0PU6AixGTPocU+RS3a5YnvkmLHF9/4T87w==@lists.linux.dev
X-Gm-Message-State: AFuF++mOchmjaI4z8mOKNNov0DoRzbcZqhsW7zKCHUpQd3ZHB2geTfEe
	JVoVtEWPK8y/oW9MakqkrB1sl3/8dUvxqtAztdMKGoFt9Q70ryu1Wr8VSdSrupsR+6iAkBl6zHh
	awBKbMQZaRtP41UcjfAZX+0wATKeeFLgCNE9Fgf6xsxXT4Xh/IK6VJpqgiGn2603l7A==
X-Gm-Gg: AYBFou1KnL59NAYui5mmqU9zOGIg2MVkJy0eglZjVOf2Gfl8u3pgZJ6+pxMeiI1hLcI
	J4OJEA0085fOji0dOx/z0ABqLDNbwxu89QE8n97yZa9vKpScdK/QXOEfjsUiXxjvDoadgnDGllz
	PYlOZ2BvfyYfAoJJ6C8Nvug6d+KeI2FyzoY//VHyJwD31h7pJtGvZhmAAS9s9wglOTG0nIBZopO
	sNbFkTpef3TdaXhw2+8/P2YcgAc6LGuMfe00udSKemvbTf+1QsraD9Of+vUZ3FGR0kXcIla4hIR
	E3+eghufzkjpg2pQBUTB0Ji/2UMP3QjieHi7ATqVPtdjSclzW7F3oQgADJEJUXh9gQy1uRNkFPS
	vau4yvGTYLQGFT7ghFLdnjU59gkg=
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99505855ad.19.1788379673808;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
X-Received: by 2002:a17:903:1a30:b0:2d9:2688:8be6 with SMTP id d9443c01a7336-2daec71ddddmr99504475ad.19.1788379673206;
        Wed, 02 Sep 2026 13:07:53 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33255f2981dsm434360eec.19.2026.09.02.13.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:07:52 -0700 (PDT)
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
Subject: [PATCH v2 3/6] media: nuvoton: npcm-video: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:37:00 +0530
Message-ID: <20260902200703.2016410-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902200703.2016410-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iqDOZdbpEeguWgxr9RNyAYPBcqcdE-wt
X-Proofpoint-ORIG-GUID: iqDOZdbpEeguWgxr9RNyAYPBcqcdE-wt
X-Authority-Analysis: v=2.4 cv=YKuvDxGx c=1 sm=1 tr=0 ts=6a98821a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=iFm4xv_JmjgOdRhw77YA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX0kjJc47P8qkC
 BQJ4ohPER5Zd+1T4LDZXufSiKcF8icwN69EaT2en0vjjErwu8CHtPcJWeUSuhANMUkKpy/7wDfV
 DAw4ZI5aVM1+klUuHQjIAnACX2m7u9ypCVmEmql7MDbWve5uHXLyQTn9I5eshjAa8REautR0Xq7
 PUnjQorCZWflavwNBinEN4VOBBCMcrJMSm3zZPOFSWSHEkLmtaHMBPrezGK0N+x/q6zuT0dhivx
 rETwXjhRnggfODUQRO6paMod5fTLsnIMZt6jl6DusBbQ9eXsbdFxOBt1mfwPPDhKW9KF0qWnQmK
 stKv1uJSnj1cbKRgj6ztfNaMZpuaYWuTiW6Kw/hoVn9OfLBm4bfQauhVXdl3iHXC5N9eQxb2E9D
 8di9V/tCV1wR5JHNAJkXuCO+xnHUzbsLM2VLpHzOyIbxbJx5ZNWxoGoNJG95dRUkgPOJCnWs49G
 4L1BNmWLIFyjNMKFS6w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OCBTYWx0ZWRfX8vws4xtLIgEa
 a+WN7vVGN9cL+owLGxPg5+PqbrA38yOfvfZyZgXqRSc7b2nwHvHD5SXyMVjCq/GSWE3dNSP+7ek
 zlBhoN/5jHIzrI9Kvbu2DYaO0GoUQAY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020178

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the four explicit of_reserved_mem_device_release() calls and
collapse the now-empty err_release_mem label into err_free.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/media/platform/nuvoton/npcm-video.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index 52505af35c08..6786736c8f07 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1715,17 +1715,15 @@ static int npcm_video_init(struct npcm_video *video)
 		return rc;
 	}
 
-	of_reserved_mem_device_init(dev);
+	devm_of_reserved_mem_device_init(dev);
 	rc = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
 	if (rc) {
 		dev_err(dev, "Failed to set DMA mask\n");
-		of_reserved_mem_device_release(dev);
 		return rc;
 	}
 
 	rc = npcm_video_ece_init(video);
 	if (rc) {
-		of_reserved_mem_device_release(dev);
 		dev_err(dev, "Failed to initialize ECE\n");
 		return rc;
 	}
@@ -1789,13 +1787,11 @@ static int npcm_video_probe(struct platform_device *pdev)
 
 	rc = npcm_video_setup_video(video);
 	if (rc)
-		goto err_release_mem;
+		goto err_free;
 
 	dev_info(video->dev, "NPCM video driver probed\n");
 	return 0;
 
-err_release_mem:
-	of_reserved_mem_device_release(&pdev->dev);
 err_free:
 	kfree(video);
 	return rc;
@@ -1814,7 +1810,6 @@ static void npcm_video_remove(struct platform_device *pdev)
 	if (video->ece.enable)
 		npcm_video_ece_stop(video);
 	kfree(video);
-	of_reserved_mem_device_release(dev);
 }
 
 static const struct of_device_id npcm_video_match[] = {
-- 
2.55.0

