Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54E34DCD6
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837202; cv=none; b=YsHB8WbzS2h6qecRjcC5mx275YqGjuX0oO4SavaCwNx8T/fJU0pgQk/0dS5RYTZ5hA5OE09iRF38TIRi+Phy5Tadcmch5SiolWguyVEjXR/orp3h3T+bbVBqYSTq4zHxm3kdUFHqVc3AQnn8JygRkDHkPaXNBqDq0cbCPe56Q1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837202; c=relaxed/simple;
	bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BIneV+kSR3NmAA+f8amsT2I1/O/lNb8LT7aYniWu1uxUjWCd6n3eDgOJxyYF8CsOxhqPjpK1xwqXxky5zNukxrMmMEX83ypv8Ne3hMu8MVl3jvaBJEwWsdYXlsfqLLkN18ydZPfeWeULPT6fgli8zG6+ox1QM6vidv2+9Y19irE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cws0ECAb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=goUW/Mvt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cws0ECAb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="goUW/Mvt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNvaHw2916725
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=; b=cws0ECAbBSCqE6iv
	a8QGmcMF0cnSH9ehxsknG6A2aDPtW9cHO2uem4vDvgFFF66/ZsfJ6uAfEyYz8gKJ
	QgUytz7Is8SH+AYe7IDBTZtKQUD0JgXcLmrmE/5dz2mpGDRr5VRvkRo/BTkDLKbB
	yNLoGtFhMEe8Pk1Se6WZRzgZzWmQGRltuRYozmE8npfyDtPHiJziFtQJIbrRKKoF
	ms+KDNJSiEhZxrZsBunwaUbxpI7XhCsOpb1uMaQWCtqZYLpVBeG3pmO5bko5wgvi
	zZI2B9N51LdwSt+hLE1+CBB1nq3YiKOgt/QyKM8c4VkbuzHoCMyf8gLqO/n7HiI6
	kHp35A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv2gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 09:00:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb706313beso575171885a.3
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 01:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837200; x=1772442000; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=goUW/Mvt6t+pehkAluZ9jyB84BvGobPdNIxRJ3OV54O8nyTlTGNfR8AB+uPkVSQk0p
         ddDz0bTfnipwgMLB73D6kNYoQkpP4IbZ0PpfbFMl1iRU9mrF5niLNKxYWzHyR4bcE32D
         agxVP997g8EdDefLs+VzyK3m9wkIklqkVxANKURiCGPPMtGAeqoXny0wupoyDuAgZ5vt
         MvRzOHkpojFxJv+M59RPuL6yaX1/n/HPl9jwg2AEfK6jlS1DidSshTr5ztS5/mn/sofP
         aUeEGP+iNKbitdscik5vmvJJRdrdF4Hf0CRGs1+9LetnjjfB2sIkWnHdo1sPpyFXIdfk
         V9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837200; x=1772442000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFnYYnBwOxyLsl4gp3Gqs5QoCyJ7O2QmTAIBUb9SP2Q=;
        b=HLfNNKpN71N2A/9oQBaUfhmt/8NsJBTTS0lF3F4f9YJcUWZl9fPx4VNgBTXAmtFDzf
         oYePq3de0assKo1DH9f7g499E4VJkHL5FpIsq1NxX3cD6VKyC6MmSFT33M7PQ40PpB4j
         3Mg9lJdCSz6x94NoClG2/fE+VqjQ8SVbFrlSyYbMJ4wcJStN1Md1UlfV6KHgKxBtgLr/
         5ZhSY8AoprJ9GIZCC6BGBQcBVfEKBIMrnSZ8sbFmn+EfI2Tg8GkWYE7whTYVbDc2LEmQ
         EzO/4UaRr9IzryHOvaOdfvDIpcJUWams4T/16yZIxe0VUN02zlb9b5s7fQoELzPjzOdC
         +3wA==
X-Forwarded-Encrypted: i=1; AJvYcCVMcw3g+FppZkglEFNWwfCH7xGvinENxXmeeFY06xSfbvAma6BSXcxj17O0S4hOlaOlvrgFKzcfmwQ35Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxEkEAStk5WDIgUjzVAUTgbMBLQacPgHSPQtppMHmmavDRQX5KB
	LjIvqK+kT/K10pIjeHzLqkVBXdEaPJYuH67DWmhMpgDBkqdLnoBCt94fRqRXb+Pzizj0jC3CRXB
	x5W641tmwkYBoB2+teT40+89LlgW25HUrgQnRUPIef5Qd6oRgukMX3/AmycspAK7qRg==
X-Gm-Gg: AZuq6aLW26A/4gpIXgxhKOT55tEy3W4muiGcaogH+MoijyYzKv4pLRcsaqvNR+lMID7
	kW0p082CfhBB6AZaTcNqQRQVfrFqO/b0WMrXnIojVRpBdS+HFwJNESft2Trod54ZKQmDwXJeWZu
	/WrIilsK4ilouae+7ZnPd+EuJUK4p3fIzoZJ7CtBoJGVF90yC9pqpD36FQEWkWRW8LQeHtTMj5L
	X80toucfi5akoROZ2hugObuh0Vpn21qTlvJKjAt2uvDxDhq4xDL6YKJbJSDQrZXJ0h4p9Xi0ZUM
	y9stDs8TcGWFqATzgxjQXtPRX/szoqqTYfwygNyeIKwsLAwEp/pLgDF7vKPkf/mkq55pPcKgGUc
	UQ5jZKoSw+4rPkM9BI7RwYBwAaEF8/EcXbPmOLnE296N4K++yP9Yy
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970849985a.52.1771837199595;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
X-Received: by 2002:a05:620a:4085:b0:8c6:ac29:70ff with SMTP id af79cd13be357-8cb8ca65e96mr970846885a.52.1771837199129;
        Mon, 23 Feb 2026 00:59:59 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dfd3d6sm119000395e9.3.2026.02.23.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 00:59:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 09:59:31 +0100
Subject: [PATCH v2 02/13] i2c: add i2c_adapter-specific printk helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-printk-helpers-v2-2-13b2a97762af@oss.qualcomm.com>
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
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
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
        Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ocHwW+sRAuHA65NGYfWiu2vYKpc/cBf3QlL1rRapRc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBb9jzjFTJdq3M6FO7EYY2QiwT8GVE9qmSWuz
 3ohkzvQSVmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwW/QAKCRAFnS7L/zaE
 w8BmEACrMBvc0WtZJaG8d5jaaStBPDhB6rA1XzsrpvPKTzprO3pfbK0+LDvt2i6hcSz6G/sATKM
 4wmqFf/XEdRLWL54Vwi3cecAtJ8tkTh2p8nA6YHe87diSRhjKjFAv216+yDh0QLuwHOYhUjqM08
 f5kZhLL3dJ4hDRd49MZkT6LGkkFA56GIxx/wOQhMg9FsMGQSnm5tJW4wBUy2F4ldoKdRK3r4eF6
 STm5Z0uulFjPHiAlQ7n/ZGdGSFI/mKQe26GVRiSUTzgHepT6OoK69CwEU6WRm6JdvHpE804SJhS
 6ps8EJHVXUT89mV3+Gbyzz7UtIrFymORTZoy4pq0S5Ari/vp1uOMfyqvRJ0n5OO2oDbe0DiofMd
 L8e6e0NWZ1LU0AHDQ5EFb2rh0u5gom9/cz0WAQ9mGcMdru5aLcsCPFXKFd2aVeRHRskvjca97bk
 pCQ22fRInNk9I9PZzhCx2dLcEUE6ogUyuzOB6bVMFnmtHa6dx99uirWBGGqvzgyIbSqsNGwnXic
 GLik9Q5xUP0W1vpKN6XCwLXHgHleEtmYCyp1FnncRrxB6TxXUTsMd2PluQIrapHsp9Ty4zItN9D
 /wRIDRb0bAFp0WUToMEZ5+f+zdAf3iI9Nl8IyXV7G01Gf2FT7qaKyY93dG3gdHrAKTMSNLB400a
 XLWKVbwUcAwCgXg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MCBTYWx0ZWRfX/QXZuJqQgEWv
 CIlI+YoTZCJCvoLLhiF6j7JqPmoFvuD0MVK2sWkG8FOSxvj3xd7qX5aghG1WZ2QQRdTjUXu5/nf
 mjxHqoJhnnSjkoaNjFenOVvj7wPb6moQdILiDC68oLe3dW/lQbtGnu71Mj3QL5SWA67TD2WiiaS
 F2ml5Lzt8esRD9PjvBWo7z3ZH7rmh5grtcJRelYXHS/0iMhQTgN2ddwoofksY6HF64REQmPQHix
 NJAyygB1QoUeVvsis0GUD5fYUknnrpIsTPFf6vqn3n+TqmSVuP9JNXuWKdlfNmbBd+wVRd2Y4r3
 8rsG4joQZaf+J7AVkS3RwICSY/YhK3r1kQ78IVBtMfqOYryd7ZuoWB9xyeZ4ortFVdUkHsNMZON
 9cx0Rc3MoiZ0GI4S+nqngZdB1i6BjuTjdyUsFCO9gdaw/m4Y8FYOXkk9sYogTTKcA0WLypEEwNO
 d+j9iT8c1PDzJVN58rg==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1710 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=3PEwmxbnAXTcU586h74A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Z8uAi8PYwMqFr1CtDrE5tr_YgZg7yhS-
X-Proofpoint-ORIG-GUID: Z8uAi8PYwMqFr1CtDrE5tr_YgZg7yhS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230080

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

