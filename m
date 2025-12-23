Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF26335BBE
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484183; cv=none; b=oPBivseOhxdmDhs9k82EenKXO8Q3izL+Df2Qiwk8XbGfnooRBKYIhV7/hj7bIFnuuCGDv/J0+2nfFsSIVue8Xvwr6rcUxDIYsRxaiBBUf3oR8fJ/Nw0sRW5YFkTyf+yzWkG3JFmeHnxcU5yjlBtJiEx5LM9f79Xf5MQxt629Rgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484183; c=relaxed/simple;
	bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePTqT/l7s1YTnfZfRitl6tPrCkX/USQ3EHBs2P66dMeXSMpCYLXC55KZ4fWfZnNE76QkX3p2aphdO93OYleZTMy9W5dCppKrJ1311yr1roaVy03oldbIKbndD/tASVZLtY2gdKAzBb2n80t6R4V0tlZm9wzmhWHz6T26WNf3Dss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l0SHin7k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UqeYK7ce; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l0SHin7k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UqeYK7ce"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7mEdA4044261
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=; b=l0SHin7knMBp+W3F
	rjAdrwhhQChHbWtqrCAp+evLZYpItXs6dFbvxnWh/YJnN33zWOWoJwp16SxDMxiY
	I92683Sva9KMNIzsZviuWwwIV4/12Zh5Uc4Z/Uth9R68KYSi+Mse7r/w7UdbaufW
	j0nQkbwyAQYq3phTTtVkZkPZXrMAZ9nv2sEjq8Ig/tKz8rAteoZfLnYpB9vzy+7/
	wN8gjtoeyhCBWOtzoGbuldEjGceBcX9WF+FAPOWHfP2IeHXVLlwwoTnuHHmU78NW
	Vnc3Wdl8cePqRuy+tUZHeNwsBU40NKzSC2k4RPNjkFd4t0LzXuEe8vIjtXm7Nkzg
	zGUvtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6g5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 10:02:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so157525291cf.3
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 02:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484178; x=1767088978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=UqeYK7cere2v8OMZBEg5If7pb8Dn9hnW8B/YxqgjSsAzTbwaXwpWGJqsvxMvEkphRp
         TtaDUFvlWKgaELLINDDK+osgiYTi9gyEuuBitwP22NqJQEUUXvwP1PXOnHo/2RSJh9A4
         Frw+MLUgnnJz70+COvpHTd+N7jrTN2nn0dhi5Yt8XGO1QvMF4LKGMWRH+g9GGw0bxACL
         vkFK6mrmq8eKIUKGqaqiG4xTnP5rX7l8j+CYLka/0eitQ1cxMMGq10DaQJGhnrSI6Smu
         988HF0+TbhjCcIXqkPMXn6Vye/CzckQ1OQXxmiERlzfg5RPFKqqXX24rbyUennzuDSGc
         /cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484178; x=1767088978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MmsjRYzbPQApFG3gTDy39jZnNuEkTvMlQkA5MBnb0uk=;
        b=TqGip4QSB9fcaTzXVqixkMgirZbherAAUara3lgmOYF0km1nJUT/g3uyHDpLYKVKPP
         tT72wLnjw4+jTPx5RMJGkEXmD0LSxqoZu2Kvzxau227vWqkpagWXWgHalC92wAJ28rUM
         CLQESOmHXfAdwTVcax3jFsZI2BbeM5Uy5iOZ1XILMBcGj3z8APDNFoFBwbdTo3nqukyP
         IuMVE+8+FMSFRqMFduCx8iRA2zxAGgPTDV1PgQ24IBAgIjVuNe6Qt5VCnc5aUwnZ9gvN
         ekMvSZm+FsDS3uhQmS5Z4C2kpxKE8by6WMPqY9lIZtBno7/YU6lJ4K59+0hDLxTJ9UHs
         0gwA==
X-Forwarded-Encrypted: i=1; AJvYcCWmVqEX05DnTstEmoLCOPCYz8vy9yoqigbJMPJEfaWhz8+FFVZzqVGksoD6oaj7/NReDI/ZVAxoFM7uQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHcMyE5hYilDxuPc/6UV9JPrJU2JQPAzsKRXRfrguU/XuvvtjD
	MJ+sGo2tSErXueqSC6XrQ3mM41ee/t0bUiCx0tfIbDzZjkh0ja3MEySVRpS/8cXBYvD8xT4TEQW
	b+Nvzify/csk6i1WVs4NYG9CgIHpqxdJ7A+ODXVp5k5oL/G5eLVVfU4/BUXk8T90NY3DNlx4QOw
	==
X-Gm-Gg: AY/fxX487SIrEZEf0ukxciEJ6QbCuj7ZUlbzpIxJNkQo/TotNvZN2uomBM/L2i1+0kn
	w81ZsNJGLG5MxWwUE2JyQOCccPFpiJgPtYQ4sYZ4P7BSY1J5ULE15eK2LW1HcEhmOIpR0FPdbaJ
	H++BJv4/LAsIYKd3hotyEj2vunVSkE5c69DM3A60DLWW2l7iUR1CpIeSbCoo8LM/XIgCk+RYrqg
	x7lq0d2pmzZqXnc81hYv0dTVMIBil2SN3Y7YBVg4e3diIdkgupKRBiBwkzulyh2Vpuza4BKIZ6U
	WWXtR7HuLTi3bvEKnL00nQMvYxbBWtP1PRcVtvQme0fS2Ty2yehi4gzqgcAaaxDeV/qJLBNY6+Q
	mlIgS4a/j89hSrHN2r8R1DZ0YQcWVbZdfik3SZw==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr170484371cf.59.1766484177579;
        Tue, 23 Dec 2025 02:02:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqtT5y76xE8az8rWmZUAFSiMsbZmM7GNLUeqGPBNc8CbOBdHosyOf/hmpUH+aL2r9YccEblA==
X-Received: by 2002:a05:622a:178b:b0:4ed:2ff9:b325 with SMTP id d75a77b69052e-4f4abd9da0cmr170483931cf.59.1766484177013;
        Tue, 23 Dec 2025 02:02:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm26794625f8f.5.2025.12.23.02.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:02:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:02:30 +0100
Subject: [PATCH 08/12] i2c: powermac: use i2c_adapter-specific printk
 helpers
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-printk-helpers-v1-8-46a08306afdb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DjhS85KLuUmnMirWSsbDnV889wlZnMXf3iYZWcjz17w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmi/bEQ1L9OUWygCY0o7CnHkaJ9YYNQdACOF+
 T2aISaVKZKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUpovwAKCRAFnS7L/zaE
 w+VoD/9tysA1McH2iqmTqnqT9TNdtCA2efLxLXzIh07p/GuadPXYPv0VYjpYgtS/mnYXnG5kuF7
 bqCL52zltH4UM+oeMdLZddKTJWnAYfzkJTnQAiiwEMWXdFstGKsWuGWKK07Ts9aVNyFVKai+EbG
 xXPXchfoaWgKDaulvUvaZOw6b2ZA8kN/cVPpdsAyV/nuP7IDz9KUsMmd52t/8J50HYV8T1cjhNd
 HgPKRQJjsApbEayChYhr1R5676oDuz7IdWJnCKatgAVzQTt094ci26dLCVJ3iS/ungYosrJtci/
 XWRH/D8P/yO17XK2v6b/GfY26/whonOZ0zLpAKZVz6mIouwgwdMTnM9zm4riWoF3A7QF+XtHps3
 sZKwAAgSl7tkOHHv1jrG6h700Z/rAy+IvVLBMGa/DzTW87vqQJeFJy0ssGFhY6+VHCFYkzk5vPs
 xaagyxWZ7dZeH5cp4jGzaD6m6/WYi3YkAd2J4ZMeYJsh4f8SGdzXQc60GqCb3AiVd4sqXBgJcuf
 YUfHp4volrryE9S++6+BNve8L8YRmvTU+oVH7lE8WFZ5UEf/F/W956xuTRE+kMy+j5fGOp3oK98
 dCtIPF4btL+WEy6jpoAwpp6vAPlyqcO9Xp9Nfp5/+2R4l2E4PI+cJ6Ax2E1xWd5PvNT0Gw1MBvl
 iOtdGmtZ89jEhYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: PLpqXHSewH2UdOBzQ9UNRUUuC8RDQ8xK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX3l5IdbIBnPRd
 RjgBQggiwIZtxOewCX9kVy13nIPnqoJxFOPbwjmVsNMihisExBrah5xZsLZXwvl63xPd52XXM7s
 lbgr6WCtLdsqIJ6QM+LlvFO+s/+BTYGJUPfLlGKGfHKjCM2/VizQmtCSyN86QaIkIC3b+Q5cXqf
 aCwzwerMdrOwH31UeLjU0HVgohQgBqnSHYLmXssFGcCFxfuIeRN7/UlrQ0WsaYkpMZSyXSOWQjN
 LKNWlSCPddHVyr9jYjccXg2OhLbUNxVWEnHVhpn9Wa99b5RvxIcn60SiasyoYiE57Bkahee+qBi
 ZdUe7bfdap564APTrjvD++fCdknppla+pAVgfcOnIGyLLq5j8/kPJYE7cKD0NUGi3YskwNOtiUY
 uUbtmMi627G3w7Lx1XHda5o78010em+uH+T2VGPPiAamkTF042xps3TuHoMOlTXWlts0iq4KE/p
 UAa2vtuV9ZFGjCRY1UA==
X-Proofpoint-GUID: PLpqXHSewH2UdOBzQ9UNRUUuC8RDQ8xK
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a68d2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xF5Bwn5Do6ynS7Zu1PoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Convert all instances of using device printk helpers with struct device
embedded in struct i2c_adapter to the new i2c-specific macros that hide
that dereference.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-powermac.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-powermac.c b/drivers/i2c/busses/i2c-powermac.c
index f99a2cc721a81dc328bc03ea88ff959cafe0f05a..fb5482655d6c5c617392e9ccd745433d5d828335 100644
--- a/drivers/i2c/busses/i2c-powermac.c
+++ b/drivers/i2c/busses/i2c-powermac.c
@@ -92,13 +92,13 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 
 	rc = pmac_i2c_setmode(bus, mode);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			mode, rc);
 		goto bail;
 	}
@@ -106,11 +106,11 @@ static s32 i2c_powermac_smbus_xfer(	struct i2c_adapter*	adap,
 	rc = pmac_i2c_xfer(bus, addrdir, subsize, subaddr, buf, len);
 	if (rc) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev,
+			i2c_dbg(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		else
-			dev_err(&adap->dev,
+			i2c_err(adap,
 				"I2C transfer at 0x%02x failed, size %d, "
 				"err %d\n", addrdir >> 1, size, rc);
 		goto bail;
@@ -145,23 +145,23 @@ static int i2c_powermac_xfer(struct i2c_adapter *adap,
 
 	rc = pmac_i2c_open(bus, 0);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to open I2C, err %d\n", rc);
+		i2c_err(adap, "Failed to open I2C, err %d\n", rc);
 		return rc;
 	}
 	rc = pmac_i2c_setmode(bus, pmac_i2c_mode_std);
 	if (rc) {
-		dev_err(&adap->dev, "Failed to set I2C mode %d, err %d\n",
+		i2c_err(adap, "Failed to set I2C mode %d, err %d\n",
 			pmac_i2c_mode_std, rc);
 		goto bail;
 	}
 	rc = pmac_i2c_xfer(bus, addrdir, 0, 0, msgs->buf, msgs->len);
 	if (rc < 0) {
 		if (rc == -ENXIO)
-			dev_dbg(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_dbg(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 		else
-			dev_err(&adap->dev, "I2C %s 0x%02x failed, err %d\n",
+			i2c_err(adap, "I2C %s 0x%02x failed, err %d\n",
 				addrdir & 1 ? "read from" : "write to",
 				addrdir >> 1, rc);
 	}
@@ -219,7 +219,7 @@ static u32 i2c_powermac_get_addr(struct i2c_adapter *adap,
 	else if (of_node_name_eq(node, "deq"))
 		return 0x34;
 
-	dev_warn(&adap->dev, "No i2c address for %pOF\n", node);
+	i2c_warn(adap, "No i2c address for %pOF\n", node);
 
 	return 0xffffffff;
 }
@@ -235,7 +235,7 @@ static void i2c_powermac_create_one(struct i2c_adapter *adap,
 	info.addr = addr;
 	newdev = i2c_new_client_device(adap, &info);
 	if (IS_ERR(newdev))
-		dev_err(&adap->dev,
+		i2c_err(adap,
 			"i2c-powermac: Failure to register missing %s\n",
 			type);
 }
@@ -299,7 +299,7 @@ static bool i2c_powermac_get_type(struct i2c_adapter *adap,
 		}
 	}
 
-	dev_err(&adap->dev, "i2c-powermac: modalias failure on %pOF\n", node);
+	i2c_err(adap, "i2c-powermac: modalias failure on %pOF\n", node);
 	return false;
 }
 
@@ -331,7 +331,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 		if (!pmac_i2c_match_adapter(node, adap))
 			continue;
 
-		dev_dbg(&adap->dev, "i2c-powermac: register %pOF\n", node);
+		i2c_dbg(adap, "i2c-powermac: register %pOF\n", node);
 
 		/*
 		 * Keep track of some device existence to handle
@@ -353,7 +353,7 @@ static void i2c_powermac_register_devices(struct i2c_adapter *adap,
 
 		newdev = i2c_new_client_device(adap, &info);
 		if (IS_ERR(newdev)) {
-			dev_err(&adap->dev, "i2c-powermac: Failure to register"
+			i2c_err(adap, "i2c-powermac: Failure to register"
 				" %pOF\n", node);
 			of_node_put(node);
 			/* We do not dispose of the interrupt mapping on

-- 
2.47.3

