Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF856FC1D
	for <linux-sunxi@lists.linux.dev>; Wed,  5 Feb 2025 12:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738759966; cv=none; b=hsXipXsO6Do1QSW0SSa86qvKCycfYuejnIcBtHNciMrdwfr60mLJk+xFIHRqbJ5ZzeX1DB9ssDrXrXiOfXfDnY1zIlyqmXV02pPMzFGZTxOJclkThlK5C3+9bk/qm27Zf4r0mTDs6dBM3VOTX0pmRj/GF7O45LCNgMdaS9qIySc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738759966; c=relaxed/simple;
	bh=2AZBpi15m5l7/gbXPtdQaBFdRVXHrWkje2q20fJpylg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dg2eSfEgHowK3ASzmHHQ+bIy0gTV/triY1HfGhNTj+hA35OmWk9YlMj94nRogf/4uriI/cMYn4wlecIL1qgL4ihfkxjBjW020hoc20IByK2QYF4cSxyXBKNskoaOC5jmm5tUQSU5MjU71j7aMHVjV50LyaegR8l2E2zYic+OFvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrI3o6D5; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrI3o6D5"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dce3c28889so363403a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Feb 2025 04:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759963; x=1739364763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QrjpVKFbSRrE6vHiGeiawaeS65c9c+jYODEjMxySj+o=;
        b=nrI3o6D5/tY/mp1lFGwFxzgvk8own3nL25Xcy091gqR7/BpHdVTkpsTHynru7AM28Y
         Q+CEgx450/ohu8nGi+zLYzHshicS+1Ve1xQie8tY9AFJvYKK6vlhNexrHZwykCgFUErk
         vP1cOWiAVY8VEb3pJFO4kkjX3j9M6oU3B0i3y0ZPxN6XFZAolj0Q+r8srXW4KJ37b5I5
         ypgBiddz5O5iIWHsManXnYndEyT1NGYK0Ma5gSmjdHdB0PIYuBikw48yK3Hp1+ONZhh9
         KY8oavV/OxngbWaTbbqhufZSdmLW2O/zoRRrdWNJtdMwpwbODDxrIMVrmWF4Nv2veGvH
         3H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759963; x=1739364763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QrjpVKFbSRrE6vHiGeiawaeS65c9c+jYODEjMxySj+o=;
        b=DCfv6tl0hZmAOjUvmF3zUr+OCyWZLB+Ui1O1br/6C5mxA2MWfOs/8WKoAARR/uPxak
         ZCPZe5iGn7VaplRZB8wdrYfD7N1a5F8r5t7qlttYuX86DPoo6M+Ob6mFSiaelTi7cZ/M
         fjnWxeu7pAKFnMFH96Sn5XR4X2AIrfRubLAt8Ng0KULPjlad6DcxaC4FoFYKb7F+WMH+
         UDDUyMRsUyD+Mu5Wl6bxjMxlZELIU09rueuYHE1NYTIWvjXetFSMijDaI366UrVLG1ER
         3VDq8nQnL4OoPlJEzJnV6AIk90ljVIUadci1NW3gZbwvnM8FncuQHdXnKMFC5ZKI5Gl3
         ijVw==
X-Forwarded-Encrypted: i=1; AJvYcCVAbOC6usKKPl9KuDNwxDZ+piC1bTotxwhKiYeRPDH7yoKLgtx1PHt8zVBdMuWSdXDrpjhWecrWVu0Q8g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvxTBTggM5uUQUC6wuPAZFdv3GvjJ6U7/c3nh8H5ick0/9Z3JS
	FIRDTTM0SytvIeRpUfUg+mAvKRGGzOXe3ZQnuz7tZFNbjNDX8HKO
X-Gm-Gg: ASbGncu0DCwgpixVfEs4I7DsLAq57pIke9KQZoo0tQ5rwqZuvN4N8mjYiiblevgOTyC
	q7kpxZSzPk5FDTGKWx3OsinbGjgyY+aWvMyrul8iZeXF3mDFwU0eZcOQdSqRQBaov3BKu2VLDod
	kN/Q9bcsU7INC/bR/GglUEHb3IPdDFUXi+cAe2/Eo4J1YFbul5AYlbkFp1+CN2g8QPFBvblQ1XT
	JRvN+m70ti30F4jNpoIZpJfGa7u6Ibr5pZsQN8b6/NxMDFZ2tJ5GNjQDJap+fmyP7wjOv1qLkH2
	k1qUrKKBnYqqNzFf4qqcux5OELuwtw2TYdeDJbx99j2tZQ==
X-Google-Smtp-Source: AGHT+IF6zoFHYoDLjXMYqUkNt9+F9g1qPDmsrM4f/DRoKSMpr0i16Ws07ZzIUfLBaqBzFn0iR+ySiQ==
X-Received: by 2002:a05:6402:5d5:b0:5dc:7464:2228 with SMTP id 4fb4d7f45d1cf-5dcdb6fff0bmr2892117a12.2.1738759962631;
        Wed, 05 Feb 2025 04:52:42 -0800 (PST)
Received: from localhost.localdomain (185.174.17.62.zt.hu. [185.174.17.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724055e5sm11559997a12.45.2025.02.05.04.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:52:42 -0800 (PST)
From: Andras Szemzo <szemzo.andras@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 08/10] phy: allwinner: add v853 usb phy compatible
Date: Wed,  5 Feb 2025 13:52:23 +0100
Message-Id: <20250205125225.1152849-9-szemzo.andras@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250205125225.1152849-1-szemzo.andras@gmail.com>
References: <20250205125225.1152849-1-szemzo.andras@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V853 has a dual role USB phy, similar to other Allwinner devices, but with
only one phy. Add a compatible for it.

Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
---
 drivers/phy/allwinner/phy-sun4i-usb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
index 29b8fd4b9351..1610501fb8bb 100644
--- a/drivers/phy/allwinner/phy-sun4i-usb.c
+++ b/drivers/phy/allwinner/phy-sun4i-usb.c
@@ -1005,6 +1005,15 @@ static const struct sun4i_usb_phy_cfg sun50i_a64_cfg = {
 	.phy0_dual_route = true,
 };
 
+static const struct sun4i_usb_phy_cfg sun8i_v853_cfg = {
+	.num_phys = 1,
+	.phyctl_offset = REG_PHYCTL_A33,
+	.dedicated_clocks = true,
+	.hci_phy_ctl_clear = PHY_CTL_SIDDQ,
+	.phy0_dual_route = true,
+	.siddq_in_base = true,
+};
+
 static const struct sun4i_usb_phy_cfg sun50i_h6_cfg = {
 	.num_phys = 4,
 	.phyctl_offset = REG_PHYCTL_A33,
@@ -1041,6 +1050,7 @@ static const struct of_device_id sun4i_usb_phy_of_match[] = {
 	  .data = &sun50i_a64_cfg},
 	{ .compatible = "allwinner,sun50i-h6-usb-phy", .data = &sun50i_h6_cfg },
 	{ .compatible = "allwinner,sun50i-h616-usb-phy", .data = &sun50i_h616_cfg },
+	{ .compatible = "allwinner,sun8i-v853-usb-phy", .data = &sun8i_v853_cfg },
 	{ .compatible = "allwinner,suniv-f1c100s-usb-phy",
 	  .data = &suniv_f1c100s_cfg },
 	{ },
-- 
2.39.5

