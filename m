Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585041;
	b=C9Ecgp2VEl7GUpGGo9CXXjwtRdAuaCeB8cOEkpDyq2ze5TWAy1/PphFqoU5qHgDCBG4B
	 hBvHtQUu3LjfPvZKEhmTy901oWDEFsgonHc0IfXSIriGmi/W2FXqR1ijwowL92Yt+vCKT
	 K+7d2lMMOFEim6hH4HkXxbeB5M+UW7hz/z754Uq08oXb7FnHWKiaBSeY56/ZlpF8mHx28
	 x9/U+32N3zropuxnDOCF5H4jFibSiwCyIdXoXvAveqNKQzH7WeNN3eU4K+gh6KdlaTcYC
	 fGnzluBZyNf+G86FbBD3W0cCFI24hpQlVe/yWQVncu9WUMONoJuA8H9SoXgn35rcXNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
	b=Y4Matwnvv/Rc7Phj1e+g/22ss0cqYGD2yFz3gzjkTMMROmEB6yCPvxelPi1tGj/xnj5H
	 G5XN/nwWNQgi7pLYJqQl2k5PChbgoe2l7RGlnz4XcjtNkOdiu14x6LR1tzx5DcNoJqSZ8
	 7eZ+Uw59FZEySKsPxJQGyBWzwnX6rhD9VyMIsqZnkXmwmZhSPZF4LxSZT6rOsCJFj2cIa
	 YoWNH8MYyv/+HSYM+zr3FB2rUGJSkllNO6AparoKNpzHZzFcCC1H8ObLU50UfZ2Ykspbp
	 U2k4Tyi9QVxdUblnrvTWXVR2dt9ZoWhAaa9XmhamrPauOc6B7hKjAZvczo/H3Q4htpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LreGoBaq;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C15A606A330
	for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 15:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C15A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LreGoBaq
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso19993865e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 13 Nov 2026 07:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585038; x=1795189838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=LreGoBaqpzX6k/PCn+UYXPiN0Rsihw3UE7X1veJKc6LJZSWUz5sXlD00AKPrNVptKG
         +EFFZFlDh8DMAox7t7MKAKKhGQJULxUDYTypyJUgiTIkQP9DuSp6RBI6ZoYHIfPCu3Ra
         9Nwtp+5O737Hw/3wrcAKkMF4ivcrtVyBGLp6TLDe0z0BoKtGeOIEMoBHe/YygjRo/1N6
         uxlccwUge7fWMOaGDZI2xCRvwOdKvLzi+LSkN3g9eAb/sGc0IeAcy6X6SEGAkZDI/UAK
         RtKtdrExFl5qlf21XxlNdvNSVAdwXjl+Xxz+8HaHjFDgFknuHAcTRm6Ykg7g9WLs8jvF
         OTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585038; x=1795189838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOarK0ZUP5B0bKlIjJx/4smq9XTzerMTaUSt18kN7Y4=;
        b=orxb+biT+X1QIoBxsKuEqiThEL/oYAtg9Zm1lto8ch+6Lov7CV3FCjrcbu0JaB5ICY
         VOpDlBD1+EXG78aZuwRC/kLboRfDO7JD/XzFlrh/BBJc1yE2urdrsi3qPdE1JFQtRUyi
         uUH6KE2ahNhWqzSHgwTG1Tj7lQAcX2KrOMf6fHBLjA27Pjdn5fPn2BZbs45xVdqFsx3X
         0TQqLbuvFB/T098aA7L48/XF0BXmTPu1BfkLclYTd7bZ6HWi/SuanQZV6FmGMOaxf1GL
         I/CqQ9mOux38iyS+vnxrPJriconrfbOF1xjmoIG5nMYSuqD+2i8pWCGNEOHHq7m5Fz4H
         hrfA==
X-Forwarded-Encrypted: i=1; AL+hErHP+hBd9r3Pci7zWQNjStnkwNoOuTHUedVtAcpJO9wjLZaBaArS4iOKwv6jzHXvVgWBk/Q98D5lkS1Xng==@lists.linux.dev
X-Gm-Message-State: APuU4Z/kizz1QrZlwkKvxHyLB29tSOj9ZOBbfC0rCAiB1KP26j9o2kTw
	z2yHm3dqySxqnrsrM3B8utvdNCzhw8m2Id0/f4/iAzUmJOP2uLn+lzn1
X-Gm-Gg: AYBFou0DlaSHYFKK8g4PtCuK4OR1z7VuZfzHvQ2MgkKzwUvsUv3mT/9gMuXuRGtfLgY
	oALTPwT434FNJ+7GMBy6NpUDSjZo2N8gzbw+CPG3iToJXf2VV+K/xDfLg6ZqPB7qXOsR60fikJt
	/Ea1apf7Y2x6fPabLQrT7wSdsoiQaf1ixdh7P8hNUc+mf9xwTJNpCIrU03rBLkhODSzzK4u0hwF
	8Sv8thgjonFVxF6g/0dBrCeV5V6uvvdqtVUzs+4mmfJzKV+wVu13rrLzWHPBw5BhLBtY0A5XwQn
	MwJ8g0jGMaih7sLTvMNwhNBx6g4K55O3kamLD7WFKOT3zlRhTeL6A110Z3oBvVWldLjTH8uFhRm
	nBcNrLIIXXPHtwvLCmhOm6coYKQ+pV1BMjYz3F8ZWjJwFZdcH+oMLc1Oa2tcErSWTt9t4Cs3xRC
	gTfYMAKLli1FxVq3U13SpMVBYcp6Q/A4NuxRrH910x+3Jn+rG/4uJ8rTaR9UqUH8eMI15bSyrV/
	kLS2bYvVFzgQBDVNMaYgW8CqXkbsw+Mi61b9AFAvdJ3N7MHverkGwE7Jn4sqCxCUoBVvITywNl9
	k2IcHS9CYdLzwNdqhnZfTa/33K2JBPrER+4hjpKyseVXhKrkzFcWrn/La+kmFZo=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr65527035e9.22.1794585038370;
        Fri, 13 Nov 2026 07:50:38 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:36 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 0/2] clk: sunxi-ng: add the Allwinner B288 CCU
Date: Fri, 13 Nov 2026 15:49:58 +0000
Message-ID: <20261113155000.84703-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book
readers. This adds its CCU.

These are the CCU patches of the B288 series v4, sent on their own so
they don't wait for the pin controller. The rest of the series follows
later.

The B288 is closest to the A64: most of its PLLs are bit-identical. The
clock descriptions come from Allwinner's BSP, cross-checked against
ccu-sun50i-a64.c. Tested on a PocketBook Verse (PB629).

Changes since v4:
- rename some clocks and resets to the names the other sunxi-ng
  bindings use
- build the module as sun8i-b288-ccu, like the other CCUs
- add the CPU PLL and mux notifiers

Pablo Mazzini (2):
  dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
  clk: sunxi-ng: add Allwinner B288 CCU driver

 .../clock/allwinner,sun4i-a10-ccu.yaml        |   1 +
 drivers/clk/sunxi-ng/Kconfig                  |   5 +
 drivers/clk/sunxi-ng/Makefile                 |   2 +
 drivers/clk/sunxi-ng/ccu-sun8i-b288.c         | 775 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-b288.h         |  10 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    |  82 ++
 include/dt-bindings/reset/sun8i-b288-ccu.h    |  45 +
 7 files changed, 920 insertions(+)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-b288.h
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.52.0

