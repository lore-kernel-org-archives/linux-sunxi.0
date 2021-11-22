Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B982C81
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 10:46:39 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id b1so78247931lfs.13
        for <linux-sunxi@lists.linux.dev>; Mon, 22 Nov 2021 02:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wuprcCzJz0EmXc1SE/2ky8W7hZ6gSGjF0nw9cYB1gCQ=;
        b=r9YtxbybrGBr+auu4rx2uoR9H9Jm9ecmh+VeP61E/AeSjxTWySxphi9EL/9NSpP4lT
         5frCpTbwRMB/MCsiYk//Vf1AgpariinQC+8qCZ6GFtZcN6bUPPXoGTH3u4j46VFg2GaT
         fFwrRacO3k1xIVtwOLFyKQR3lRHnwXwXidaLZAqxz0mgliWUWhkMYpc5tiv7Dkn2wfPq
         JWKqixe0voxrsnTOf5M1pGfvkN8USXnCoFOTwq7VuazQEXza9DzkoiA7+pSloin2Osmj
         rHi1Tpzb4JJkuVOPlTfd6HaXJ6MRpAs4kMkz04ZetizYmd1V1n7pkvtSwRhuwHG2vdpn
         ZGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wuprcCzJz0EmXc1SE/2ky8W7hZ6gSGjF0nw9cYB1gCQ=;
        b=gugfFGr9jrxQCM+jdOsYLHwV9LM4k5YGaj2e2qMs20W69a5WJJrSzoSHdRvgqBzxxD
         W9R33wcmP4ACeQg6l7ptkShDkv0zH4uGumnFsZt+W3pH7lnJfy9zP4mGLdfWDnOjWBWH
         1F+rpgYOMOGngRynlumD32ZsLi6nRP6brc6ZAsWMGTfsqda04/bo0u4YQZcNb0CJqHqC
         w7sCELdAD2rbmrqvg8ejhzb/jwE6D/UeHonpj07XxisTyB6TusbNLqPN5WVZfg+qyBFS
         3cyFDpjWh4Iq/J3Y4vsw+kq9hFdoF4Cii7hLHormJk0SrYXqkjeyTSLyjWWDfbBgzCPk
         ZwyA==
X-Gm-Message-State: AOAM532sccQSpr7rADJQ6qyXBQu3xnxZj4cpJDUat7qMw6pUCRhgFIP4
	62n8+z0vKb0gG8aDmfd9rUQGlg==
X-Google-Smtp-Source: ABdhPJwOABsSxGBKDPfr0l0ADAVn8o4ZcYF24gt2lFlOuUOEAgoIPViPmZf4oCO480Cq02iyZm4hNw==
X-Received: by 2002:ac2:4564:: with SMTP id k4mr55435628lfm.380.1637577997883;
        Mon, 22 Nov 2021 02:46:37 -0800 (PST)
Received: from boger-laptop.lan (81.5.99.121.dhcp.mipt-telecom.ru. [81.5.99.121])
        by smtp.gmail.com with ESMTPSA id bi24sm923538lfb.49.2021.11.22.02.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 02:46:37 -0800 (PST)
From: Evgeny Boger <boger@wirenboard.com>
To: Maxime Ripard <mripard@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org
Cc: Evgeny Boger <boger@wirenboard.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-can@vger.kernel.org,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Jeroen Hofstee <jhofstee@victronenergy.com>,
	Gerhard Bertelsmann <info@gerhard-bertelsmann.de>
Subject: [PATCH 0/3] add support for Allwinner R40 CAN controller
Date: Mon, 22 Nov 2021 13:46:13 +0300
Message-Id: <20211122104616.537156-1-boger@wirenboard.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allwinner R40 (also known as A40i, T3, V40) has a CAN controller. The
controller is the same as in earlier A10 and A20 SoCs, but needs reset
line to be deasserted before use.

This patch series introduce new compatible for R40 CAN controller,
add support for reset line in driver and add the corresponding nodes
to the SoC .dtsi file.

The CAN IP was documented in early V40 datasheet [1]. It also fully
supported in vendor BSP. However, CAN description was removed from
more recent A40i, T3 and R40 user manuals and datasheets.
Anyway, we verified that the CAN controller is indeed there and tested
it extensively on A40i-based custom hardware [2].

[1] https://linux-sunxi.org/File:Allwinner_V40_Datasheet_V1.0.pdf
[2] https://wirenboard.com/en/product/wiren-board-7/

Evgeny Boger (3):
  dt-bindings: net: can: add support for Allwinner R40 CAN controller
  can: sun4i_can: add support for R40 CAN controller
  ARM: dts: sun8i: r40: add node for CAN controller

 .../net/can/allwinner,sun4i-a10-can.yaml      | 24 ++++++++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 19 ++++++
 drivers/net/can/sun4i_can.c                   | 61 ++++++++++++++++++-
 3 files changed, 103 insertions(+), 1 deletion(-)

-- 
2.25.1
