Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60537407590
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Jun 2026 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574597; cv=none; b=L6z+1O9+KQ0zdueMLm3vLk6vJ4MdQRJ7z6AwRpwN+0rQjJC9isR50bdBu1zctWbnb74Ex6YO1XFm8GS6/7+KcsiP7CSNO8NZ4ZLr5LpVMbGBF0CyvpAE5qbJQmL6RoCkTiMTb53ZXofhHJCdWS8wTaTmkXmT7PQ5ODr8ziqs6OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574597; c=relaxed/simple;
	bh=QFEQrU77b3rQqPpg15z8IOQJWoxfKOinMogreiAN7OU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJIa8xOVHNdeWKaeDYTU5VssIsrffZLt42Yv2I/pvT0H5j0Z0Gu1KClULhkHqfYBPn1XXzwqUh+tMt89LES+ZOcza7zLcwvinCDb34VEt2tfLuXhAXhkXrt343ln/+7WmB+sbsQZb+KYkPsnwtH0MYpOw4d9dHEnlvJs6DniPCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=lIJ33aU4; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="lIJ33aU4"
Received: from email.seznam.cz
	by smtpc-mxd-85fb448c55-l247v
	(smtpc-mxd-85fb448c55-l247v [2a02:598:96:8a00::1200:706])
	id 451ebd62fd7190ed47e027fe;
	Thu, 04 Jun 2026 14:02:55 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780574575; bh=yg44805tHXrZI2MFXh1k7JymAUPm/8cNpCDnOcYJ4LA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=lIJ33aU4RSOjH7pERYIWfnMajC6hGTYYVbtw9DXDvoibOvd72ilxSJFKi3GAr1OH/
	 1iYloXtr5Bks67Wuq+auD63ep3apxdaOGN1tlQWl7iS/QoNz2K4ktdqt2vLWAbZjFk
	 7bHoZtGla0z8rHZOIjGOjglkBkppT0yz1GoLubd0PKqw7kuMdUVESMkDu5hEaEnUHM
	 Rkbwms5Mpn9+EZ5PBimuntCTvygE52AnVi72YyZ38+SQqM5VSZ8HSFzJeWXeWTuTcf
	 R8IgBanROqPZB9hpP15ZDEKuw/u0BVfkQSIcbLP74gvk6T2Cg4opJlVmL/QqohkJMx
	 fMLJPkfBijNGQ==
Received: from archlinux (ezechiel.sdb.cz [185.100.196.77])
	by smtpd-relay-b58bfc659-k9lmt (szn-email-smtpd/2.0.73) with ESMTPA
	id a1f98a3b-d877-4d67-a75d-db9b2bd38245;
	Thu, 04 Jun 2026 14:02:52 +0200
From: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>
To: linux-iio@vger.kernel.org
Cc: =?UTF-8?q?Vojt=C4=9Bch=20Kr=C3=A1tk=C3=BD?= <vo.kratky@seznam.cz>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
Date: Thu,  4 Jun 2026 13:59:22 +0200
Message-ID: <20260604120201.116925-3-vo.kratky@seznam.cz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604120201.116925-1-vo.kratky@seznam.cz>
References: <20260604120201.116925-1-vo.kratky@seznam.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace numeric PTR_ERR() logging with the %pe format specifier
so that error values are printed in a more readable form.

This change was identified using a Coccinelle semantic patch.

No functional change intended.

Signed-off-by: Vojtěch Krátký <vo.kratky@seznam.cz>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 479115ea50bf..5d7a61abcaea 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -508,7 +508,7 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 					     &sun4i_gpadc_regmap_config);
 	if (IS_ERR(info->regmap)) {
 		ret = PTR_ERR(info->regmap);
-		dev_err(&pdev->dev, "failed to init regmap: %d\n", ret);
+		dev_err(&pdev->dev, "failed to init regmap: %pe\n", info->regmap);
 		return ret;
 	}
 
@@ -639,8 +639,8 @@ static int sun4i_gpadc_probe(struct platform_device *pdev)
 		 */
 		if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) != -ENODEV) {
 			dev_err(&pdev->dev,
-				"could not register thermal sensor: %ld\n",
-				PTR_ERR(info->tzd));
+				"could not register thermal sensor: %pe\n",
+				info->tzd);
 			return PTR_ERR(info->tzd);
 		}
 	}
-- 
2.54.0

