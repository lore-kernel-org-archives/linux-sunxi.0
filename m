Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1EB3B5318
	for <linux-sunxi@lists.linux.dev>; Sun, 27 Sep 2026 02:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477804; cv=none; b=W0uKLtpP5ECdo1SxL6Xc/2yj2uDgdbo3/PeCZQgCh6ZGqVKUBIkPXI81veOiTLBZ+Bh3rApjSi0ues30XzeQEBysiKgMG30LvLIWZc30Qar9QNzk9YMpSKlqALJ/Z0YESAcvNhYM5Gd9sgI8UhySNgdnKa9xXAQ+xvGSKdjbYbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477804; c=relaxed/simple;
	bh=eMvIylI6UdB4voWaYZ2XSYSfydZcKpLaBkAqaZ9abjI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lUTtjN5NO+ifkBuiZzhPEDRSZD/CzWw1Yc3LQyrKUlwqWUNuVU9aZOPYwZShjBispLzRV+oNU5UUY/ykl/Gvq8xgP/TzQYl1DkEu5N2fSXhMl5kkRwXCTPzG3GBmm+LLE22Ya/FcihF9iu1htqrl8+wLa5Qg7TX2Zfi0MuEir2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog; spf=pass smtp.mailfrom=embeddedlinux.blog; dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b=js18oGuV; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedlinux.blog
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedlinux.blog header.i=@embeddedlinux.blog header.b="js18oGuV"
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2df908f4bccso13672985ad.1
        for <linux-sunxi@lists.linux.dev>; Sat, 26 Sep 2026 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477802; x=1791082602; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=js18oGuVm/FsOgAAuu6l7hrZ06rpF7hZ+kzJjzsTD8x8Wx4sF8dQpFMyv3/baan3GQ
         tahuQRMDDbQFQPD+UD+6y5ijsNnkestM15irFBTJiXyMT9pLWJr3UobC2nx5uShadiZR
         ap5juhsVNGP6XQBSbMnPR4+FU7XYavf3rUeJBgd5Bp0ZmB0wXo263bQRvZCuRB1+xNkV
         hle5/tD/LfhibVGCsMshC566ZuMoehiXJgIDVYoniMRbhb+fR3pZJolE5qm2kA6k2Oj4
         YtPBDLwpBnTrSV2HGyroSVjP08GBMocZVwDjRedGGjV1uYHvuGwc8UnDx0QprX1NRaBR
         cwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477802; x=1791082602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyMsLj0hkCZGFDmY3GbC7EId9UWnZfSNH3ILjJaXTeM=;
        b=e2fKX1oAQC7J8oLxAAZc1GK0VjBzggSs4RFyFbqOAR9gfr3+UkZGI8ZjuRHx+QYozK
         mavC5XYml3LS8JiIwvB7+71hOZikkLq/H/RUosjaZeRegYsEZD6hs229ezWBaq1cBczP
         Lq/AaHarErQgS9Z5mJr2sCTj70HL0RAj+K0/DAuRZqbh+p6Q7YCK2L1sSK/apooKRQZn
         WnTJ/VzOZxoQZHRAXTiZCkYMmkOPv1ELIfYq5Kz9rXw3tZachh8BllPy+P+MRAVrr4rV
         r9A+mnOAKwqbytgi8InKezSIM8Kzy1UmWAoTwSRucCXZA4+j1kdTJHz1X02cyH/XLOcY
         gTCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkPF0OM+W3vS6WRnA0Z/umNjXrQE3xl5wez6pZZ9NnD5PYK+5qxLhlYgIj63YpvLdEw2T7nmTZKfZVDg==@lists.linux.dev
X-Gm-Message-State: AFq9FYI7heItUZPuvQB5MYPkQZzRnyX6CQNJVh45F/pgZrgmteg9/yXh
	OiJ1IXEabeTZXnEe0Fv/L7qkSasdJVFeCJSJYR9z5qCibdQBiqpH1OeiPcJ9iV93+OUJ
X-Gm-Gg: AYBFou2H0TjVXRd1TFue5GxwwRHacUNV1PfuLIiDV+1wxGFhPPDy4hqe8AULbYDlmYG
	Drvwj3rKA11MMyDmRO7lbOZeNMIEOCPQ5XP0/teWycf9gtIUzeQyGi3IvFjSJAqnSbRf7nXSIhP
	JHMAKxubBxXN3o0UIxzNvHCpOuc/Hh9cLd2WafmQtI2CZ4PZCnom3yU5SMexeJxNc9YultIogBS
	4L2qe6PqZvl1F+x4coLxPur5Gf29WSaAx6GStZKkQZZby47knycsL+khI5cU6rsD8SskVj0tz92
	EuTnC9NsbvZZxx+DwHLutRLFuuMvZNkXmJVR7JrzIDMiQTaPy0/qVeMovMNOrdGi13kIw7WtClN
	MDdb01GWjU6rIUbx3t3r7srmk8YQvTzhT8dvp8F1oEk0iFsn507zJEbb6Jy87FdaumyJBycyENK
	HH4neValMTDmiYkO33EPAtEYo5HvxEyN6PlZmLcPzr8uJdmZP1SCiSJucLV6PTBpCVlA==
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr31921045ad.13.1790477801815;
        Sat, 26 Sep 2026 19:56:41 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:40 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 1/3] hwspinlock: sun6i: Get the clock and the reset without names
Date: Sun, 27 Sep 2026 09:56:24 +0700
Message-Id: <20260927025626.69614-2-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver looks up its clock and reset by the name "ahb", but the
binding doesn't define clock-names or reset-names, so a node that
follows the binding fails to probe:

  sun6i_hwspinlock 3005000.hwlock: unable to get AHB clock (-2)

There is only one of each, so get them without a name. That is what
was asked for when the names were added to an A64 node, and nodes that
do set "ahb" keep working. For the reset, call the explicit
devm_reset_control_get_exclusive(), which devm_reset_control_get()
only wraps.

Fixes: 3c881e05c814 ("hwspinlock: add sun6i hardware spinlock support")
Link: https://lore.kernel.org/f720eaf9-01d0-0e57-f6bf-9aade00aafb8@linaro.org
Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d3145880..e7cc121310 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -104,14 +104,14 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->ahb_clk = devm_clk_get(&pdev->dev, "ahb");
+	priv->ahb_clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(priv->ahb_clk)) {
 		err = PTR_ERR(priv->ahb_clk);
 		dev_err(&pdev->dev, "unable to get AHB clock (%d)\n", err);
 		return err;
 	}
 
-	priv->reset = devm_reset_control_get(&pdev->dev, "ahb");
+	priv->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(priv->reset))
 		return dev_err_probe(&pdev->dev, PTR_ERR(priv->reset),
 				     "unable to get reset control\n");
-- 
2.34.1

