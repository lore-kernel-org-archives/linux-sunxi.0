Received: from mail-lr2-f13.google.com (mail-lr2-f13.google.com [74.125.230.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D578F49EC41
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161668; cv=none; b=gUrHJPCXPBR4TTyfspC7hwE//3J1pl1U4cKEptT2InBlvz96Krt3FylZa0gEX2TOzg2ntDndIK95RLT6rFcBhntZJ3oujaSDGtvV9Gk2wSPLY+vOXjwS76TFkztHsJH0dhpkv2i1mBDXGWkofl5qp3MjXiKWQfi5CQB00CO5Fpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161668; c=relaxed/simple;
	bh=Lp05HvS7MlHdv0hfaKJnvCR0qiPp//Pn4+6+M3Ynev4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fW4US2uL8eqwyGfZrmA2+qGGuGXBLFeWsZ6vQbNb0ddC5zU74+1YFHeuywFL+6E3uJIvWTjfzL5ISXRXmlUH88X+ZUM5LkLNSfB72ruTx6pb65kDJNybMSGQsbwlLdbLGyfRn0HelvGxXBQiB+JA/AZRuCAMn0jXwBKQoHLX3P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE6CDjI0; arc=none smtp.client-ip=74.125.230.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE6CDjI0"
Received: by mail-lr2-f13.google.com with SMTP id 38308e7fff4ca-3a302c06eceso6565281fa.0
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790161665; x=1790766465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z7/IdbLY9gftiE1cMDmaoR65MCls8WYbgHoLCd/1QnA=;
        b=dE6CDjI0Ny0CLpuMMeZZpqjRH8TIhdfQkWzcJqtSq9Z+GtOdbcJJMooZHeDo7s1ul/
         wIAIlGsKMgs/HTBsLk7OY1A55QLKdjTII8nL8wCnevvpb3R9TIZ0/VCZONtOX0ud+nOv
         9BENQfC1DSDpCLQ8wNPObcN9JRDYfOyE6mjFb2ZDPRZmvwKm1qvi7b42OjhiGyGJg1Zi
         uN/zmYkLPKjEnEXI9YZEgzvLiknpNQp0iS+WcRNmLuubB/Z98XZJYsZYMLpFsYHVi7Jf
         nZwjsRuQqzLHdB1A9Qmm3BmZPk0rssoSWhlTIwzVCyYU9JqJ7saUDTnPvtv4KSacLqdZ
         kYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161665; x=1790766465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7/IdbLY9gftiE1cMDmaoR65MCls8WYbgHoLCd/1QnA=;
        b=rN4DdXcHqQdyJUQlk3b6wT02wqe+zugaPHnmvuKgcTceVRpEuOiuj5as1exp+D4J/z
         ag/7TRZRucvBFwLv3kLcihlTsVyQHW3sMDPr9IhTvcTpmM1FhXbjo5NFco+O5VL/VmP7
         ekTlOM/+m1GP+Rc0PLbovNaZfWwA0NKRSglN0SaP1nZepXCpI3A/srs01/IYh/uiqzVt
         4JRWukzsh2vKXgsH67DZgvf2bFhM3/3qQLnz3uMrU5MY7DynVuLf8k73kJUv0Gg2pVVp
         9UB0dlaA+6qq6ZshoaFKKu3pU4vpOzNOz7SKuFmHSR/YOIOYxS559Ie+UiGlokkasqlp
         FySw==
X-Forwarded-Encrypted: i=1; AKwUvBznIy129D3qdl0JwXLNG5fNLuMr7oSE1UW48/GlOMnGz8Q2FezDwwVH69+w3ud73KB4yBuxHDDnpnlWcQ==@lists.linux.dev
X-Gm-Message-State: AFuF++maxAL0jPoN36xz5xU+9kzqHk9AJccf/3aKbcRTS7oh6g+qJfzo
	bdqf9xet1hfrAaCgJKB34R/wrFoJX3pQSOZYnn+iS0mN01oRa5Cs+iWF
X-Gm-Gg: AYBFou0VwG2RPXRLIdO06IDychx4Gjk+Opz1vdboUsSfqXE+nIjpEfMrCy3755uwfI2
	V8Llu5pUtLiaI4PGhje6nSA89zDfNXM5QJu6d2hOgyAAdYRQUvFvnkgzj0X3EiXJwvUlG+t8Vnu
	8Y+JW7KeEu01Y+60ypIDbXrQTaIQXcQpALAOKZW6yAgCTBTy2OAPOuFtgSaScxPbQ2T6EGoezfB
	p1wJAWpI54lUbBqJztNKpYWH9aSO1DWS5ONzfpoDgbiK5q0DE9hodv6rfFWnBS/19v2qrLP3dbl
	n3W/TVjHzJpvQrIz/Dwb+HW2iOSCOJoK1zIq54HnlQnyUhU2Co9Re7fNNB5kTvB7k79NQ4MCERS
	4OEjiVvFdV+gpmcAHweX+GBlOkmBCD+WApnNIG/XPsjDNBymZXeLR0axGBHSHuFhqRWanIUyvkN
	70EGgTbQZvmHa9UWMQFfFSsL830tKOxm1C4Nwum1Cc4r0Ei/03zzbjk3TI7tBGvFeACu0JgulGd
	lN2MIR0E2rW0O2A79KgNy9URV6ndJPL/b4gYeVf
X-Received: by 2002:a2e:bea8:0:b0:3a5:b1f7:a7bf with SMTP id 38308e7fff4ca-3a63063d280mr5098451fa.21.1790161664609;
        Wed, 23 Sep 2026 04:07:44 -0700 (PDT)
Received: from DESKTOP-7GRJKK0 ([188.226.104.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f5285b0sm6063071fa.35.2026.09.23.04.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 04:07:44 -0700 (PDT)
From: Vladimir <anykey196@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] Input: axp20x-pek - add AXP313a support
Date: Wed, 23 Sep 2026 16:07:41 +0500
Message-ID: <20260923110741.1880-1-anykey196@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AXP313a MFD driver registers its power button cell as "axp313a-pek",
but the axp20x-pek platform id table only matches "axp20x-pek" and
"axp221-pek".  The power button therefore never probes on boards using the
AXP313a PMIC (e.g. the OrangePi Zero 2W).

Add the missing id table entry.  Unlike the other variants the AXP313a has
no PEK key/startup/shutdown registers - AXP20X_PEK_KEY (0x36) lies beyond
its register map (max_register = AXP313A_IRQ_STATE, 0x21) - so give it its
own axp20x_info without start-up/shutdown times and hide the corresponding
sysfs attributes, instead of exposing files that always fail with -EIO.

Tested on: OrangePi Zero 2W (Allwinner H618 + AXP313a), kernel 7.1.13.

Signed-off-by: Vladimir <anykey196@gmail.com>
---
 drivers/input/misc/axp20x-pek.c | 39 ++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 24f9e9d893d..b912f13b607 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -85,6 +85,16 @@ static const struct axp20x_info axp221_info = {
 	.shutdown_mask = AXP20X_PEK_SHUTDOWN_MASK,
 };
 
+static const struct axp20x_info axp313a_info = {
+	/*
+	 * The AXP313a has no PEK key/startup/shutdown registers: AXP20X_PEK_KEY
+	 * (0x36) lies beyond the end of its register map (max_register =
+	 * AXP313A_IRQ_STATE, 0x21).  Leaving startup_time/shutdown_time unset
+	 * keeps the matching sysfs attributes from being created, so they
+	 * cannot fail with -EIO.
+	 */
+};
+
 static ssize_t axp20x_show_attr(struct device *dev,
 				const struct axp20x_time *time,
 				unsigned int mask, char *buf)
@@ -188,12 +198,35 @@ static DEVICE_ATTR(startup, 0644, axp20x_show_attr_startup,
 static DEVICE_ATTR(shutdown, 0644, axp20x_show_attr_shutdown,
 		   axp20x_store_attr_shutdown);
 
+static umode_t axp20x_attr_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int n)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct axp20x_pek *axp20x_pek = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_startup.attr && !axp20x_pek->info->startup_time)
+		return 0;
+	if (attr == &dev_attr_shutdown.attr && !axp20x_pek->info->shutdown_time)
+		return 0;
+
+	return attr->mode;
+}
+
 static struct attribute *axp20x_attrs[] = {
 	&dev_attr_startup.attr,
 	&dev_attr_shutdown.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(axp20x);
+
+static const struct attribute_group axp20x_group = {
+	.attrs = axp20x_attrs,
+	.is_visible = axp20x_attr_is_visible,
+};
+
+static const struct attribute_group *axp20x_groups[] = {
+	&axp20x_group,
+	NULL,
+};
 
 static irqreturn_t axp20x_pek_irq(int irq, void *pwr)
 {
@@ -393,6 +426,10 @@ static const struct platform_device_id axp_pek_id_match[] = {
 		.name = "axp221-pek",
 		.driver_data = (kernel_ulong_t)&axp221_info,
 	},
+	{
+		.name = "axp313a-pek",
+		.driver_data = (kernel_ulong_t)&axp313a_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, axp_pek_id_match);
-- 
2.55.0.windows.3

