Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF6917BA1
	for <linux-sunxi@lists.linux.dev>; Fri, 11 Apr 2025 00:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744331950; cv=none; b=TQ0YGsiA/kjyf1bWa455ANqXTHkWOFcI5SscAM/h9ORCMhoi56GD5foly1UCazFgghSui69t8BiHveMf3yTNKjJbucQQNBMyqc6mWGb+NijB6H6IpRO/TA4qUwgW3CQ5bdLqsxJXLM5MZpwMyXG2IRErgGxN6zkym9/0/KhADJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744331950; c=relaxed/simple;
	bh=iQ5x/Qc96rZ/PCJW8hewnQTM/hC7OymarH96ZYHDwuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cWVfOssrfrYf0lfHrlA40Z3YmlJoONA65K7uNjyGFBzv7rN+aH7Q6F3H3kjJKPD9w9OGdblHGUh7HQqDGyIpOUydMAZOrjjb6j0yRcyIjZJIQvJezxE1OQzvOQL5hW8pVxzWDiOh2x0GZe65I30L3Yq2uLawOWYmiMf70MqgJtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJF6/dVM; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJF6/dVM"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso11782001fa.3
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Apr 2025 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331947; x=1744936747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvlzBRZmcfQZqiC8OpRLt5DZkcEUBfxEVIIuGLShicA=;
        b=LJF6/dVMGuCJ5J63/FNnO6ZhdTNEiDyc/UkJ+s23GepaRd6uGJW+uYkCiy+E2ieAVY
         mYZox1VnOzCnBam/4jf58LaoLGuCmF5fQ/6cs7iS+0Qe3wuigKShcToOd8GMiuf5wBZv
         lIhXq9UoYPWIMvJQn+J87vFfjvR94HcD2X4nmdb/9Qsw+BJxF5XhWVsTNukn0H1j1/uL
         tmgwu/yvSv7mOh+rf1LyfjZbpC73HNDxc5Im7XAwuHuBiWK+uqbAAz+No46rxKxS+6Eq
         A5HYb/PQz2CvcOeDYnVzEePQ84RR7BXypZuvV0SrSYFOJULpWSJGhCZZQSQTuu4NOmFJ
         mREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331947; x=1744936747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvlzBRZmcfQZqiC8OpRLt5DZkcEUBfxEVIIuGLShicA=;
        b=FAEwkeTGbdV9wPLN8QeAdTfFlCqXASdAcptyBsTPzZQiLxeAsen8/4vL5mynZa613/
         pXocJPaI2RNHBQiiGoUYUxpBUdh4iha4Q6F87wK5SQK/bVqkhJ7JnlSIHaAON/qJOD68
         M2tibB2W8wH5OrW/lxXwbdJhJsgUiqU09XDfrKLsM4xWZuCbQkPztPAIznpKGuzFjbnI
         aXclwTqiS1oaybc6uhRLBWDSQbHfHl+62+R/QyM50zZSWhthpomloteZsBagSrD7J2m7
         aq8kV3xjtur21WsTAVcLbR44s0dLKul0+jOYMQocPI0MlYvqUwe1ubEADcimc4l1aqlA
         HGww==
X-Forwarded-Encrypted: i=1; AJvYcCXP7hHjRfMShyZnx/faq5AKwXaDf/YmccoyzJaghNc/Osk3bZdeKosiapcbXLnKwqUbXQTB4zpsbNiiYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAbit1f1+N6HvYFCCYyj0JlVWpt9uJSGSHxsjqrXvdMzkOD7oQ
	eXGeK1Dag9/utPt8Wfsw/tgqPOpbsLG3VD51jLJOZ9iIgRZmnfsj
X-Gm-Gg: ASbGnctu1HXuZiVcsI4Mt7wTQ8h+T90G06+Mm7fb6YRJyd5rHkr79f5Ei5CZiJ6JDGJ
	8lYzpqhh+V5qTqeN3fHUAN+BxOk87eaUzbHAicgZRWIMa9fVz4E7lV+ciUALKHnszOlKjgB9L24
	1daFqEFPYg+60USNUuXqqDC9X1yN/NL2qtGpXrBSSBADqA3Ie8jI9qA6I0WXvsynt5w8yydxBNb
	3vpfQXs6pbLs4XHH2BofcJlh6O9YF3qKRcQtcwToEpdx/TDn7QIpmyOTTu4lYGq/oYUauOsccTG
	gxaUleNwQdCMCLrEoHJTIyTJLO+Gt29gkbN6eWsCi4cVDkLyXpPUU5waBtKc
X-Google-Smtp-Source: AGHT+IEN5mMmLvML1RixznmVQhwUVwoYFg/6bDCB7jcePQLJIp/PR0tcJr9jJQCpqbPiczh3txeYEA==
X-Received: by 2002:a2e:be88:0:b0:30b:fe19:b07a with SMTP id 38308e7fff4ca-31049a8085dmr1938891fa.25.1744331946976;
        Thu, 10 Apr 2025 17:39:06 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:06 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 0/6] Add support for A523 Thermal system
Date: Fri, 11 Apr 2025 08:38:20 +0800
Message-ID: <20250411003827.782544-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Mikhail Kalashnikov (6):
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get to shared
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: A523: Add SID controller node
  arm64: dts: allwinner: A523: Add thermal sensors and zones
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |   5 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 145 +++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 154 +++++++++++++++++-
 3 files changed, 300 insertions(+), 4 deletions(-)

-- 
2.49.0

