Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794519494;
	b=KuWUSC7qYGlXMxZfNsOJNEWt8/30/Yby8ImSvTOCXF8/bnzAPnIIEyogF8tcPYFqa/EX
	 +uVJu82JcfdYmXiRJxdESEenOZ4ZaFj0d93N8qtomm2A8prXO2n2FPLFGHSbT7nGPqvgv
	 HDOKa+eF9/VrcdInLqnQUOs6TYk7mxCFg2odWZkSMzkjBzp6Q+mYjqKuvUTLWt87Nwzkc
	 0Tk/yhWyp6JTRPipR8Ct0TL01FKhq5DT6lXvJPgdc9tv+zmJDg7ZSNHX7b6keddNOzw8R
	 +KWAR/9foPeWgpndjXqb0W4lXMpTVIaL8yJiVGRVFg5nXLu1P3q9TFvxOH0h1D6nMJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794519494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
	b=5DhgU7V7G3/1jYEyp0agTn4noic2NHtL73dFLkNKjyzP8d49H5C0SCvKPy1+kmRmEiIR
	 /ibikvANhAFXHmCdqxYUtVlxlIqyW3vSDoajPkYxLwNROj4ELbvmF0Rehy/H6tQSkwpcK
	 nuxjQ1+U/kaV5Ljudbg3xWk8p1QneuVU8clfnsxmlgPXjyF5GpqjyB1YBbrMEjzMcilmw
	 glWKWHRh4rFBh6XNNiZZXp/XBteh+X6pcCPdBk5AfECaPsXcyfT06SYWYMHWNnVMb052b
	 OVojfRnApsqN+nVKFSxNHqRVv6t8MEdVWcGhIpck1bKgsZR5bQv0DE5yz4hJ5V54RIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MbdBOQiU;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9903606A33F
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 21:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9903606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MbdBOQiU
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6f8a519e215so480975eaf.1
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 13:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794519493; x=1795124293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
        b=MbdBOQiUuoXo/reoGucp7hbbWBVKwU0fLCArw7mxmHjb3QdKZmtf2w/VXOZWXB1dKd
         KZGA0IjpiLwV5Df9KpEPdO+CVhFfdzF5LCf6dPGuvDa0EqbAZLL5PsQqJYKQEnUnfIQ9
         dSaywXkzo6mcgQWnHc58oy7doBPcVWvErGjbC/gsyGuq9w3CeYPvRvYOfWfPcg8mw3Lr
         p4BOw7/0OcXZi7rXs6kWZLp3Txsd+Qy8JnqGgBxvHL92oDRThVy5Px3pvQFJZp5DMhOh
         bEg3Aj34cVhXOSZ70G3Y8fbFS1mwwlREOsyqHlLuVrKpPHNrHSadAnfsPrg+jeim818+
         vN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794519493; x=1795124293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaGxXuKjbqWsjiNJFFTn53rRjYcJvhNf+ZE9bk47lFk=;
        b=flfXcX328LCGn4/Hucy9l3WxeClPrkHuqYUX52ouCoAk6RDCP9VRzdkOQ9O8n2cksC
         abW0m0DdavRvvQb6vxvxc+pmjAD3VvXLiNvqPE3qmnnR0XJe1eTtyS8mS9FJsLbGzecM
         mjDVe7bRsKVi3fS+HtfOItKyaTXxHwpQVwg96HfTOmPir3Csn+lrPe3P5OuuSxT1ZLz4
         qR3UiosY8bpweV3OF/1Zy2Wsw92iVHfD5SqiGupiyTaqFx5d1f5HPyiQfBfr9B6dnEGY
         uYfl8M4qE7azk4ioJaGOolmkFjMgk8phbm4+eZVamB2BQzOlB0C99X30JDev/FqLkZhw
         o8wg==
X-Forwarded-Encrypted: i=1; AL+hErE63Tb3hVMFMqWXZXZWlULUoryyjcghIDzQ6u1FzowG47VVwy6yZdWERdQQzGG5OlHe5pp6zsUkx62VRQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+eqUD4nIhvpT2yuDe+gG5l8rACSkrrFnUkKHbOVp00uM8mtksq
	Da53qTowQnT3Bec+54haRu8uaBsB8LTzYCXEm3YT8rCQW45kUhtj4gY7
X-Gm-Gg: AYBFou1Nu6naYZE6fMVIWn6Istu+CeyN75hvFKI81kqxQM+vmuZ9aFAGlcF+seU+q8H
	CFZG0GhqGvAspuBtjVj2ifIIBj7NS94feSSVYfFWk29mTIkCq7u248ALLzq279HhIzjj1297jhT
	TOyXaD/EkCMw2buSbqL31NUopoLVIpWdG0uLYcEJQ9sWKU/WxbN+8I3kghWmicsDwiLcb39GYwA
	7tmep8/r8jUnnGbtBeI+XkiePoZXklpL9HU+NhjFAwNGFbwKYIbtEcxV6PcFJnDgK3EGgDMW7yp
	OLDJD5wACf9jkvl6d3v9MJmZ5+wRN1YHLBnSagD1rL3o/Ae4QiWfpU47uOmssHEyQPZ10DD+DXi
	0t0UDXq/+S6CjiFmTP2mzQN/Eur7FcC7jSmYkNEstpoS6/MC5fH/EVp8b6gPZL6GyBphrcwAV3E
	ahQKD9k7bDj5d4X2xOJWR9u5TUFmNc5INwOrWvUYgRXUHPpFekSgBPx5uLfkP0RSiBqVKoFvWkX
	h1JeK1fj2gS75Bn4BkLjVCwXBk1DEWHLuX9SSVtEFQMzs361c8ZanOnrYUnKG+d0G9tu+u2uL5a
	j2XaFn8zatVBvnHRCXoWHc/DXEgw9KUnWUlzRc7Fe7tgvjm+IJynguOjnz+pJv7lOBrsGHR/uLC
	sSGkA
X-Received: by 2002:a05:6820:f02d:b0:6d3:abd1:9b8e with SMTP id 006d021491bc7-7197cf224d0mr2811908eaf.52.1794519492651;
        Thu, 12 Nov 2026 13:38:12 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe229b9d1sm234017fac.11.2026.11.12.13.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:38:11 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Andre Przywara <andre.przywara@arm.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Subject: [PATCH v2] clk: sunxi-ng: a733: Keep SCP firmware bus clocks enabled
Date: Thu, 12 Nov 2026 16:38:09 -0500
Message-ID: <20261112-a733-fwclk-v2@gmail.com>
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

The A733 PRCM's bus-r-riscv and bus-r-msgbox gates have no Linux
consumers, so unused-clock cleanup gates them. With vendor SCP firmware
running on the E902 as shipped on Cubie A7S, warm reboot then stalls.

Keep both critical until remoteproc/mailbox drivers can claim them.
This follows A523 bus-r-cpucfg in commit 1dba74abf3e2 ("clk: sunxi-ng:
Mark A523 bus-r-cpucfg clock as critical") and the temporary SCPI firmware
clock protection for Meson AXG fclk_div3 in drivers/clk/meson/axg.c.

On Cubie A7S with vendor boot0/BL31/SCP/U-Boot and without
clk_ignore_unused, warm reboot returns with both clocks critical and
stalls without them. Vinicius found either flag alone insufficient on
Cubie A7Z. Power-off, suspend, single flags on A7S, other
boards/firmware and upstream TF-A were not tested.

Link: https://lore.kernel.org/r/20261005183038.417798-1-vinicius.eduardo.pedrosa@gmail.com
Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
Changes in v2:
- Drop r-timer0, bus-r-timer and bus-msgbox0: A7S warm reboot works with
  these at 0/0. Keep only the two E902/mailbox bus gates after Junhui's
  review, pending remoteproc/mailbox ownership.
- Rebase on CCU v7; its PRCM clock definitions are unchanged from v6.

v1:
https://lore.kernel.org/r/20261031020640-263f7b05-a7s-clock@gmail.com

Base: v7.4-rc1. Depends on CCU v7 (all eight patches):
https://lore.kernel.org/r/20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech

November 12 board test: two RAM boots and warm reboot -f returns on
Cubie A7S with vendor boot0/BL31/SCP/U-Boot, without clk_ignore_unused.
Both retained clocks were 1/1; all three dropped clocks were 0/0.
The no-flag stall was observed with CCU v6 on Nov 10; PRCM code is
byte-identical in v7, where the no-flag control was not repeated.
Runtime used DT v3 and its dependencies (all four UART v2 patches),
with the PMIC identifier and pinctrl IRQ-map context adapted to the base:
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

 drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
index b8f6e8c6e507..f2965daba0d3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733-r.c
@@ -108,7 +108,9 @@ static SUNXI_CCU_DUALDIV_MUX_GATE(r_spi_clk, "r-spi", r_spi_parents, 0x150,
 				  0);
 static SUNXI_CCU_GATE_HW(bus_r_spi_clk, "bus-r-spi", &r_ahb_clk.common.hw, 0x15c, BIT(0), 0);
 
-static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw, 0x17c, BIT(0), 0);
+/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
+static SUNXI_CCU_GATE_HW(bus_r_msgbox_clk, "bus-r-msgbox", &r_ahb_clk.common.hw,
+			 0x17c, BIT(0), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HW(bus_r_uart0_clk, "bus-r-uart0", &r_apb1_clk.common.hw, 0x18c, BIT(0), 0);
 static SUNXI_CCU_GATE_HW(bus_r_uart1_clk, "bus-r-uart1", &r_apb1_clk.common.hw, 0x18c, BIT(1), 0);
@@ -146,8 +148,9 @@ static SUNXI_CCU_MUX_DATA_WITH_GATE(r_riscv_clk, "r-riscv", r_riscv_parents, 0x2
 				  24, 2,	/* mux */
 				  BIT(31),	/* gate */
 				  0);
+/* Vendor SCP firmware on E902 needs this until a remoteproc/mailbox driver claims it. */
 static SUNXI_CCU_GATE_HW(bus_r_riscv_clk, "bus-r-riscv", &r_apb0_clk.common.hw,
-			 0x21c, BIT(0), 0);
+			 0x21c, BIT(0), CLK_IS_CRITICAL);
 static SUNXI_CCU_GATE_HW(bus_r_riscv_cfg_clk, "bus-r-riscv-cfg", &r_apb0_clk.common.hw,
 			 0x21c, BIT(1), 0);
 

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

