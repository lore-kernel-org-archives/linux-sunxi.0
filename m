Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C53039F168
	for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076296; cv=none; b=tZvwrHyzUmBKdWMMfByCOkePWThH1uEWIRVA/xHFalSXAhJlrhCwvb2SsJfoSbQGmR5bk4Mml8TyfuR8eBr9XeFFleCfFd2ZrpKYlWhc9KW/2p5Wn31/ZT7rFdsBT8pF52Rct5CpuTeL83WDXwJ0Z1ZyBMqtCdbdQFFeV+sxAHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076296; c=relaxed/simple;
	bh=Q4wFPJGMnZj3CekJ0BbunBaPUViZ/ENfbpq0d6PkpF0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HJRVwsVw8Xryt7TOOcC5zNAOlfpi979NdYbgzEP1vepUp4pt0ntyGDTzfoBP7OTJduPbItXYm/MATAXjwANDReyFePLMZBFGAbviBIIcXprCm4+5ECXfwF5SzL/FkOtAUedpJ5ocUfYUlwM/J+KS6ek6mYHIau7zxp+CW/o3hfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ALShP+Gj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ALShP+Gj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48b0d19cf7eso48207f8f.1
        for <linux-sunxi@lists.linux.dev>; Thu, 15 Oct 2026 07:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792076292; x=1792681092; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DerXhHtNp5KAS7b6YTtqVphbqoa4v22Zyi/1qyIXn6Y=;
        b=ALShP+GjenOhjk7MFzsQFmICUfdRbW9Yqcn3+8lbHsj9fJ3aO1THLaMvjjiSskOdvP
         4zOOGN3kN/YKBFFu1ZjRbZ6AVFPuerEylpzD9r1foEuthM1s/ndK0ccNPJqZ/MnbFCJH
         cdcFGiKlfEeEX6f95QVl0jnsMIZIQAfcZ7N9p2msf8S7mPl7KhTw11gbwaeUNP/ewaqr
         wiAT6UhsPQfdeL9UT6fDmUzYPZFqB3HqqVo5YxTCXRmRMuFTHUtrVloQeUmgH0aBq3YC
         bxt8Jhu/bEO4DnvOJtV3L4dKo1EMV+q0EtYg4KOlpsHoErzvng34wdn0U5pRHB4RLVm9
         8C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792076292; x=1792681092;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DerXhHtNp5KAS7b6YTtqVphbqoa4v22Zyi/1qyIXn6Y=;
        b=TpB/bNVDLaRaBFuXwKH9cfbgL0skSFmWRJkkbRx0MhcGI2TkD/ReDTegeuKBhlk52h
         PyyzphkHxJj6OveXEsC9CZBC6PoTBOhYB+8HXxwh0+m4TDErpoVehKvNkpT4gcAAhTVx
         Lzn6gb9XV8TnL24NVf/M5MLyTXo92pndet0wy2uSYuZ+Sf4qvnKMoaGVZKOWmG4HpMe9
         cut/PdZkzQNH01PLAciZoMvLFU6oQ0XxIEPWgC0/pbgNtd+dPTWc7LKlqaXLrHLNCLnW
         wIUlclQih4kcjxcYWTdOjhDRCQlPnL2tL4gpbD0RzTxHWaPF0n8vQyPPRJC8H37uV8Hm
         J0sw==
X-Forwarded-Encrypted: i=1; AKwUvByOSbd+sjtc1TLa5GA9VohFEP5UHje+vHA+hYMvYtqYZJALGzWU5f8OvDHK7KyS/4zsp1ICISLr9zb99w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIj5qJIeYh2XPeyCnAm/03Kx5kHEBUjwzpbA/mq2W3xtVqDmD1/
	KqrwClo+Zjt9IT5f/Oj9OqAkpQkKQZ4Ri0VflhqQPeloTGCO/7Ei6wqO+SP2iPAFIKs=
X-Gm-Gg: AYBFou2a3GntZSpJhEY4m8Vf5VxW1ftT+IA6uXGnf9rlVKQ2dbqOZU4tXABH2ufG92l
	pNA35xnh9Ui/9pLzEw2GRHVRk9ixxrBRDHstuPsXLPmt8iaX97mcxRY+pTkaLS7AmIzSchtISoB
	zeiz3py2hoADZMAZWBNyLprmi0GgT7hul2BdHTzMxZhCZPPYFdRRNOORyQN/prDtlFyWAM2GUiP
	RZc9eBb5aLKqgTln0T/RrTAkP9Uo+y2CO9mdscYFQjjFmpQ7LoicXOVGJpM1EFh/VRbkesiUfRr
	Raza7ej6/68nUN5S9KzbFCYO9rM3JqnGQuwMZjguR1d8ySFi+RQNsUVR5d8zBCV33idG+3cpdgu
	UUSBwy+CTQvz2BGurrAO4rSM1SaoueKSyGMJTbxOdFf4gWD7RpWmaKB8eJya/NF0qEsdx0Wz7yU
	LhraN4HaDxVV9VTmaCEh1/TZJYVw03kP/yQd7fmlOK82Ax7HQP+YSrgfdkuZPWJDeVklmxkjpNC
	D78Dpo+xgeMIYdNMgdgkP+m9nEXtVpgtPqUgN0nj2xEvxwbkmgplPPRkK9W9PaACmBJeOu1UHxW
	iHWubaV3Jq2dIJdJbmrQB1/g+Bi16hhhaokLsLgx+twfyPeqPvXNMXPbwO0=
X-Received: by 2002:a05:6000:2488:b0:48d:f3ec:e818 with SMTP id ffacd0b85a97d-48dfae552eemr686896f8f.7.1792076292078;
        Thu, 15 Oct 2026 07:58:12 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac4fd7sm19738293f8f.40.2026.10.15.07.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:58:11 -0700 (PDT)
From: Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH net-next v3 0/2] net: stmmac: Avoid freeing and
 re-requesting IRQ during XDP set prog
Date: Thu, 15 Oct 2026 15:55:00 +0100
Message-Id: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAETp0GoC/43NsQ7CIBSF4VdpmMXAxdLi5HsY01CgylBQIFjT9
 N0lTMZFx5M/+c6KognWRHRsVhRMttF6VwbbNUjdpLsabHXZCAhw0hGOkxItX3BM8ywVdn6w4TE
 kI4P2T4d72bUCRjH1iqJi3IOZ7FL9M3ImYWeWhC6l3GxMPrzqcaa1//mRKaZYT4QITaCDcToFG
 1VMMuyVnyue4QNk5BcIBZRcMSoYjLI/fIHbtr0B8coxUSgBAAA=
X-Change-ID: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Eric Dumazet <edumazet@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2378; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=Q4wFPJGMnZj3CekJ0BbunBaPUViZ/ENfbpq0d6PkpF0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBq0OnWOTQqxxX7nMcfeGzROflkt4bY/QjQzVNnM
 T0WFB3avd+JAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCatDp1gAKCRB84yVdOfeI
 oePkD/94qvwD54AknAWsteA5RKgdf3ycF1CoudrTwIUffTO+WlKSyjZf1IXhPyPGBv+rc5D0h0j
 134nan8y/SxRaisB4DG5I3QW/dfqHl1EsDIaXOlH3508Ejf85X8ldB8SYfMVXXfkfmzPaRtPnQF
 yhL1dHBAzxc0YvhbZbi0cFblL5FsAgtiRou5gSw8EJu3kPuRA2No9BKQAI4nRx7OC2DT120Zzid
 yS3+GFS5RCf7eJFv/B+EVVkQVvA2h8GLXlgOPxHCADMJprcgN9zBApQUVQ9/aidBXGy0Al3krY1
 ZCMoaLvOwNZGxhQ+SHI2oHP89pIMSvtw8Fqv4o4ZhX6Hs+6iUetprT+ZnBCNCjYH0tmGN7nDbhC
 GSs3NrUhy4zypAo1dtW3o3z0haqZrV6Y4R/yhdvXmF5s59qXkWIzaJc2JYKillkU9In4CFjOLeO
 QoipTKFtxxYOabsRledtwFrOxj7mRmpQZvgOC1YRSt1CPi0LHrQsYqac3uty/ITTwE2AyjE4s4n
 TzRONiTtBea07NtkLqyBhr8h0XaNpJsfI4DfKpD5NklWO6aiBNbzvrpIn891O0fSapIVzrXVi9X
 NCdoE2zwepxIN5q4AFleujozFjVaOkHOFYaNHhdWxNPFgIGlIXELUFgTHv9CLMVeN/ykoCxIH4q
 fWs8gQZruCYQHRQ==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE

Currently stmmac will run a full cycle of IRQ tear down and setup when
setting up a new XDP program. This makes tuning TSN systems difficult
because whenever a new XDP program is installed then the irq threads will
be stopped and restarted which will undo any thread tuning.

This series addresses this issue by replacing the free_irq() with a disable of
DMA interrupts in the XDP paths. The series consists of a preparative patch that
extends the DMA interrupt enable/disable functions and then follows with the
meaningful change.

These changes were developed (and tested) as part of the TC956x work that
Alex Elder and I have been working on. However the change should work with
any driver that uses the stmmac core and there is no dependency between these
changes that that work.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
Changes in v3:
- Switch to more aggressive interrupt masking to avoid problems with
  concurrent normal/abnormal DMA interrupts.
- Changed the enable_dma_irq/disable_dma_irq ops prototype (to support the
  above)
- Link to v2: https://lore.kernel.org/r/20260730-tc956x-stmmac-no_irq_teardown-v2-1-a6c31932ba84@riscstar.com

Changes in v2:
- Added net-next prefix
- Remove stmmac_init_chan() from stmmac_xdp_open() because it will re-enable
  interrupts
- Link to v1: https://lore.kernel.org/r/20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com

---
Daniel Thompson (2):
      net: stmmac: Introduce group arguments for enable/disable_dma_irq
      net: stmmac: Avoid freeing and re-requesting IRQ during XDP set prog

 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  | 12 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac4_dma.h   |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_lib.c   | 29 ++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac_dma.h    |  4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c    | 29 ++++---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 29 ++++---
 drivers/net/ethernet/stmicro/stmmac/hwif.h         | 10 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 89 +++++++++++++++-------
 8 files changed, 135 insertions(+), 71 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260706-tc956x-stmmac-no_irq_teardown-8a7592b9f8c1

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>

