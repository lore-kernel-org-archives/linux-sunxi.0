Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9005932E6BC
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484173; cv=none; b=XkGZa+U84eiT28ukYEz9pnrSqF7P/y6FV/4/E30eba5JaMCo41H4XeuvlXeNIr+8AF+zQraTgOyW4+BKO1KPQLXzYXfG+NN7qs7zdfbrKe3HiG9lwSEgh71XTK2QzDy+Vfm0UHtkR8DMya7w4jIw3XhQ3H/Gp6gjQ4ziv0DDKFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484173; c=relaxed/simple;
	bh=cKutYeAHpo6nJsViJWxWS7S+6Sn49J6bFof6YwzIKbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pp1lHa9Ozx2/H6GV4C7PwxIgxhcUHyTybgwMJt8q7uPyvk3x3fhp9n4re3gBr2a2zgrYAXbXxRKgo5MaoSGvLj2+RO4dFt4/8E+AQ/JdJhkMRO6wYRCGItmI3RNzz7j580e1niRZUL7MWde+/qd6kv5jMt4mGua6jy6wbXkxhmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hG3y2eBh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aqZ7pcVM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hG3y2eBh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqZ7pcVM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2uKUB2199035
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=; b=hG3y2eBhBYv6LK+z
	1gL0yrBRHY36kK6tWsTAZs50z93bty8jefw0oJk2zhNokRswgV3Vu0zE0e0pU+01
	K8xNvRQoWxZkFlv0ohVF+xl4CxuTiz0CeskCHnmGDfa7zJAYJ5wsECLupZN1+WCa
	EIGTJV1DUwjeBWdszzlplx8YYqbH6yshlF0CXRi2xJMIfTj4hwljaK/uQ2OzCrs0
	qlNfZ2iaCLz/lQb+dJpEQzzmirkg49C0m1UONoGOSEYhoMHmj9o1Pi73+4JkTf5u
	rfK5s3fH+6/mrrs24LERc2HyagXov0pf/WPkZTqqF9m94mL/z4QJ3kTZqRc1RT3+
	YLgXZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b73fwuren-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b234bae2a7so1144226985a.3
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484168; x=1767088968; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=aqZ7pcVM2h4ync+4WsFRnFllpikun4I4IzRV+7TbnyR/UhiFSVXzj9F2RqZYgTqCZP
         EeLDI9cTgTNCSq6qE1gCj532IDcBcCphVP6ykjcWvJArdipHqHpufpOYY8ru2XRlJKjs
         8QonKQ4Os0W091c69sqU0cy016KvAjbYqf6CC2Iq9xuiBF033cZ10ZEe3w04IZbRY+rh
         QXSMHlQVwdgZBugWes8iqv+4UwbeY8RVQmJ+HPERE762tR5yhVIi77Ei99DzNsJcyrWX
         8oOYgrubMTqCSQ1pBAw9+9st+GtKLejaD3jWleiYI//9mLxZq5RJeHAZt0T4yG0aPPtG
         cW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484168; x=1767088968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tu0BjGtj+t+6GIGeNsvGJX2MIxW/knnhiN/3UfU7S/s=;
        b=QBIYlBO/n53w3aTko46L2ObZ8xg3QV3R8RWJdV4Y6hVsGSUiolFU99hVnHjoS+ZcW8
         8mUuy0N8eoo7MLEDPoUvUrs+U6h2pclxO5YTrIN6gnm7gqewoJHYJEpBFbsMLkHw+nIh
         sDDYksRWH1AdxRx53UcSepbC+vNjtfndsUZr+tMxC0VhDJ5hAV9IdZADEZifjg+jLKjA
         z5Ay6ly/YQP0wqL+gKInPIcervextdxKM2BkNKBPMNvgzUq3Qx3GDn+zBCSFzxmhDXPV
         r7KHZxe4lDu9WgcvDrVsqo1lMTvQpPjCse1eyecwJL4HSw31US9/aoleU4nboIZoKfo0
         s36Q==
X-Forwarded-Encrypted: i=1; AJvYcCUM05xeeBRs8aUQyNifrneCXU9igJGucJgCwwnoKiWe08dJ6Z+ImCxxwoNGd8KsX1nQ7eNv+S5jvvp/8w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVPp8mKBiCX/yFwVIbFOQs/9M/LHVJqzmULWj41ej869lKKMpy
	CHfvRx8EiSUDecBy8YGlYdSlFlBenrSuQeZ0LydQMzPcNqD6yyWItDaQDZswYLfEYWqdwSl6h7k
	bRZt83GlH07maa9PvJXMeIbrnv9IIS6NZcoRe02I8lXo4/O+0hsf88ZWHx24WJYo6ZQ==
X-Gm-Gg: AY/fxX4qbRlCgRFRbN80mvPY4AOo0TK9G36M2N5BvEG/lL1EKSP2qpAeP6ru0PEy8k4
	ROtI2P7JhvBM0/WYw9pqq49V1ryFkFqrkC3njDu5y8MVE0A58tJYdHwBnrjlv5rSUo3VL9VJTIV
	rL+vm6M6G2VSW75J+hkesSl17N/bNGhLarI1kBAf1OJ51a617uSx+2HmVoJCMPloWO/3L/PcIv5
	o3lvYDfZ0qVCYPfKz5JydOwy7Ea6DpnW88nmXaz7W8p9gqsp/2ifZbGCyPryGpmqwSphBuwl16E
	D0P7jYOGG/6tyIOgoTtQ9++lcElS5QHWLe4FUupSvS8Faqb0aNbr8z8jt5Wc2W040EadLJo+UDT
	wng+8TJTAub7Gl/tLkDwTSDOEx3Y0bUGkrbBQIg==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204127401cf.39.1766484168135;
        Tue, 23 Dec 2025 02:02:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCbCcOwt7PwsENXNFXjD41YHGkGJlBJ34XwvIgIwyJ9Q2n14TG1CsoAxoooPIxMGGgm4WVfg==
X-Received: by 2002:ac8:5d4a:0:b0:4ed:bb39:9a63 with SMTP id d75a77b69052e-4f4abd99501mr204126911cf.39.1766484167633;
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:24 +0100
Subject: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cKutYeAHpo6nJsViJWxWS7S+6Sn49J6bFof6YwzIKbI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi4lDcQCifG3TxNlV3pNhaduY0Sn/XzxO1IX
 6KkowPlTIiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpouAAKCRAFnS7L/zaE
 w3gBD/0Vl8pDykw6ETOkKFQljl3UM1M3CJbnY+yo0kZT+SiECA8eRrap87iHfm19c6mC1Qcm42T
 fPEtfuni5DTWZzzF26TvLyz4l7ZEcMg4Q6UAEZVAc8Jybc7WaVUeRzf8P5rwSki+HdZ0W59W/XQ
 tkJ2GtOGSQ52XE7I5wmASiDxxX7bp58IR/I31WfS005D6EqhpvQAwKdTw8gYYkkxrY6ZwBe07BD
 kae+CXffjmnWs8IFesCbYHseao9A95f2UvZEajaOvCjrES9W44cGVaOCP5nGRkHwN/bnw7qzwSh
 N6n750a0l8S4etcjcnFPB7Zc9n5xNi1P2y4T/bU2WrBBFjdph7PiXgS3ihaM0CEWiriP2QIYzjo
 jk0daF/965GEziSPEoFBLEF6McW4lhbsKxmAczTkG7A4UHMU3OTc5iu6IN2YgVs/uD8bMeN71QL
 C/np0FOY3cMZ8FkJpMSHXO9JA79KmO4grADmcJ4tsK/H/9c8Og6oDho35TdruxQaOq4TSjxqOrp
 ihqJqL0ogTI0cNTl05hoyvBy+uCPa4qWxn032QvCPq65yamv8Ry8abNAW85T8Ai4ipoyuFAztmY
 drDCsNvroTIdVEEfDq6tyj1ZxfrH35z+7tA0DKl41RuWwf8WOfeeOVrdH63KV5Dtvpq09ygIY2k
 pKhjZl4zQIk8Vyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=694a68c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3lqC0MzlwKypD_ZaiT8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX7TZPJhVezZHL
 5XYynqdBAPTfBBCTN++DJE8vQB9njzLnHXTEWvC/X8F+kbDeWR550RfhZBNLEKUY0TOaCr9TBAE
 N3dJ5K4caOOyDjBdGTrXcTuKRfLlZQpubv4BfuJ4JauRo6rvA4Kw7VtMua3yaevm3VXEViNkOY/
 02sQI34YEc8vk5nXl8wWKcSHjvLUndHLAZJmtUrLGrwFx7mKaBzDQlf4uxJekBqHqryKLbr6yrN
 zVtRSnadKAZ5RKvDzxw3rGrjajdq9/ByvNMaY3jU9QNoofvfXWoPzei37lFkMI3kVcErzOMK07A
 ExdnMJSgnlknASq2+hQwvCyUa2j6OHUuU6P8dJ1PAnefawGcm3pXl1i8yGS1FuxyNtmoO0ZJV69
 ku7Hqkn+bJnx1uT33gallna9z+lmfg6L6ZlUBb6AZP2hvUL0OMCE+O4Inu6qHRXmO0plTm1AJD1
 v6CUB1I3NiFsfIQzNoA==
X-Proofpoint-GUID: orbh6wAtgE-zZ6CZYuq-ZiG2HKnUQtM7
X-Proofpoint-ORIG-GUID: orbh6wAtgE-zZ6CZYuq-ZiG2HKnUQtM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648c082f319d955b5e 100644
--- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
+++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
@@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	unsigned long dlen = P2WI_DLEN_DATA_LENGTH(1);
 
 	if (p2wi->target_addr >= 0 && addr != p2wi->target_addr) {
-		dev_err(&adap->dev, "invalid P2WI address\n");
+		i2c_err(adap, "invalid P2WI address\n");
 		return -EINVAL;
 	}
 
@@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	writel(dlen, p2wi->regs + P2WI_DLEN);
 
 	if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
@@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	wait_for_completion(&p2wi->complete);
 
 	if (p2wi->status & P2WI_INTS_LOAD_BSY) {
-		dev_err(&adap->dev, "P2WI bus busy\n");
+		i2c_err(adap, "P2WI bus busy\n");
 		return -EBUSY;
 	}
 
 	if (p2wi->status & P2WI_INTS_TRANS_ERR) {
-		dev_err(&adap->dev, "P2WI bus xfer error\n");
+		i2c_err(adap, "P2WI bus xfer error\n");
 		return -ENXIO;
 	}
 

-- 
2.47.3

