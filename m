Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B597A33AD9C
	for <linux-sunxi@lists.linux.dev>; Thu,  2 Jul 2026 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013701; cv=none; b=q90cNhEocfgFz8RiPHuUANm6pi8i2h3+JlJZ3QU9yT7cB0nbHqmmfL/BPlZ74ATxgf8+kDcPtfKc+SHyJ8jgxDR7yFRMIZUPt78HqzzTwPH1rH8eSJpmnp6NZLSGxN3kR+SwE/iSDQpNmLoHRVAPj+XpRZyk3kDHhm8WJuQ4HfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013701; c=relaxed/simple;
	bh=hEhWSLr++Q/ZGR1Ejsv0vtyDLrUAeGLaq6Kk+8WBNuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlOh6G3o0R6vzTpftEMcMa6+IFOJIrTJkTrpLbonQ3zQ/f9zn4Pk2B/UedjO/1vqcM/UXCRWgOmh+O89PC6KMTrn1O6zA0ly/GIYC6AFUJ0zsBRYKoEgdlZDuPSd+4P7PMxYAwBWLqpJY1Dg6LsbxFOfl2CBw08TEn4HAqw3Q7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQnler0T; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQnler0T"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-915ab38ac14so190290085a.0
        for <linux-sunxi@lists.linux.dev>; Thu, 02 Jul 2026 10:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013699; x=1783618499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=HQnler0Tm6VwwHIdoxiVA3VYTpRPqeNioAwO8gph5YdaZLQiOhLlZhVmf+zjIMIHC/
         DxdK8jBftDZ+8WM7It2ALgLHi92bN+3U7YEdn11fLAhMyJ7f85jRYDFN090RInjT4zZE
         pabHDJzFt2fQJicnliT7OZ3sxIhO0j5AtS7nUE8CgRGTp+kKCKE7G68LqLpy4BQ6ecqV
         jp6iVx7cq2DHWloe7WP4jrLJ3RzSpn5VZWaiiyqGOrLfBCUibcjHZ6TjrafBpneC61Kq
         bc2CWbAuO1qXYbKLXlDwJ8zGA0ys/nnucverrEiR4OeGg9azj879//gP1Ynkzvd63oDz
         BxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013699; x=1783618499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7qJKEGc46A6MaBdapnr1AnlxGbrLJznLMC+lsm+gAYE=;
        b=nJkC7AqEfMq44e7h7d26LgVpoG9+oLO4nhOXvr0f6I2VHJvcdwN2Zw/Bzd/KYV/+5V
         S1YzJwsf+lREYwMG4NnWUm16LsQtZog+cueQ6kbO+cR39ZmVcWwMGpYHJR6VvhTw9n5o
         Xx/pGmjiph3wXzokZg06KqBzHlXF+BhPddGo/xRtM772zloHDcagM/+klGboAZvpc3A/
         bkLql1HgV+fpqFt4fpa2z7ATlfHF7ALsonUOI6I/iFyUd8w9/VgpW3A+wZVM1HBufG2A
         t6ZR2xn1povY0aWwQeJe2FI+Dkhu1tiCom/rl2+Y5PLyoGK7KK0ERr9TdzK6+caebPd0
         qfWA==
X-Forwarded-Encrypted: i=1; AFNElJ/U4kv9uAJcbWb7RHSJ5eh09pA6Jp5WCyAe5p3PxGW7MWCL75DaP4qRhmITNkGAQ3P11JObhM6kJ76yRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6hC/me5sPbchOwolJQd5ybJr5iNsSEHZ1O130+3tr1g8/9MkC
	LBQbdD7jYSLL1gFrNiBN2DWrG30fBmRNy1ntD1AhWBEUmayxvOFP0CD+
X-Gm-Gg: AfdE7cmqr5vs01of9tUcZO4kAxMwn/1FgjuwB2vHMwE8Z2IzxbzKH5/moGiFRVD+3KX
	21RoNRCK/FsnP4AzAAWtBtq5bou5F4WSFJz4s6BwoKFK31D7MYjzA6YVFqz22kmfy2C8WzZVDXk
	8+t3uqyVbUskYTBm1uBtwOee1X/IGOu466esZT5ePLO1vdEw96ZrYFeY6qlfH4tW4xKFoCnZVSw
	N0CoW7meH9Fw6bpP9QdrqMr9GDA7b47EM78BlCz/awxcazRJY9lc1+lLMLl2cCQue4MTWR5C8rm
	Px9wi0YOWz6uDQuoS08rcJpgEwdfmVqRrLOsFJwiDOn1ioQwRMISk4jIPsXQq+FiVN3rLBt7ba1
	zxJPdyONeJgPHBqAyvzP5kQ6RzL51INh5iEFI6nbC4MDUddaKQC7md6Rv1QtUi6gxdT6P3Ber4+
	vLClxv/EMoZgv+cy0GZe7akS4hIy9ItdTVoB3lUItL9q35O1dzuPIQAkFrVCqC
X-Received: by 2002:a05:620a:468e:b0:923:8612:f15 with SMTP id af79cd13be357-92e7823fc78mr907524385a.18.1783013698575;
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80162220sm268889985a.25.2026.07.02.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:34:58 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Thu,  2 Jul 2026 13:34:54 -0400
Message-ID: <20260702173454.855897-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-7-36b4e9b24457@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Junhui,

Following Andre's suggestion I went through the bus gates in this patch
and compared every register offset and bit position against the public
A733 User Manual V0.92. Findings below; everything not listed matched
the manual (122 of the 135 gate entries verified clean).

1) UART1-UART6 gate bits look wrong:

> +static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb_uart_hws, 0xe04, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb_uart_hws, 0xe08, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb_uart_hws, 0xe0c, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart4_clk, "bus-uart4", apb_uart_hws, 0xe10, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart5_clk, "bus-uart5", apb_uart_hws, 0xe14, BIT(5), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart6_clk, "bus-uart6", apb_uart_hws, 0xe18, BIT(6), 0);

Each UART has its own BGR register, and in every one of them the
gating bit is bit 0. Manual section 4.1.6.141 (0x0E04 UART1 Bus Gating
Reset Register): bit 16 "UART1_RST", bits 15:1 reserved ("/"), bit 0
"UART1_GATING - Gating Clock for UART1, 0: Mask, 1: Pass". Sections
4.1.6.142-4.1.6.146 have the same layout for UART2-UART6. So these six
entries should all use BIT(0); as written, enabling any of bus-uart1..6
sets a reserved bit and the UART clock stays gated. (bus-uart0 at 0xe00
BIT(0) and the uartN resets at bit 16 all match the manual.)

2) SYSDAP gate offset looks wrong:

> +static SUNXI_CCU_GATE_HWS(bus_sysdap_clk, "bus-sysdap", apb1_hws,
> +			  0x88c, BIT(0), 0);

Manual section 4.1.6.92 puts SYSDAP_BGR_REG at 0x07AC (bit 16
"SYSDAP_RST", bit 0 "SYSDAP_GATING"), and patch 8/8's reset map already
uses { 0x7ac, BIT(16) } for RST_BUS_SYSDAP, so the gate here presumably
wants 0x7ac as well. There is no CCU register at 0x88C in the manual.

3) Gates without a register in the public manual (V0.92) - these could
use a short provenance note near the entry, as discussed for other IDs:

  - bus-spi4   (0x0F2C)
  - bus-sgpio  (0x1064)
  - bus-lpc    (0x1084)
  - bus-gmac1  (0x142C)  [same question as the GMAC1 clock IDs]
  - bus-tcon-lcd2 (0x1514, and the tcon-lcd2 mod clock at 0x1510) - the
    manual documents only VO0_TCONLCD0 (0x1500/0x1504) and VO0_TCONLCD1
    (0x1508/0x150C)
  - mbus-gmac1 (0x05E4 bit 12) - bit 12 is not described in the MBUS
    Gate Enable Register section

The remaining bus/mbus gate entries in this patch all match the manual's
offsets and bit positions.

Thanks,
Enzo
