Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828CC21CC5C
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853867; cv=none; b=uYQEj7824Z+RVIFTw+yvYYILjZR5cCEFaiad8VxVkyZ2Nwv/xc/okdkpXS//xw3CbWTFf/9ZYLmEffV9rU6JQYgIngAs4u3/XuYjM3BI6mOTIyUcYw/SA3MnH3WGj8hvTajozcaRlhPT1GBq8aBxT5CGpwpGsutaphQKQs34vWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853867; c=relaxed/simple;
	bh=QPmNRNSabXl3r0S7jPuSa+7dPpXvOPNSvq8pxO+7W4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOeqZic00PH1UbL/UaF1ilT8498abepBw684FXxMUAJPB1ougHkSbVZsf8JH1Ataalhq6DE0UEtG3BYXVEIFvpeZCSqLLr0LMCkujBA1lZwfSYmaTnK5+ui9zXXdoZpc4dYhbEozqzwmcIqn+fP2FxSpMUNN8zD4eVFhhv0vG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgNOIZOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIrTTZXc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgNOIZOY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIrTTZXc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWe8I3698104
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=; b=mgNOIZOYdqaEeMQb
	ri/vqPoX9fCBh9wx3S+uAWh1y9/R60wqQY7ofww98qjP15gtNhXKd5kz42bdAee0
	eOE4jEXR0zg01jndXaBcI3BNyAkdY1h9AKf2mDvEBu2BnWxGS0kJANIqS4CVLqdS
	9ZGcRB03rlDMDme7gSzYbH5dr/1srlerCWQQ6GWKF9n+peFK+hE7hiSR4utjlCeZ
	zIkLp1D8k2BOzuMmzyjUvnU20XrVler7Ad9n0uj3IhoHUpNiku+XdCvDUfUpJKpl
	eeboqonnskflPevjO5I44TDftYCJ4cbaeDWoK/fEtcj/S9Rv++aA6Fk3MM6z03oT
	UU0p4Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818fgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ef98116so4780889785a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853865; x=1772458665; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=;
        b=JIrTTZXcmivOY1/OkVLoGm+IaDGKagx3xTx9pR5ZLQ0V1GHGxscyyr4BwabHpNHIXu
         63Jmmt7eaPBCWIq083GwQFG0H+R8Jwk/PFbif1qitnxT4yHmjxUakKfBpbUxlH3sDxt5
         AKj0mlwvLZkErt0G+iLQK06B+WEZiyHEY0sv8zPvLeZvGu7sctVKFJ2wG1AA0FjC7YMt
         GsYdG4FdIIbQVmvuogGPstSBeboPrIyvhCHdsjegc2NRvRPSYqh4iWxWL3J3jhn/nc1Y
         PLpoqSuWOo0fiYF2x9sDc3UU3ArNIc5lnEy8obe/L6GPDO2EAoS/jMKqD/5mQojgxam1
         WbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853865; x=1772458665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=;
        b=rSddbMROJ+RMCmyHOLC1qWF61HUZUA5xVVaTByHHwqfgazG+S0HixQqnkiXooDz3Ao
         pzaN++9Yd0hgfmXWuzf2RBbq+d3bvO/nXHVmblgp2W3RfzzKj5os6uMC6G0T9kVJX+uE
         BYfotirDXntx66iFrxSBSa3M1rOTWp7Hn0wnUuN4KGDOWrVMZrZ/e/BTYUZzCj5oupIw
         Kr9lDkJN2LYwCHB1mnDwjo0L6xhm2CeOEk0GCR/lFmdu/oNWwq+DjqrIMkYL38Na4y5g
         eSdmv6ArEYlrHrqxb+U5fAnVLziVhaFnQUR6Vxpe+/BpP6zJ89+iON6ptKuNH6T/jiwY
         53fg==
X-Forwarded-Encrypted: i=1; AJvYcCXpYhqOjj+M630d3UfZn9nnEWzdnlod3ZsX5zs/zjCfsbXXKLw/nEM4MGMpbMl9gd2kZk9CCGkp/eFQUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+iKOXbc9CEHc49NlNMUb0FIqxt28tItgbWIuKMv60mN4FPhyB
	6Rgcr0KttTJ4T2o1wXsh70JIpUBmwsIKLsaCaOZtIZb9nHlx3ZoXyABdnEYSccWqXrhTbAvhIyD
	aMNHHrKZB5vAMg5KNON3J+OSiSBS+KbuetmCKdYsKoywn08HhhsHF4RxndszBP/V6tw==
X-Gm-Gg: AZuq6aKCDeit5ZXUTKW5w5DFzXkNencHy5rwN4VmWLbFvyaco9WhyWCtsUFk2DrqKvk
	FvLGoKdJ/P0gzej6tAcnvy0hZia6EloHMmsCuyHK3iY8XhKaVq3si7zU92CB9ACoRve9OjQXg2T
	GulI3bDJyZ5zvt9umR6lFF5PKiylCC8EKv0fz9IxH9R2Xm/AISn/VahfbyipwYfi1+PouAxXlej
	6SAfE2MUEcf/X3ta1FEIYV8ALhAOGgBoO+G/pVOUZQt7/AhTNHCmExCc15eFaue8K3o8zg4rIdY
	8gqGNWSQTJPISLWINTgHCJKK/OmfPXBFko+eTatR6yuLZR8EGEGnu7pGZPew3wAT3liET+3ik0v
	Ynr1C+9Gm7R942DiO1DPfMzERLYtkJ4cyJFQAW1oJCY+LlsHqaac=
X-Received: by 2002:a05:620a:4492:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cb8ca72253mr1151982285a.53.1771853864487;
        Mon, 23 Feb 2026 05:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cb8ca72253mr1151976985a.53.1771853863950;
        Mon, 23 Feb 2026 05:37:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:16 +0100
Subject: [PATCH v2 1/9] of: provide of_machine_read_compatible()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-1-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QPmNRNSabXl3r0S7jPuSa+7dPpXvOPNSvq8pxO+7W4U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgZHBYkzb/CkVSuWiIkaFvkB1D7XlGgt7SZk
 chVZS6T0G+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYGQAKCRAFnS7L/zaE
 w+QED/9rJEQy7HuSo0BQ9ZoeKG0P8FHVreYTHlCWGpsvaRCRMVMEZyB4slmYakmKcWwbnLENZY+
 1jIDpUXY5mLSHXTBrvHdUX6k60h0nmSOtaSHaJ5CwTfVjYRZOIFm/d4lNiJWerGRMV4SQe4X3ja
 ElpspUQUiXTLqsn/oKdVztBdHfQ6dBu1h6OxB2jg7DTnJ6AetZfAhGOhrKSrpBxUEiHqsUzniBf
 Qag5wN7j1cez9TTi1UBpsMw6M2SvVq8S0qOP5bjLmfgCM19TW6oj+mzMS5upC5HYbqPxUQPaB+v
 P60UueWK9KgDiWBdgNtF7igKVWiFUTIEWQ6QMcJXKpoEERLk+oq8SMJdcijxhcZajFfXLZ8ouPb
 7JVcABKecdQB2lD02pkMg3U3BQVszqyyGcfNur/rhPdzgIclUBm8MnHdp9vSje5kjv9en9QKHJ7
 CW7zKKKB9MU7VCUdHsUfXx18MOWWzL8fPwQ4+f8fmMkJVNPopP10lUZ8soUJDtOHhihRMiplcJ0
 rkeqaq6C7WB9ZccLKFP7/4brEWVRkh3IYNwuisoflhZHx81R9osQr0U+ln92f0YFQukvCpWQOU+
 q9SJQrjsARlsv7DOFf7Er6rfjK+fnpLqp2sGBwUL78PcdMaGpX/udpqn/CgJO8S9HPHgVVsOBrg
 xHABeyImOD8ufjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: EVAA5eqM_EIf6zEi5fIbamcIG81ShHSG
X-Proofpoint-ORIG-GUID: EVAA5eqM_EIf6zEi5fIbamcIG81ShHSG
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c5829 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aMBEx6ZYl_lYKPCdRXsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX1VIsucapwLRo
 3128wi8EVL3U9dwysI0qn773uUC/wMwmrPbl3Zm27RzSIitgC77Gu/ojZMptcKyIy20MfgJERn7
 XIFQbcVAkLdJaXJDf0WGccCYSuUoV5S7ck3iuu0Mrh/bHtZP3uLi+6OieFp4jUPpOQj/0qjQ/9r
 1FAbaEnlTxujPG9X79GA1A/KRn/XoWr16N6E6nw9x1PadtLiMJ33vBI6EUzn/YZZtusEI/TrEw0
 4kV3A5ULd+8Ar3Op4Lfi/2hj7/Eh2skEosposOSZcPuRog4I0/bE9h+wx8qnqzKsjxfMvaulBO4
 SxX+DBFLsIDOgdZ5GWNrlgVXbqMVFzZsr63k/1EEYrfPTFGDz7jqYtP4JiqvR5BtB0jl3M23sV5
 KadP42Yl3fehlsIwX7RWHmU2ynfYT02l/rm4QgrBvhPU+BPSqV51XxCqElVfFAFbe9NttHPefcJ
 /D+IfSq0d6/2q7rBIxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 15 +++++++++++++++
 include/linux/of.h |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2b9a3c67b5dcc0f95610a87c2e46f..b70aec32e0e35ee232b413e548742491bf763df7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,21 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_read_compatible - Get the compatible string of this machine
+ * @compatible: address at which the address of the compatible string will be
+ *              stored
+ * @index: index of the compatible entry in the list
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_read_compatible(const char **compatible, unsigned int index)
+{
+	return of_property_read_string_index(of_root, "compatible", index, compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_read_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index be6ec4916adf522aa5e4dcb1480fe91e1a4e29d2..7df971d52b556f21b510a8b5ebfc8df49a2a6f64 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_read_compatible(const char **compatible, unsigned int index);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
@@ -851,6 +853,12 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }
 
+static inline int of_machine_read_compatible(const char **compatible,
+					     unsigned int index)
+{
+	return -ENOSYS;
+}
+
 static inline int of_add_property(struct device_node *np, struct property *prop)
 {
 	return 0;

-- 
2.47.3

