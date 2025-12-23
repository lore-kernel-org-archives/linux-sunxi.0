Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9D132BF58
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484171; cv=none; b=eANeQ2vfd3R84xynz+u9mQnAHTFNLv5lkA0Zki991CK7SalmKWtO8yOMQGV7H6f8dP04UD+y9LkbZTUTxGOIKpBGy5NWJ8b6Mb3aI7xV17RjwVgsftqtIPEt1S2fvWQwUeOUNLEBQOWaPS10D1wEzMaAWkl0gPn8CvzYSq83Pnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484171; c=relaxed/simple;
	bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qPRoQKaAzYoy4Yh+vnuo83YLnwyCxN6Det6knV1ljkDuMAKHIqk+g3R9Q8zLPC4M43/STzElntC9X86f4I+QeoTox+CJMDLgf2ek8Xpt0o1PGCVH3cGScjJSqrB6z3YeGCjsNXCCKZerKOX4mjLOfOuB1Byl40MVS/lhPB6/u1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXZPQwMV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPnxgh3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXZPQwMV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPnxgh3x"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN61dEP1901863
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=NXZPQwMVokntHKv+
	fa6fgpAlsALdTn0FhVHe/OI0/RAIFpi2EQ58j0PO6zNyNNJW3dkpCjnpyNrjserh
	0SN0Q5/JAdL9cCtjSI6i/4w2C4hlJ7yQ+fChan94YkDrFXAGQoHib/7didgwTuF4
	OSQuTsubDEpoFEg0tMw9DJtVRzDg2TkTTRXbW8CpAvm/g2f81OlpsAqR/N/F0Y3F
	Xunn3GCHzcOoyAhkp0N4OUssKO4zl+U6PUa7fM/Wmd2FMAXFbgxpYpgWha9ZujNF
	bA1ERz0aVQvCCImvoWp+nrwJqnYphez/xoXSXQmkV819WcAWZNfP0n5o1tby7f+N
	UTSBKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1243696085a.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484166; x=1767088966; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=iPnxgh3xMVjgUDbzDkUg6bOCHkLY0tYZ4jNuER1r52XbQbwldVnUaR3fA7naLg5a1t
         xCmQEBVviYGVxAmJq+waYSJbCC9f+e2aD8egNaiKX2ykow8luAKVAw3Xf9WYg0buGPkp
         4sTPbD+vEiirXs0J385b4Rk8kBDyAp9HtEUvB2H/NFESj/aI97XrsAL7x158ARH/nbh7
         YzaYG0otNzDin5ZPqeN2oDL6Gf+F2e8cPWNzJl2VPaH7Dvs+6N8gE/LGXjyHsaT8X1B0
         CQJVesmkJ2QuPRTTFkY0VJnlMFgVk/PNPkgnuQeNXksnUAJQHZ1lNAb+r4O8dK5wFp4T
         Dy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484166; x=1767088966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=SjAM/APSzt0Q5Cj2xn4LlUb6vhcqGpWOw5xD0QcQ16zG31Khl2kYtqc1zSBidR2yA+
         GLXZkP0idLrUTHkW4zxczytkY6sVP/ClVsGUCEFDkPIVajWDwrVbd119SmFg5T/0Y658
         sZ3Wm7iS9Q4WIsaDS60lQpu6nACXkTFc6cWoax3OOV29Z/9Bp8Z5pPvBzZijg5YhAfjk
         106h9bbGV1suhPFbIcMJ1vw5tCbhUZj0NUKdrSvDvor21rRgpzE+8Kqp4P49fpLhlS8/
         UlLS6jJ14N858O3IwG6hYbiFD+Ijxf4SOmWXFBhPZ+c4q4e4L1wNmRIWg2Bhawfw4yq9
         Z1yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgQs3sLSjLjbBHkwGZFvuXUV0pxfVGhgpOXSjRw6AdUJBxX6Ygs0UxYkFRfvqhW75gNC+R4EdibWqVMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOUmfK4J4hpCUYrJEfbVO7jGxpicZBVt0zxcJZaoNmuugdgfKx
	uB9siKXOctYeUVPP0Odr5FEgkKqLJW5+alpDBl+5m4dU5yBzH9rO6nOVEniFiO3mP90QxzcZlOW
	BY//Wh/XoyjoyBIFSksOeCo2TONtC1KNdEOnMacGiB9sI+UoQghi0wO8erFdfIFkExA==
X-Gm-Gg: AY/fxX6looaVFB7Xl/BXX0k+XYFM1wZgXahfbPFN2k1IPi414f9X+Rk32XCJDKtJqQ3
	JRvSXoVshY5S5lwoXtz4w/3JBqLaUKkMuMOh8GFpbI3P6/w05bXPRF2OxonO0V+ecGzQt9J9tT2
	F99wpRzLFaWZL2lMoTWZ+Awa3SLgWF/ktcYMtNqXuyoNJmpcsaOWQXF2U8d3SKoLrYgo6hcpHDV
	adm9+PzoH2xAOEh17sPZSzefMbhzk69T2aPkUfe6m6UW51Folet0oaUysib2uf//7uY14uFHYJX
	U3NPl8OfAiDHQCgKMkLV73pEWmaoP8J9M8VTxhTgieEspsCCxxj+5nShIBonKrK3Aq1jcD6KJLB
	0rSJvYLUbmVGbkgNHZYhrxzj+2RG+bZvZhtqcTw==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222573311cf.18.1766484166176;
        Tue, 23 Dec 2025 02:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWaznzSTQAYQqKEgVN6mwd6iFax1OFCffRzJ59eXXh79VnM9WyrAcyYRh+zK9tRY8IGJfXzQ==
X-Received: by 2002:ac8:5790:0:b0:4f1:b5ec:dab3 with SMTP id d75a77b69052e-4f4abd18cccmr222572751cf.18.1766484165645;
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:45 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:23 +0100
Subject: [PATCH 01/12] i2c: add i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-1-46a08306afdb@oss.qualcomm.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi3cNvVUsgYZCpEuC46abxeRT7pA49Xu64UD
 uziUkVt6sOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpotwAKCRAFnS7L/zaE
 w0ZoD/wM32Bmp3WE+s9el7ws2B8x4OdFoCdcSdX26uMDCnLnt8YtAI8LOsVEEMb6fazPKj6jB3A
 jMHY2S8MeFGIwey/wve2wcUUgB60vRFoCZY+E/dcCGlPQUVhOMO3PC2AhTxwmhkBmfkzDQIquqC
 YfNbf1IdKLBGn9WdVNJaTeo9B8YtMcnX0ZDUKzJuc60m7ulpEF9QqYjLU82JgKNWzllIdtiPLVX
 E684v0yaaD+u8JcHb4qv1yORIxoyhBVKX2DauwcCXPFMlnEN6UYvC+JQTE1mtGICrPrK/mTMyeK
 gxxc5Gj1ENA8Pr3SMUWoPnBF0AoKGWF3CJWRBGsjK1G5vdfyJp9fH8gvBxcdzNXKcAis4Ed3Hbn
 u6faKfE7YzPznFltsBGJGmWNTEdH3N+syfZQgnQr6AdM7NJkPtD91sNAk+g33YMN2lg4BbobqcU
 ++fSFCzby4D85+5WOfn6Am0AFpRgoXSmqqdQwvilG1fiDeXTAx5F86G8I3NKjn3+AmJ3fQFwQ93
 patNHd2OQStX1Jed6F6tfhajOxUvbvZkYwb9LRwX4WBzdiCEej9pxvmzMSDqs73urZJt2Z/41/E
 aAQ15tsTH1dl0aqGratG04wZFTAxiF6I7R3axfNL/mTIyehWRw7qi3fMW+IUk5V1RfiNArrrg8+
 z9zRlaDNDfxGWPA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX7V5WO7qUId1/
 USzu+MIx8k5KhJxvHWg7mNsFi3/gKuxXl11kuKj5RgCiCIqsULbdlCzKoy3nR37X18zqqD2CCWp
 frVh8TsmOzHxV5ABLSDECOYsvP++hBmuV98FByTSxXzY3hdUbxixyBBkxOhxcH4UH9fpRqNLr57
 QCsH7KsNHypNhEEWH3K2HRR0jiQPLP+v4onscLuD7sIo315YcXe5XvxpiXXrq3syqeVLgYMxZs9
 mGdabPa+R5Tt1wtlXYFQVrKVDyVt1O2Z519jXbRI+8U53ZDVSwqYWQ7gdtzfFm3xCv5f95DbCp9
 0qXUW5jgMNMFo5SmXhbUcaiwIJG23ginWdosRVKO2PiQhCzv5FefG0zrYFAqWqNIMpkCGdyYHOk
 9tIZewOdgQRWf99Qoq0biYyC9dWeV61euT8hFLh8g8UC1qowewjcXn4uFvTvKTzxsLjfOkco7Dq
 McPAhoHdYLk7Jegvc0w==
X-Proofpoint-GUID: 0MjikOWWTMvjv4__Pv4vm3_XI4dCr_Wy
X-Proofpoint-ORIG-GUID: 0MjikOWWTMvjv4__Pv4vm3_XI4dCr_Wy
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a68c7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Add a set of i2c-specific printk helpers that wrap their device-level
counterparts and hide the dereferencing of struct device embedded in
struct i2c_adapter. This is done in order to allow moving this struct
device out of struct i2c_adapter into memory managed by i2c core.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..2225696c859f617479be4d5c9d304bb32cbf5e9d 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -768,6 +768,12 @@ struct i2c_adapter {
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+#define i2c_err(adap, fmt, ...) dev_err(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_warn(adap, fmt, ...) dev_warn(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_notice(adap, fmt, ...) dev_notice(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_info(adap, fmt, ...) dev_info(&(adap)->dev, fmt, ##__VA_ARGS__)
+#define i2c_dbg(adap, fmt, ...) dev_dbg(&(adap)->dev, fmt, ##__VA_ARGS__)
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);

-- 
2.47.3

