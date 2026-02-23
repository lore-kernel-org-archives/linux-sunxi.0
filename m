Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FD323BD1B
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853874; cv=none; b=goxV5NRiZDaKs2dFqqnzJ6UUoDsQcVH3O1tHTn8rsOX9zmPqEC6/rgdAeNAXCQ0LhIKhAjaJi384LvQ1SgKckpaxDczVkzJhTyv51KYHiZK5CnaVD/Za7WUytuAEx2W1xdGmFnibI4rsdxhaC8ygu9b/V+ggh+4jlc4g6PfYiTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853874; c=relaxed/simple;
	bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amZRo4tlVs3nbElusX0uefc2ZzU4DUMaJFlAxhq54MDOdCOugpFKn1bw0vNdeHr1MhtKxf2kATrVVZJr/eKyA1e5n8Wmzkshn6JN7e7cdXYzNTIxNI/RTVvdfKY2n67tt431pYLGqL2FjJLnir3wX8GVvETD7m3jldYB07lONh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYXQH0Mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NtsPQNeW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYXQH0Mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NtsPQNeW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAELrR1921214
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=; b=dYXQH0MqntZSpIKl
	cur+MWYG1rIaZsKmNba1FmLfUAKXHNpGFVT+7SP8N7Tr5AlCyvB36GtjALEOK0Od
	ckgnz5RR9O4aFrgY9dG9vbkCWvnORORIkbDI6rQMYjlkJlXEGUAJgrR6C05z+OKI
	s2pN+SWQiFcc6QTY62km53aJJCbrN8W2V/UX3nX7OX+tZTf9xjin8hyGcqx7+M1e
	V9q8/0rgb0cWFYQ9bGW5KfHHCNrbUZHa9sNG92N0hLnZhjUtXpMiJmJdCYIsS/PV
	TbPUsydiR94kgac/pi380Uqn5Dnc2ixobvxW9uOduwCGdexZA+M9ply2XCIV42sJ
	toiboA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 13:37:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so4700843585a.1
        for <linux-sunxi@lists.linux.dev>; Mon, 23 Feb 2026 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853872; x=1772458672; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=NtsPQNeWZxfbXRgV9U5K+y90GYn3kutQfUnArxK9pGa3EZQWuTTRKmOam1siGM3ayC
         n3GPf9gCnbpvf37ic4++eHTQIFv3dVtX6+2M1O/3vwPzb3qbTACXNJHqTMIyzLl0jFHy
         mOj8joEB6JlaKGw4Xhfu8W+05LO//QhlAwCQf5uTJgTqWqz67z8F8H8mOBQ4Kns3PtB9
         p0rTqD5zSn3iLIU5pKKOZmu5eZ0wtFWSnZbKD8loeIItzMKPFOeAYPSc8N1wCi0dTSLb
         j5zxT00SaOUvSKUqClOBJ5HiJlTegQN/PgLQc6mCIcMEEnxb6aFIsLMslWmcarRIjBaU
         vlFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853872; x=1772458672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=GJKa4/k3o8tXe+ANYSm4J6efGSCFdqCDIXikhWh6hBbLY/IPFINCwjgJyD60pD+Wnd
         mkJLs7jAd11y0KDHNCj7Ic3Ng9BbCOpcq8kdn4KVYepcbBAp5+GbOFZSlcbjVu/SpiCc
         O9P8YbLL8MvHk6pvhbicWUbSj4XAUUw8bFWJN7W12wKifJBOZ8OrzgCBkok/19Tcwzhl
         LDexaS0RV8zkEBJ89CVJyd4W2+4wdWnxljhR9JVcVNt+EfsisjCa74gYEqdtvYnWiHKt
         LdxPrpXoOFaEV/mmHk9a2fwp7MlSD/YHWqrbbTBoot+RtheYi5ef+edNHUAfOldElqGi
         BuIg==
X-Forwarded-Encrypted: i=1; AJvYcCXlcw25nVJoubMG9CsEcyBCWMVhE36Hfwg3cIzR6vwN0defkOiXO/WJuLXG2btncynTHpyqJj31VwBFcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEMQBobDWlbdAk2+7EfnB6il9+IrLlDkOhfoW7mNZGbSC4fCz8
	Hjw36LkvlN6l8GegUW1cn4fg7uyiDiTz4Iw3JLM26IbHR8GJQ7ySaNb7+DSVnv4DmuubGJBdUps
	lcOcarzqTO18j1jQKmzu0Mrg/hZIyvP7FH5WjfBlNcYfieuocKlShDVJR6eKQLts1WA==
X-Gm-Gg: AZuq6aJqO/oT8rDABdyOOq3BIO5HsnJPeuR9BIixmbGWB6g8pX465ortMp+JrKAminQ
	pW7BKoANb44lZnU8Q+YPAMgdkN48H5z9vQdcmLwhnSgtL2Ky1ZlkwKJseqMjkTQ0kxL05Kvxg87
	KylE59Ho0bzrJ99jU0z7el/r5Sr/t1cvev/X7RPAlKxylIPG0lUsE4NiUmPKhUTl8fecUl7XRad
	LJWRxegQwfbgbv+DsHoKwMFBc91y/nuTrUgA5xkHQQFSzzLC4H+yLT0I1Xu43S46n1Lb0MBL+Ea
	wSxbbOhLz5stDgXm+0BMcl2QCyZj3o6Hl8Bd6Mc1NTO2dFXpvczlLoFJrd+CTTidXJrMm+Rejk5
	WHRdLRR94z86WBGp2czpts7EgRvYs6jpB6+ZS/vzhBXS611mpZZ4=
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068242885a.78.1771853871522;
        Mon, 23 Feb 2026 05:37:51 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068238385a.78.1771853870980;
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:19 +0100
Subject: [PATCH v2 4/9] base: soc: rename and export
 soc_device_get_machine()
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-4-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgdJ4S3kKQy7E5gZ1HH0U5SQZilqtbHrWuRg
 vsXfy1WCm2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHQAKCRAFnS7L/zaE
 w+ffD/9rAOyhycwaiVuwUk5IsBC6AoWuSyHbtclUsR021hX341sTNrodmTF9hBEyCYtfeoID3s6
 6v54GhA+fRlXWOiMcydGgtSfnh1/l9JMceBWhF24bHQuSAibluRfYEHlf3q7KsT5Hf7u/YfHdwv
 0S7/gjaeJS30/KeoKhxy+4i3Zl33BKt/7NkLDJK4gyrzhOJIecBLTZZbC58VhpbOwBq1uchfsSI
 eM745iLv/Vlg99B9GuBna643AcG2mK0QBRJVBqm0q3ynRf2uJ2T4i6COg66w12blMZcHrZK28k8
 SeC/oWmP91fpkpb0irJ/icN6A6vIIFFenIGT85YwHaTwE3+gvxjb31t1Y5KompcEwLIPOAfn/TL
 dWoMEdcE8krPx2hBK8ylSyyT9+SD1tMG85TZ4OKKbSixYU5XP/Bj6mVeGH9+9pKUqXy3PSuU/An
 V1NP8SeznajicCUQ1QJF93oKppmUIm1V5gQQKKxi1I+gWRG5nG5W0/uTz33jh3tvhXxt14vem2o
 0Y3AZokJjVKI8Il/350KT4+2vWorZeZjVtaku4rZgEEcoxjQ4q8YP+ic+Pt5ExHSIkYiEzhC5jv
 r0utAOUE+xo8SMXpcDj7WmsGu74rh8oim9GPqphG9oWx8OlsUhJ5jecRvSRHBK043p5Arv3iWI2
 hnk/0nakVnNjHYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX+RxiYgG6AoLh
 XtYGxHTbiGBnM9QZScxF36BWKYM4cO77njMIR89v0hP1iwdxZup4uNbElPtB9Ai3BVIXPiVXLUu
 EBtugI8Z9mz21agyh3e3sHdxGxcqwQtM6BL59NpnPJUbqT7N0c7OggjDeXYl1Y/bnolzkNf0x6W
 NK6FSD+XsnIwiNsaEvnGmp5AuU3TDZnLZ165mjL8i7NdBffZ9AmydJ/52oh9VQjcUxoGYGNsXFD
 LGr+OfKY0dkcHRY4Ic4ffe1IHiq6CZANJJkYMmHh6cFlPdcFPFKBP0SlopC7qhckayqPeQEwGe6
 S88IJ6xKrBUTMhUSuJIiGXdJi6a7vH3DDvjp4QHoKU9ei4GoIu0hJngz4rEnSGovtFA1s/Fbkqh
 7X7bfz+WTaLsgmRdjPZs66tM/tJPGDP4JDabbaCU64EMqyv8CsBhGEKTuSFCxP8w7hOToTobJMb
 +QcrzxcNmr4C82bFNig==
X-Proofpoint-GUID: B8NU_ge6x8JgHNLDd3OQ5H5lsIevBPG-
X-Proofpoint-ORIG-GUID: B8NU_ge6x8JgHNLDd3OQ5H5lsIevBPG-
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5830 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header and rename it to a more descriptive name.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 13 +++++--------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 48e2f0dbd330b8d402135ffa7308f454eb4ab7a5..65ce72d49230360c22a812cb9286e7fb4de0baf2 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -111,17 +111,14 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_machine_read_model(&soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
@@ -131,7 +128,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
-	soc_device_get_machine(soc_dev_attr);
+	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
 		if (early_soc_dev_attr)
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..f19f5cec18e28461fef57f22702d2c44a41e4193 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_attr_read_machine - retrieve the machine model and store it in
+ *                         the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3

