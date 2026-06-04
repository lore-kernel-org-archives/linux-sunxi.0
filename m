Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.76.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC63425CF0
	for <linux-sunxi@lists.linux.dev>; Thu,  4 Jun 2026 11:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.75.76.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780572147; cv=none; b=JCY2omyHCiV4wc8JqaChHhuNXepiFBlF8p/OJWp4a6RWPKcFM6CR2tY1qwkbtmiYO/TEHi4JpUXWbeszgrqJt6CZiOeQX6nFMGr/ZRsavD4xyBby2eMCccUxf0SRmOtXSt4RPff11gdPJaj1qWfKmCgnEsa0Px4MWQYO9KuYgmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780572147; c=relaxed/simple;
	bh=I4ZBonFXXkUn4WQfeqtoe1y3yeK7a5pXz6lJaSDu4P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SEPHydmN+8tRWQJZNuSWjFnuyVRCusK7sHVBOBEK05NxcP8Z39DqUF3MLuP5qpaj6ApusDVdaltVGiJCJX1gdR2Eb51Fosv/imFNoY4v3LJPD1JkpRKJqYxhtgIXMD9mrZiBM+xTVvlZZexPwrYQR+RerpQ5GGich3HDBlQ0NA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz; spf=pass smtp.mailfrom=seznam.cz; dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b=iCR879YN; arc=none smtp.client-ip=77.75.76.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seznam.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seznam.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz header.b="iCR879YN"
Received: from email.seznam.cz
	by smtpc-mxd-5757bcb9c-s9zn4
	(smtpc-mxd-5757bcb9c-s9zn4 [2a02:598:128:8a00::1000:a07])
	id 38506878803f45f73aaef2e4;
	Thu, 04 Jun 2026 13:21:57 +0200 (CEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=szn1;
	t=1780572117; bh=wCEJ/9yhLVB8JdzIcP+db8CqyYZgJF5pDJrP/8tLAoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=iCR879YNeXrrl8oOQc7DgJZ8wIrA2BTQRmcLkyvfkH0E94c8ZPUTR0AhJcNZKzr87
	 GMCt61YCOnWvYYkUCQLEaPJ1boXU6TKy+7+r6qdI8J+sq+PsqwzLGHGS2cOLxIE/lS
	 YW98gM4iDb3yE7qEgHWumbNmwn+sbBftgAd1LmdPtqCec1loqVGVtXbJa5ergq3Go1
	 H/xF2wq+214/A+0YowZ/asWdu3rMvzaZRlDhxKpyBSNcrYWDPXHcgExF/pNEfh2tVv
	 SscYn6H4rcW087bLiRuheOukpZzuF3f7ycN12DYmz7eLoTGY19B+1aFSDj6vyhnfwy
	 H9jQXYMLqBnjw==
Received: from archlinux (ezechiel.sdb.cz [185.100.196.77])
	by smtpd-relay-b58bfc659-d5tsb (szn-email-smtpd/2.0.73) with ESMTPA
	id 9a322fe9-fdf2-4ac5-9e75-bb9bb4fd8000;
	Thu, 04 Jun 2026 13:21:48 +0200
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
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] iio: adc: change from %ld to %pe for PTR_ERR() printing
Date: Thu,  4 Jun 2026 13:19:00 +0200
Message-ID: <20260604111921.106936-2-vo.kratky@seznam.cz>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604111921.106936-1-vo.kratky@seznam.cz>
References: <20260604111921.106936-1-vo.kratky@seznam.cz>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Found by Coccinelle.

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

