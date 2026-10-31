Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793413607;
	b=UxjpoDEgCz2e2xZ8eiIl36+KyXwEZme0siMPTBTX84QE288QVwQM/ehwVlKMAtU0JKC6
	 nxC9S6YxAkxdaNwMoxIl0w4/o74sfR9vDBUMfpWVuSSh/FxtMFsi8iL2O+DPNr60sGNYx
	 Lvfq+Ljz1/FAieNRttcT/aBSWYcjrQg1+/TPgG7ofxHduLL81SeRnjHpw7/JehqJTJPQr
	 IXdaesbORfu9sidZQ5hI+r3IQLMKGuDaSv4VN6fmYy3IZ0JHETIH8/u+jQn1dusMVGrLi
	 gq8zwAELha2jv3xZ3Le75gzF4g63fuLZm8MSoBGFSoZIUhSVbPAW9S7L4/IB9uEKu8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793413607;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
	b=d5r68hxgKXKyc+3IYGvNEZxO/lE1MkwfsKd9CgK98bW88KiTemgVCK1dgtUw3mszFnjC
	 s1nuO/PC2YZlsOiHbhMC9YiTqZRLxiH8jzUgCRUW0HBuagKW1Ea/BEZznyxO4A/1hppLk
	 k8WM1BuF96CeFXZSfqX9yeUzE4ZXJgAfkZ1d9A6IZDLIZhZXyU7n2as4UjvQqG4FftACR
	 0tZwi9dKByg/xJHc4kLzx9o4YXLMDcDJdB3kyL+PuMILkOND3/B7i97OQg0Fr7CknYV2p
	 EpwLDXpcGJ+/EdljuztR3nQyGnlpoSv4Lcbiy7LdMxae9+4gIOl2O85Vrg/63w4DFsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=delTqLC+;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBFC606A31D
	for <linux-sunxi@lists.linux.dev>; Sat, 31 Oct 2026 02:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FBFC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=delTqLC+
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-84a248254f4so956992a34.0
        for <linux-sunxi@lists.linux.dev>; Fri, 30 Oct 2026 19:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793413605; x=1794018405; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
        b=delTqLC+7352uo2rIzrkFslI1PQ1wlYD/VWBhl3pQMenSipqxENjm/B9ShcecjRrn/
         SRTtGPbDr6nFfwfzdLeuF8ExKKUqP4a+FemL4tbvN8P+P7/9+2X/ULRKqaC0GXe95wxg
         jdoBfQ/I3h/zTys9MocNq6UAAr6eMjlL1GFbMJUM2t9fqgNj3LNSUnKEhnHvV1xnB+eZ
         z8txgzxpsm6MkEj6bVpFYEvG1gVTz0g+rff3ouU2AuDvh+ZvMthSZghufB6NybEXWpsT
         /GO8FyDIq5ZDNRJH/SVXe8ivKt7RcQoZUR2mNgBaxdWQJ0RQJ9RTavemV1aR8oEBGJgL
         MCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793413605; x=1794018405;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dufq0gMTwMuobWdajbCSMPOQ8VLgRxtkcM3Ok9ZSSyg=;
        b=OZkGps2+qAADo7wt2+7eexDi1jxcyt/CPnqW1yorNEN1H6zBNU5Rof5OppHg3JSxC2
         QIQVyfO5IXzev/pi2tdRBG969cHxqo4Zo2OYp1Cmqfig1+bxQ9fmOrNOYlnjxw6vRAm3
         6C/fu24V+zzCrxnZiH5bc2/kFhCgT6qi5ByCp76rCSZZOc/y4CHT4KuanttKpY7o4WZv
         DhwSzaOnqSiEPrswRla9XH9dkTH9ojnrs3CD3chYYeyc5h4VasfcWQHp+jSrfAdHUqVI
         22MEaxW5KR42Po4WiinhlnR4ZuDmwoSkHKtw4TJimI36EuxEsWUM6aF7+3R8CI1RMWzP
         +v+g==
X-Forwarded-Encrypted: i=1; AKwUvBzSmdvEzaYxN7Zc6JrIqhxuaZ/rhfUEpHAr/VDRxhZjQRr3o8c1SNjuZF5qRA81Plrq440R4Q4g69vHvw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK6BcLhcSaY2vkGcPMJVsxwByAx64rFl6/eEXuKQTRgH7EXQmE2
	uIcL9t8XfWyFSfCpshG7l5a77DEe9n2mLmpSNDmG45HpaERQz+2el5PA
X-Gm-Gg: AYBFou2EjoODt0D3WrdiGFKeizvsfLGUDIpBvIBO2rqnU/dU3yjhGvVucbwLPI21DHD
	VtTaaZQoui72pJ9B51epK+i9BvYn8Ic44mp5xRW5TrSX8a7mL/A4hCgCSvVFK/5EnnEehtgZP1T
	RcJ19VDAZQFGEyJ08jxT57RtTChEg5RERgWCrjgdzkoHeMY/tRJCulgk+AZkNxIxfzc+Gzk2f8G
	9W0pXMkjBkRRK6fmMA8wsIP6ip8n8TxXyPII5ZZkV7m7N7Q/f7vZnRYxqegPXNEsLzismNCzy48
	lBQqDUfiSIyANNihebqD6BQ2VE9WkH/7s2fMqQbgcOa9fKusePTWrbFpDczxPGsWm1CiAYd/x99
	uWmjTeUFKn8tgWdZ46ozI5FAyFbmGRzOFuHO2IjN7uRxquhESdpEjETq/+xVqsOHn25SIDaLpbL
	GRWtRyxhuxMRr2sj2LD2vboXJIWnpXsvn6JVvqYvPZaOnh1+asXHdXmPoYMKGxxe+jFutZvzbJH
	nmcn8B8941MGYzsQWnhPBoRvSjUbNy130nNrIKLHbDDKSkacGCsxIhlmA+VRcN//0rOd6zELLdw
	Uy/zWQabjbJP6et/FdLtcGrzBty8yBZxg7G033NLxiLIXHKkbh8/QhNCPrDwmMNRSDNxpc5drJs
	m8KoqsQ==
X-Received: by 2002:a05:6830:7181:b0:81b:ac9a:5681 with SMTP id 46e09a7af769-85d3649ebddmr3195695a34.29.1793413605457;
        Fri, 30 Oct 2026 19:26:45 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355201f7sm3304636a34.23.2026.10.30.19.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 19:26:45 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH] clk: sunxi-ng: a733: preserve system-controller firmware clocks
Date: Fri, 30 Oct 2026 22:26:43 -0400
Message-ID: <20261031020640-263f7b05-a7s-clock@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

System-controller firmware uses the R-domain timer and mailboxes without
Linux clock consumers. Disabling these clocks as unused can leave
firmware services unavailable. On a Radxa Cubie A7S with vendor boot
firmware, the public CCU v6 candidate reaches a Linux shell but stalls
at warm reboot.

The public A733 firmware selects the RISC-V platform, reserves R-domain
timer0 for delays and enables both main and R-domain mailbox clocks.
Retain r-timer0, bus-r-timer, bus-r-riscv, bus-msgbox0 and bus-r-msgbox
with CLK_IS_CRITICAL. This keeps their modeled parents enabled as well.
Do not change rates, muxes, reset bits or unrelated gate policy.

The controlled tests distinguish the RISC-V bus gate from its separate
special clock. They support this set for the tested A7S firmware,
without establishing that every flag is independently minimal or that
all firmware services are covered. The matching A7S configuration
completed repeated warm reboots without clk_ignore_unused or a
register-writing helper. Suspend is not qualified by these tests.

Public firmware evidence:
https://github.com/radxa/allwinner-arisc/tree/79086caef1f6d1fb1cf164afb018f6e873fd9910/ar100s

AI assistance: Codex:gpt-6-astra.

Assisted-by: LLM
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
This is a standalone clock change for the separate A733/Cubie A7S DT
v2. It applies to official base d89e1d186ec9271bf78e62771779e9fc03bf0fc3
plus Junhui Liu's four clock-helper patches and A733 CCU v6 (eight):
https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech
https://lore.kernel.org/r/20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech

No Fixes tag is assigned to the unmerged CCU input. This does not
replace or resubmit Junhui's series. The existing public MBUS_STORE
critical flag is not part of this change.

The final A7S integration passed two RAM boots, clock-summary checks
and warm reboots with vendor U-Boot
2018.07-17-boot-aw2501-g4c7078cfdf7-dirty. All five retained clocks
reported enabled. The Image was built with W=1; the final DTB passed
W=2 CHECK_DTBS=y. Earlier tests of the same five-clock change also
passed four boots and warm reboots. These are system observations on
one board, not proof of each flag's independent minimality or suspend.
The DT test used a RAM-only BL31 reservation at 0x48000000/0x01000000.

Final tested Image SHA-256:
1ea68cdc5998b584f8a3e62c44a21e506a22a8144c5824d9a8485607a8f2bd09

 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 13 +++++++++----
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c   |  3 ++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
index b8f6e8c6e50735d702d4de8c6d320652358f251e..e9fca8af03cec39ac39d739d371f2d6e4f7e1044 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
@@ -57,11 +57,12 @@ static SUNXI_CCU_M_DATA_WITH_MUX(r_apb1_clk, "r-apb1", r_apb_parents, 0x010,
 				 24, 3,	/* mux */
 				 0);
 
+/* System-controller firmware uses R-domain timer0 for delays. */
 static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer0, "r-timer0", r_apb_parents, 0x100,
 				      1, 3,	/* P */
 				      4, 3,	/* mux */
 				      BIT(0),	/* gate */
-				      0);
+				      CLK_IS_CRITICAL);
 static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer1, "r-timer1", r_apb_parents, 0x104,
 				      1, 3,	/* P */
 				      4, 3,	/* mux */
@@ -78,7 +79,8 @@ static SUNXI_CCU_P_DATA_WITH_MUX_GATE(r_cpu_timer3, "r-timer3", r_apb_parents, 0
 				      BIT(0),	/* gate */
 				      0);
 
-static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer", &r_ahb_clk.common.hw, 0x11c, BIT(0), 0);
+static SUNXI_CCU_GATE_HW(bus_r_timer_clk, "bus-r-timer",
+			 &r_ahb_clk.common.hw, 0x11c, BIT(0), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data r_pwm_parents[] = {
 	{ .fw_name = "hosc" },
@@ -108,7 +110,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
 				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
 
-static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+/* Firmware can use this mailbox without a Linux clock consumer. */
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox",
+			 &r_ahb_clk.common.hw, 0x17c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
@@ -146,8 +150,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
 				  0);
+/* Firmware runs on the RISC-V core independently of Linux. */
 static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
-			 0x21c, BIT(0), 0);
+			 0x21c, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
 			 0x21c, BIT(1), 0);
 
diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index cc2b229e2e6a6072f95086ce21cba6545012c0bb..ca0fc95fade2a66bcb90011e654a603eb676fd0b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -635,8 +635,9 @@ static SUNXI_CCU_GATE_HWS(bus_dma1_clk, "bus-dma1", ahb_hws,
 static SUNXI_CCU_GATE_HWS(bus_spinlock_clk, "bus-spinlock", ahb_hws,
 			  0x724, BIT(0), 0);
 
+/* Keep the mailbox available to system-controller firmware. */
 static SUNXI_CCU_GATE_HWS(bus_msgbox0_clk, "bus-msgbox0", ahb_hws,
-			  0x744, BIT(0), 0);
+			  0x744, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HWS(bus_pwm0_clk, "bus-pwm0", apb0_hws,
 			  0x784, BIT(0), 0);

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
prerequisite-patch-id: 0df2ae41836b86fd868dfa01ddfde57f888f761a
prerequisite-patch-id: 88f3a431e7c551a9fa732f062188f10fdd362eeb
prerequisite-patch-id: 3e88bc873c909059d1199f82cda4013765e7a5e5
prerequisite-patch-id: 0dbc27cd7417352319a0705a051dff35085e8922
prerequisite-patch-id: 0ed6b92774b5b794761c7ce34db653a5435dc833
prerequisite-patch-id: 27ed3814dbd0c7ad830532ff125625917c873b4b
prerequisite-patch-id: 74d03898c5ce14763f4e89fb73e021de59f0fb9f
prerequisite-patch-id: 9225cb094cf6cbb338b14ac63711d68bed12d24d
prerequisite-patch-id: 568dae1c91a0d7318d6eb14a18054343b84b603a
prerequisite-patch-id: ff3806332e741f0e2c8dac1c11f4c71449c16c8c
prerequisite-patch-id: 39461e0543aefb5c40184664625cbab19ac8408a
prerequisite-patch-id: 6fc03bfbd343042dd3b660938fcc09c5e7d48314
-- 
2.53.0

