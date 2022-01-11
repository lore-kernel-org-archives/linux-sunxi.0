Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A72C9C
	for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 15:57:35 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id x7so57902410lfu.8
        for <linux-sunxi@lists.linux.dev>; Tue, 11 Jan 2022 07:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wirenboard-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nTUgBUzWqYITQnAEDWeHOtQPiYS2wv61d5KwBi3uYs=;
        b=t84dYxCCv052E4gw3UFG/bbNlvC8YH8gRdSgmtYiwENmKguYf09md0nJys7744EKcC
         Gb18/zBvF7TLIj8+vZBwHGt+hft0CIAnff82KzRuskCyFc8yQOJw6Nu6hcXE99ke0sAm
         1tAe+v9OsXmA80J5pSeGvWogw5cMcB/vs5exZWVIINMYL8DeWujfwdVFf+RIm+suxIoS
         6knSFycPXx9hDxLxMhOv0ymGkjJ7nd3loxPGiSTqrx6JuowFH4HxehN5hG3v84ncX3+b
         6zqraG1VyL0SdOUHNRAtcoEqagW5t7uEvEQsqRz3VpCoWQLqQqc8XIBNZoyYoCgRAsd7
         DQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nTUgBUzWqYITQnAEDWeHOtQPiYS2wv61d5KwBi3uYs=;
        b=FWB3QWf4tNw/0dzYHV81YzboWeayqPYF3YS6xdAXOo6nGZ+TOvjinOSuQDKnO8as2q
         EMD2OaLP4Lmvx2N8IfOhHV1z34ovk3ug/fqHd8UzMQBIEPVpBeyNYhNYQ7WpdmS261la
         NxDeXju5/OBlM5Qyxgi67QszYuN7nTrSQPVwYTqBzAX2+/ZR/1DRbDDdieouofCjf+ag
         X5r9nTxIF+Ud58pKhYFF6LUyJP9Twn7sJ7HjEoCdHW5ORuT7DJEdTQujBdPyWQ5CorDW
         ZlBf7mmnmM2QohQMGxbm1ZKfRyZrcdwj4k0djCtOI84DLG0b2cYXjWw9bPJQtqDwWU4P
         GUVQ==
X-Gm-Message-State: AOAM533+lf5fBvEs3j92Za+z73SBYPMtHh46JzyQ5Fqi+XCHX0aqN5zB
	W9vcr+qBfWmVH8R9AGX2Rn9mxg==
X-Google-Smtp-Source: ABdhPJxDkpX6B9o6w77LG43w7VqtyI0FEwgWWHHETUr5EU+pxPzv92RWWzfNd7pnF/3igejqxXgdoQ==
X-Received: by 2002:a05:651c:160c:: with SMTP id f12mr913606ljq.462.1641916654069;
        Tue, 11 Jan 2022 07:57:34 -0800 (PST)
Received: from boger-laptop.lan (81.5.110.253.dhcp.mipt-telecom.ru. [81.5.110.253])
        by smtp.gmail.com with ESMTPSA id y7sm1370706lfa.92.2022.01.11.07.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 07:57:33 -0800 (PST)
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
Subject: [PATCH v2 0/3] add support for Allwinner R40 CAN controller
Date: Tue, 11 Jan 2022 18:57:06 +0300
Message-Id: <20220111155709.56501-1-boger@wirenboard.com>
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

Changes in v2:
  - sort pinmux nodes alphabetically and mark them with omit-if-no-ref

Evgeny Boger (3):
  dt-bindings: net: can: add support for Allwinner R40 CAN controller
  can: sun4i_can: add support for R40 CAN controller
  ARM: dts: sun8i: r40: add node for CAN controller

 .../net/can/allwinner,sun4i-a10-can.yaml      | 24 ++++++++
 arch/arm/boot/dts/sun8i-r40.dtsi              | 21 +++++++
 drivers/net/can/sun4i_can.c                   | 61 ++++++++++++++++++-
 3 files changed, 105 insertions(+), 1 deletion(-)

-- 
2.25.1
