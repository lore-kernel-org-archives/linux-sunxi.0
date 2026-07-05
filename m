Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907833A4F55
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280475; cv=none; b=XAMt7VmmQ7Ix+gI3Y75ThgdEc7T6P2xR51HLfxCElGRJJeAyr5/Z769Nyu/ypcCriwn3N67RKD+qQxms+N+LbZXrYSqxTZIxZBzLU6BEjdUuTqnPF+Qg9lCjYIQExvrH5a8JvH4CLpUYHtGBPbam2Ub5LsuPc8/QIxjbpXgcRN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280475; c=relaxed/simple;
	bh=c84j3cN4itWiI6muK0J93G40mdQrPz9ghprJZVQe+x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TwTC0xlhOgQQr7UyvxbfsXgr1/eJRV7xxSLq3a4wdcAIDtVix3kvMu+4rmrIP5CO2Z7I8vqjFpMKleD23ieX7CZI0jaIviWX4ojnQ2ICKHNd0ZHktce1CC70zjAegYLpyTPGwK/h8Fy8s82zWtq3Ql7T2MlA7ADWuHI5VQfa+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ct1DBvNs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFNcA2lD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ct1DBvNs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFNcA2lD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HjO0W2193576
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf83596-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so3254679a12.0
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=WFNcA2lDZ9+PcA4RoSB0MbPItSKx4EFPamzoYIslji59gGvCgJF8JfcS9A1ONQfb1w
         ZLWb1rO2a5cNyyiTT/k0F24tou+concXBGXYbs1GJAXJVu4q5FVJdPYjnz2EgUx3k/Pm
         jXqMBWDf0zRsgHdu75vSJhjdPCG2upadfqSCYcGq5vKXV0cKp3k9NQtjnxffnhkNgXKp
         R8dpnUO+i1PdDyZiEAd/xQVBohbotXUZpGYGOyI0UwPnF7c9ZFnoUnvKxV2vJO/YxcUE
         atAbH2rMVwwiN2zcaw9JbJwQbP9Sce+UxsDhINoYAdv7GvfviIEH6qnzy6r7f3a5Ojoa
         rP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=iwrXaquji6bC0QJuhrgRWncGM4nW04TeMPVGNt00A7jH+Ay045btnk9kLOs1xbUHj4
         4WXUJ7AAfLdWDYTRHOpHEdFfAquxQ9i6CmZt9YpnN1ta+Y/8C3pVAfz2p6aphUAmG6Vi
         8kErYRJ9/MeErTCo7EP0JjaufhEW1NvH7nP/ehb2iTVlreazcd0keusp927FKafwoNWa
         rE6UmvdESLcm/3/l4EEadlRTAzkDC2toZh7JCKkFMxzYT8Qok3LGmcuoNYrXchIs9lZm
         zhpxjSL3eGjEuS5qr+wtabWMMxMyCLX/P0zSjdn63gHC9Z9AITsXsyeb0iC/1WyLdbng
         7ryA==
X-Forwarded-Encrypted: i=1; AHgh+Rro+k7Ak5guef8rdbv3tjE8OOeuHyVoTZJlB3IJjU0B6yWr+DAoBg5kl0bRjtJtDUDu6fE+fOdvrPJa/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDtXWreA//cCYoaXjWPtrHXa6IJ6iki0l/qkR994GacfYRx7to
	87U60cXzakBGYD1UDSRAfz3h48jC4X80k678lTipcmaRsGeKVZdkhMkWZbDttpnR+11M9aZa0PY
	gkBbtFygdtjTtPX5ycY8n3jcRP+Zq+351Nejko2Mf+w0lO8OBuo+QZKWriloZeI5pAw==
X-Gm-Gg: AfdE7cmcWbE9GVUXKVvgkqpZzY4fkwa7FpBcg1D5VfMWdFAIr7VKIltzZheTTDUDBi8
	KXQNW/czxlo8jTL4IRVmu0rTPxyxvpcvMoA/eJmbX5oGr9Oznr1S1mNj/q2zqamBFgEd0mYUqFI
	4OwSRAQZjazgUuTQ0hNaA0SVWWZW1Y8KTeD229f9G+WyS0Ltix6jeyj4P8TaCgIPpUCNNtFzFPl
	c8i4noDFzFj1DyGOaKS7zC+7ZqUzUEvbkyvhWvLkLtjaR1gfJ6XYNibFhjyzG/4OK/3lJ+/0kPm
	E7k5RvZAspqczA8yMBV/AOUjBVToqjryPE8ls4V/yuYxPAqJ02depuzepzcqjKr5tFBye7o4DCY
	sARI+SW1lnxPhZ6hDTX67+9F0eKXtwK/3NCIDfQ==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605454637.10.1783280471653;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Kxho9RF3YnRnNLa_DzOdrD6MDnjNSQuz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8DIBpTBLoUrn
 kIQBxQSS9BJng9iQV4jb1GL9+9mG64pxOIvOY0OiRqWlyBhuFM50kholQczTcUcYhXNV4SCr1ks
 90h7GUZrIW78LelT2UY/ULObVmge4zw=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Kxho9RF3YnRnNLa_DzOdrD6MDnjNSQuz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxTU69zvhm3hi
 7/niqp2DexUcHnGvaBZdl84UrN5wRjm/o6OdcgSBdHAejNWmFEHm1Ke6S9oOVBUvKjQ+HbRXTXK
 x/cwKO0OZJPMOemFCZpBncNySlXGN8saUphxhOXFc0Rd/NMDFJCgfKKx//Qs3cyoo9fuJq5fM4/
 Qd9CS5+4R4vxseFjtAEftMHYAQ+7/Q/isQuBSZg1gIE+jGKsYVxRktz4l1FWxeRHOMvAGjuBdw0
 qckQVcD5gUYvle7w5snG52q5UY216caxj7KLWp+yYT6KprfulVn0IAXeWpoRO7f0Zf5RugsP0I/
 2sXSeRoLW2o96W6nPD4tSCdWiatjTb5Klqs+P1Nj/FMwC/+mKK6JVVr23xiVE29X8WNlma6XUVO
 pq1Ut596k90L+hp1R8UHO3RvPnYKnqjTN/ZopsXztgI44OtKP9X0QHHdzjV9Da+3bBFmyVmzVV0
 TsxBj3qS1ZDKfQZALzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0

