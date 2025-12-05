Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F3131BCA4
	for <linux-sunxi@lists.linux.dev>; Fri,  5 Dec 2025 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764928986; cv=none; b=SchzSJ+ooVLtw9ZzVqgQQoUqaVgaTsMbd8mea69Ut3VgVg7T1rZkWIHHdq3Enrpxo+ewZo4xYrvt9u2HUGrEcYvuNDo9/Z2BYyBrS/NM5i4TjYTM8q3YxGV58WtMbitZXEoec273lSyCtiHoh3ZpL082kaRdpynf3XErS0nQ5oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764928986; c=relaxed/simple;
	bh=E+jwMRHHZybmz0cjdBJ9Q1pXIXN3EdGlQG5G/l1wNzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H8pROuqezyi+qmD4+aCtsdL2CKDi4dz4twG3RYtK0gk++AVPw2v2Pw82OD7CNQ1RXggDwn7+xIJ5L9/CUYjC55koAmYLMUnBjruEc1TDZAUh+9bMeKdnBYNCfV6J1TiouynpOVIWPin85EiIFXRsTH7VZFbt820/6ZlheT7WAfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pRDeWFnj; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pRDeWFnj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 41864C19649;
	Fri,  5 Dec 2025 10:02:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA47B60731;
	Fri,  5 Dec 2025 10:02:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEA2810B60754;
	Fri,  5 Dec 2025 11:02:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764928969; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=ciEYlRaPS29SaCNp9VOvzP0yjCeypafv0bVq1+Exa2s=;
	b=pRDeWFnjBi9qBkYJ5mUydyXd3bbtI+w5dtoQsGf4P1mVceAA63VWsCIaT1pDExR35Q5nZ4
	GinRGHtBNm+VZ1Z4dGA0j75YHM1YkJwqVr8paEwst61yaDwetFAY36kWVRHd/qMPHpuEjs
	vXMygmOkRepWb4BINhFAIXmCt2mMVHRpIPqa83f/sKBye6/AB32vELhzyALQwfUFh9oH49
	yN4WRVt7NSN5kDGcbUGvvvHrgvnHjeFl0w6c22/nIzaTyzTqDVsqbgNdlGQIjEUPg+SHzy
	yKCngu/dtndfg5ixDm+1YCsdns8r2RCA4ZIyjBsSbni8hP/c30TC5QF+m6WTvw==
From: Richard Genoud <richard.genoud@bootlin.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 0/4] Introduce Allwinner H616 PWM controller
Date: Fri,  5 Dec 2025 11:02:35 +0100
Message-ID: <20251205100239.1563353-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Allwinner H616 PWM controller is quite different from the A10 one.

It can drive 6 PWM channels, and like for the A10, each channel has a
bypass that permits to output a clock, bypassing the PWM logic, when
enabled.

But, the channels are paired 2 by 2, sharing a first set of
MUX/prescaler/gate.
Then, for each channel, there's another prescaler (that will be bypassed
if the bypass is enabled for this channel).

It looks like that:
            _____      ______      ________
OSC24M --->|     |    |      |    |        |
APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
           |_____|    |______|    |________|
                          ________
                         |        |
                      +->| /div_k |---> PWM_clock_x
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_x
                      |   |______|
PWM_clock_src_xy -----+   ________
                      |  |        |
                      +->| /div_k |---> PWM_clock_y
                      |  |________|
                      |    ______
                      |   |      |
                      +-->| Gate |----> PWM_bypass_clock_y
                          |______|

Where xy can be 0/1, 2/3, 4/5

PWM_clock_x/y serve for the PWM purpose.
PWM_bypass_clock_x/y serve for the clock-provider purpose.
The common clock framework has been used to manage those clocks.

This PWM driver serves as a clock-provider for PWM_bypass_clocks.
This is needed for example by the embedded AC300 PHY which clock comes
from PMW5 pin (PB12).

This series is based onto next-20251205

Richard Genoud (4):
  dt-bindings: pwm: sunxi: add PWM controller for Allwinner H616
  pwm: sun50i: Add H616 PWM support
  arm64: dts: allwinner: h616: add PWM controller
  MAINTAINERS: Add entry on Allwinner H616 PWM driver

 .../pwm/allwinner,sun50i-h616-pwm.yaml        |  67 ++
 MAINTAINERS                                   |   6 +
 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun50i-h616.c                 | 874 ++++++++++++++++++
 6 files changed, 1007 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun50i-h616-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun50i-h616.c


base-commit: 6987d58a9cbc5bd57c983baa514474a86c945d56
-- 
2.47.3

