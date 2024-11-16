Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E15F1885BD
	for <linux-sunxi@lists.linux.dev>; Sat, 16 Nov 2024 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731780192; cv=none; b=Jl9QLMKpNY6nLPpGEacPFRRZMrlwEcrkkW2V/39sgRKuVTNkKyAGvURfZTmRoj5hwcx+1JHbjfkQ6+KwwAum0ExneZ4P7EmxnuyUX99mrHyaPiPWGp5k0eHh23VUajy6hK5WdAaEsiuyWccLYuNqHRmuJGe8I+KuNRRnZ6XSPdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731780192; c=relaxed/simple;
	bh=3fmsZVtcET08j6sLy4Df00S5MnbnA34nvqPE7UPj5hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NhG4TOTTpvwf0669LxxglheeCYR6HUqRg40/h3ZV6m95j3W4Hmn8dPZhWnt4HBIcnPtVL2aZH3Wbghr2fJo0FWKmkwLIogZDqhQL8DJrZkcazEW4nL8692mMsIJ9Qgq/5g3gA1MbqZItetqYArUUsB9q4buI+jfoa3DdaQdy0BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iwCPAmf4; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iwCPAmf4"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9ed7d8d4e0so101688766b.1
        for <linux-sunxi@lists.linux.dev>; Sat, 16 Nov 2024 10:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731780188; x=1732384988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aGohF+muowKkt4fdau+AubKELBZgZqyCJ8OaVgT7H9o=;
        b=iwCPAmf4BMERR0Na1y4BdYHtkf3eDlbc8IO3ua5W2fD+g5ECEjVNY08LydI4JHCq9J
         S1qSiWCCFfW7EFBcLfi1tck6O1QyWQjQoFuNgvefNhq43aVX1CUkXHUqoQGuGQdCtZhd
         W7rirxj6+Y8IgvubkshV9bu09F7WFOhUSxueQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731780188; x=1732384988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGohF+muowKkt4fdau+AubKELBZgZqyCJ8OaVgT7H9o=;
        b=MTG/cOXy1edgLsmryr4q2z4MIjuBuyNUaxF/3TUWN8p45MstSWNUNbeQeOwQ3WmHYj
         +zXfBpVSb1VQBU3aPi9GoPmNhpy6CTMWlDHlbcp1Hefs/yBEvyi5N+2DYfKJ/Uo4j22I
         TbBV0lHvafYNQK43h6AAh6eGo4M+Yb7yKGXekCgveuQslvu3PZuu5DduqhLo9Vy1FC8B
         gTI/01AakbVv8GMNNCLj94WJ3izfJXUclirqqPNSPz9O5tXzWI+uT0WGWzesCMxLKF6L
         NHrQYA86Luf48ZMOJCjNASXRcVKgJHluhDoU+fsgcMkr6u+bqAKkQkB38ikCcal5T2Jk
         5rEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ+wONPKSYdfWWxTT6M6ZEA6h9TTRZpx1Swfk+yVYdW2K5DENvqfdazrs2vWuCJQpqdMvtROpNgnQnMw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzer/fjn5/IeTA0JJVeWiPlpz2H+QXhqYN3hdWjxpc4rtjh/2hw
	1tCiSlCx2yy7PQp9SUcZ+IriAVqzVXFExX1gVIt6gd0TzzmUqFVaBlGTL3tIlmI=
X-Google-Smtp-Source: AGHT+IG2ObGwiCvfIl++zWd9qF2zaGLlhIycmyruL6/OHxRiEVmPAs5MlD90c/NhVLeiofEJ0atIOw==
X-Received: by 2002:a17:907:9413:b0:aa3:722c:cc8a with SMTP id a640c23a62f3a-aa483525d25mr654985366b.40.1731780186523;
        Sat, 16 Nov 2024 10:03:06 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20dc6d364sm329549066b.0.2024.11.16.10.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2024 10:03:06 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Akshay Bhat <akshay.bhat@timesys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dong Aisheng <b29396@freescale.com>,
	Eric Dumazet <edumazet@google.com>,
	Fengguang Wu <fengguang.wu@intel.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	"Ji-Ze Hong (Peter Hong)" <peter_hong@fintek.com.tw>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Marek Vasut <marex@denx.de>,
	Maxime Ripard <mripard@kernel.org>,
	Oliver Hartkopp <oliver.hartkopp@volkswagen.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>,
	Sebastian Haas <haas@ems-wuensche.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Varka Bhadram <varkabhadram@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-can@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH 0/7] Fix {rx,tx}_errors CAN statistics
Date: Sat, 16 Nov 2024 19:02:29 +0100
Message-ID: <20241116180301.3935879-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series extends the patch 4d6d26537940 ("can: c_can: fix {rx,tx}_errors statistics"),
already merged into the mainline, to other CAN devices that similarly do
not correctly increment the error counters for reception/transmission.


Dario Binacchi (7):
  can: m_can: fix {rx,tx}_errors statistics
  can: ifi_canfd: fix {rx,tx}_errors statistics
  can: hi311x: fix {rx,tx}_errors statistics
  can: sja1000: fix {rx,tx}_errors statistics
  can: sun4i_can: fix {rx,tx}_errors statistics
  can: ems_usb: fix {rx,tx}_errors statistics
  can: f81604: fix {rx,tx}_errors statistics

 drivers/net/can/ifi_canfd/ifi_canfd.c | 29 +++++++++++++++++++--------
 drivers/net/can/m_can/m_can.c         |  7 ++++++-
 drivers/net/can/sja1000/sja1000.c     |  7 +++++--
 drivers/net/can/spi/hi311x.c          | 17 ++++++++++------
 drivers/net/can/sun4i_can.c           |  7 +++++--
 drivers/net/can/usb/ems_usb.c         |  7 +++++--
 drivers/net/can/usb/f81604.c          |  7 +++++--
 7 files changed, 58 insertions(+), 23 deletions(-)

-- 
2.43.0

