Received: from a.peacevolution.org (a.peacevolution.org [206.189.193.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38460244E9B
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Feb 2025 21:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.193.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739050000; cv=none; b=EapdbYdJXSRQM9Uml438+zyYVeiXE6XjPLqitjcdTvOXOhAjI6xHNDghsN2BGSM9bTGS9NFLj2ypiD40fV83MdzMN8bGu44K/T3LglsdTrDNQw4cNDSv8JX7zDBYhri2Dfnomc+Hoyyfbfpv+o0FIQvW7GQo32NURfZfF92Ely4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739050000; c=relaxed/simple;
	bh=sYQ5qlKk18c0A4Z5LLru+uwYh/WhPZ5cQ0bbtmlDVSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sXPDWRLMRRgoiP90znijndkVINAW5kvw3diSqoRt03Q/EpmqVnNI+/5Xl+sPIMGHMG8D2Q/XGGpegLU1FVefLVvfuRFeMUNxobH75z4Y4QvzP6x9wntClFOWPpYOESdWN6uzqtb9kY212Bb6drp92ENtPNTETW8Bna2RWzCKcj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=LsMjVCFw; arc=none smtp.client-ip=206.189.193.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="LsMjVCFw"
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by a.peacevolution.org (Postfix) with ESMTPA id B852C41B41;
	Sat,  8 Feb 2025 21:16:28 +0000 (UTC)
From: Aren Moynihan <aren@peacevolution.org>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Aren Moynihan <aren@peacevolution.org>,
	Kaustabh Chakraborty <kauschluss@disroot.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>,
	Julien Stephan <jstephan@baylibre.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Ondrej Jirman <megi@xff.cz>,
	Dragan Simic <dsimic@manjaro.org>,
	phone-devel@vger.kernel.org
Subject: [PATCH v5 0/8] iio: light: stk3310: support powering off during suspend
Date: Sat,  8 Feb 2025 16:13:18 -0500
Message-ID: <20250208211325.992280-2-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: auth=pass smtp.auth=aren@peacevolution.org smtp.mailfrom=aren@peacevolution.org
X-Spam-Level: ****
X-Spamd-Bar: ++++
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=dkim; t=1739049390;
	h=from:subject:date:message-id:to:cc:mime-version:content-transfer-encoding;
	bh=2g66zt0j6YYPcgcDMhWi6vl+EYuVn16VPhbMythEXg8=;
	b=LsMjVCFwIJa0HVwKJ1MEfttPkxVQeapgp9+l2aCgIXIAXgykqVD5fHvKFiBzXjKkwrdkQ3
	KWcxtuV/We+qHesd72LHuukYRimqg69tT4PfsM0B+uBOukQQdpL6Xjws4ojfCEusID4sWX
	lw9Kv40lzjrzWkV7ItsbqWaYXJfFkEE=

In the Pine64 PinePhone, the stk3310 chip is powered by a regulator that
is disabled at system boot and can be shut off during suspend. To ensure
that the chip properly initializes, both after boot and suspend, we need
to manage this regulator.

Additionally if the chip is shut off in suspend, we need to make sure
that it gets reinitialized with the same parameters after resume.

Changes in v5:
 - inline STK3310_REGFIELD macro
 - extract a separate dev variable instead of using &client->dev or
   &data->client->dev
 - make log / error message format consistent (no period and a newline
   at the end)
 - add error handling for devm_mutex_init

Major changes in v4:
 - replace mutex_init with devm_mutex_init
 - code style cleanup

Major changes in v3:
 - Use bulk regulators instead of two individual ones
 - Replace stk3310_remove with devm callbacks

Major changes in v2:
 - Add handling of the IR LED. I was hesitant to include this as it is
   the same as pull-up regulator for the i2c bus on the hardware I have,
   so I can't test it well. I think leaving it out is more likely to
   cause issues than including it.
 - Convert stk3310 to use dev_err_probe for errors.
 - Always enable / disable regulators and rely on dummy devices if
   they're not specified.
 - more listed in individual patches

Aren Moynihan (7):
  dt-bindings: iio: light: stk33xx: add vdd and leda regulators
  iio: light: stk3310: handle all remove logic with devm callbacks
  iio: light: stk3310: implement vdd and leda supplies
  iio: light: stk3310: simplify and inline STK3310_REGFIELD macro
  iio: light: stk3310: refactor to always make dev a variable
  iio: light: stk3310: use dev_err_probe where possible
  iio: light: stk3310: log error if reading the chip id fails

Ondrej Jirman (1):
  arm64: dts: allwinner: pinephone: add power supplies to stk3311

 .../bindings/iio/light/stk33xx.yaml           |   4 +
 .../dts/allwinner/sun50i-a64-pinephone.dtsi   |   2 +
 drivers/iio/light/stk3310.c                   | 254 ++++++++++++------
 3 files changed, 178 insertions(+), 82 deletions(-)

-- 
2.48.1

