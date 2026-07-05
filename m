Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E439F162
	for <linux-sunxi@lists.linux.dev>; Sun,  5 Jul 2026 19:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280462; cv=none; b=r4Ua/H05lJ0XK3Ow4yHuaiVIE9Avc2lqcsnWAD2Y0vSvkjoqj9d+TkBCwXt0EVh5R/NjAav6BDmPwdh4zeXXUPoMT2kB76E7KWvwxyLrvE9zzDdSzxo9O/SnWYsdci3wfVk4MuNqocWg5oK3G9UnLNyBSrgvswKgMs0ier6YI1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280462; c=relaxed/simple;
	bh=v3ifKCsrwDtuvCvlwDYadGM1Uonf2WH1mckdOsVySyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCDohNsk1CBhw85GIsByk7tqasDH+DDydu4ez4BSr3aIbHPXq0cxl5ir9NYLNdUIy9XZfT1BWPyB2sOKRNioHbUhwHSY8JzpPVn5GyWcg/ZcU/w1PtiqRomXd7ocam1Pu+pN5WtoA0fpn8Xas+uAQkzkBwQ5N2l/DSPBgpG/0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hPcw2XE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WTAQXFfN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hPcw2XE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WTAQXFfN"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhtn92314317
	for <linux-sunxi@lists.linux.dev>; Sun, 5 Jul 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8uk9tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so1029545ad.1
        for <linux-sunxi@lists.linux.dev>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=WTAQXFfNq3LUPz1yP02U6FmtKNUZXYwrwaJ9j2nGH9KNEN2ti8yYVqNDTFQhcGaHf0
         W2pmUDuLFDkzxSb6BY4pJiOkdl8iSF5jUkC3UWD+J9Q7GouFC6LKfDHdbZP4q3rH87Tj
         4tEarL+BF3MfXxQGjeKxerbi4B+eoxXRHMpTVuZNjPmZqzt4rxdebdPb4b+T9naJjht7
         k6vkml+OD28B/AJp32iWCeT9FQOIvApq0pvWQt/QxLfOeTIUATZgclVGlWsl/oouN7Bh
         d0xkW9BTwxnrram+hOfWeXHdhTOfMwnVieL6LfUOZUb5bwHnrxgxPjrmEODe4nrmH+ra
         GVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=afWqXOmSMdPKsDq6ZbxiUvLUgi9H/VOhaOiVT5ukF447CU2mkWxsXqsSu8SaK39Kes
         SY/o1WjSOldCcWTyL+VRVWQKguLUCw0w8GqLgegF8ubO0qaBMHNJNpeMA0cImZZ+9voQ
         GSpy2Qmquqv7xyFDZ9uKRd2+h9onE5mtr1lJx8cb349xwtx4t/kIv8E8N/N6VgpFj4W9
         b8gI4CRZrGdDm1LBLmroiqPsDTDZgCV/LIgmanQx/wL65HCKAyifCO4PhXIjUTJrNMYX
         0etW7SByTIyTcb+FbRzt8oQFe5uuPxD9pkvE5Aqlf1mjtNwSljTVDj9WVpPbwENuWScs
         DViw==
X-Forwarded-Encrypted: i=1; AHgh+RpK/muK4WA0FGGlNvELEzLjt4H7YMHEk6oLsx65XIZyajcXCL6HJ+PGewDp78uzCzANGnrMJjMVkLV6Ow==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbN7qcZqCAjLxX7bQ3hCyO8UTaP7qNm44RbZ1Aj67EdV5LPbh2
	XksRCJ56kuWd7FSXp0jOflZVF3Wco7Ch+qQXzWUmdHM6sVsXA+RouT6d8JSPhvGkWqxOatQo83n
	1nsy9f8zQYCZtJ41papvMJjG9474KSVLfsFlS4vduBDPwX4SKlr7gorv9wM1p7ttGMA==
X-Gm-Gg: AfdE7cnOPcetyir9+fxzVfWbOlYlNbMXdjxUunwmlPf05JGEmLbIKWMPljsGgrLV01p
	R0LbBhwP4RiyvfraWuRz0K67L1kOyZMcU0aCgv+CZH3EUY4aE4F1uTLiAApd9LqpLA1o090grDt
	d3UA4gfghxNrv7NIUQi6E6jQfwhaRPRA8Rb6ypz7CwVdUnoCT6Z1Zys/xWJvYOAJPLBgrkzl8D5
	LEPR0wcgejBhEw9QwLeJSOgq4DcP4xzcT6R3GtGnez8L+/0WBC7zUYnl6JIesHcJhgry83w6YHk
	/w7F/3ZLwb+lg6OubLssPPdP6cMSYsuJRigvtuKGDGRn0m9GRwIgBZzuJPa9QUpJHtewCYKXO+Z
	Pfk5Ilgu8H4d2+PLc0UaFqPb0NDg0S74LxOaefA==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369315ad.37.1783280458790;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
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
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ABrNU3JbylpCLnTIasG7PXNIwcOY_vFK
X-Proofpoint-GUID: ABrNU3JbylpCLnTIasG7PXNIwcOY_vFK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+hzD0bNbDYGM
 XtoCDQRWuw79++as7V+TZH4A8yzUndaL0hRW16RCQclDxvKFhcF/Ayv2dUXxpRjxnXZmvE/0iyJ
 PKAmHOcYfgy7r96QUtUCUHY/AOm12KQ=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXzJVU1c6gjrbd
 Ojzd2CBcAsqDZOqvZuYL850L92fW68qLLoh2mAfIMS1eDinFJFsNElSLyyV/uJqQ8q2wX5XOpbJ
 CV5poiTucZMyHEsjVHl6TsVUheu9sIXkLqkgdIMRz3mhv4Rxch8o+0yHgSurMd29mfpHSOBWeHu
 9e3M67BauXvLGNfcrlsO3AUtBN6fzTvZXMONLqpBQqhbxLUoq7l8Vg/1FNGQOochC1eMdHVk6eH
 5jmyE7DWdW+9qdKtfYyHJNAz8uYHfEIcIz5wvxH/qpIytBtJiBww/VxCHiV+RxK+bGsaoGIvnGl
 gTEDzwBWg9GAclh0CtiFGbWS8f6R8ePvpHSoV7pCdhQe2Tiy+GHdsDXMDso2nnDs6Gap13Kp5G8
 5EYZv/MAV4uP4wiPEMHy5KW1B9hHLKasqDQZkbN2+HFaJnX/sg+eQtJOCe2iEthNBstFKceUcam
 zqNsG3e0daMUYSBkOrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0

