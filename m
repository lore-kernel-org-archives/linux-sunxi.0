Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911933;
	b=LkEu3P99hA5NzhjlsPGr5DPkOAs+NEKSrcYlJWlVCATPBzgDtXW4zMdFD4e4HtqYh6GI
	 7K2K15pVUdedytQBo61y4vHWXy+1lXL4LwMmJYoTDTP9lCFFOVIaJRtO4Yx0jNpvRZy9m
	 UvbZTaLKoatBeB0a2W9UO7c19S6IEMo7jcXRrOr9/weE0bu4JkcX9jp9God9CXd84Xqm8
	 gLMFQZKAIptq6F7JVBpnDy147qQJe0tMDsckUxL+uvlxcC78gFPiRxcXGaPVQZYaeaWs4
	 CzbxJax+SzElCCxC38lAlSK41xN6Za5blSi5RJgiGQK5+S8DGhmgQhWXpW8wJOV82+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=etFadpZxb3K3Koio+rWn9A442pWi/regcd29GY8GRBI=;
	b=Xyhe8qhySi1qRbqpzpWoxCMq+oVq+ei+DmSTPwkK9ZMGTT3y7ZEbtzQL8RArmidaWp4v
	 SF7YndF1xrN62f2ftYKQDOF2qcjwTEcLN7blrYbSjWitcTrFVyrSvqR9VhlgIRQDnfncP
	 xPgfMcuiIZ7HHm3C2Utxs+Hvl3hWVY1SeKvCQRovk+u+N7vE0XUHQaSDjC38PP41b0QcS
	 qXBoi8O7W3vX3jfuBkYZQoAoV5YWWM9iHkqvGPwVUOnMrtGddev1AL/SDkrQNyu4iw5bl
	 sc+spUs7C1n0QDwvF0VHFFR0r1q1kQOZCsrZLI6bIgqFJSFhhKnn+xcf6z91YIPnhmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fePJ0I9W;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3686606A326
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Nov 2026 20:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3686606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fePJ0I9W
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-84621d8c7aaso1943a34.2
        for <linux-sunxi@lists.linux.dev>; Thu, 05 Nov 2026 12:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911932; x=1794516732; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=etFadpZxb3K3Koio+rWn9A442pWi/regcd29GY8GRBI=;
        b=fePJ0I9WD3W6ERvooqEGE4up7MF3oCAYdnDbePTwi58FavHyeXbzINZZ++tjMN+LFa
         S48of4nhkcR5Bg2Z3DoNDxWpCAl0EqUgJhm82UtvdyU56vS8P2SYWGqDDYtT9mbBU6b8
         6fgeyDEThwWoz8sq36Jiv3Q/fv19eJYhcZt3ygJsbeIqdE2An8lsslVKrbAhhYOs59IX
         rg9d7ii4tZHZ5xeLMrg2qY2qDx4UCEUszGjWihHQmNqZiWErKv9/Um0C7seIU+YyiWYf
         rNwTAwA89kyxJE0SgdVu3/BJaQ76v3TV5NruYFkYUo459/LHcyV1KB+XlvkCeBdTFxdt
         Fa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911932; x=1794516732;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=etFadpZxb3K3Koio+rWn9A442pWi/regcd29GY8GRBI=;
        b=dMOrtIGPDPRxJKAMVwA3goLaoRyRwGgrnx1WHKqp+4rPVjmmAYBt6MD1ecee2lw3BK
         TMCw7xO12p4+PEeOmmk/mCLujl8yMChx/spmdeBnYGVq842NYaDY3bN1Dz0mVVvGIdUn
         k9Ra8E/n60Usym7uF6S66rEVqWV2JUaP28nInT3Yoe7i55DserMFgDbf6v5fxgLJzEYY
         wZbOXKrSLRJM7UnmFBU+rkF717K2KPpzh5eUCr4HCjVIJdEI39EOn4I/MziQZ5VTGugW
         WSRfPgGJD7cD7t6IE47E53JdAdoq1EsMDXf2uCmmDIz5p4zJSJS7T3AIllh6U8C5tw1l
         41Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzj7IeRBBKpvwmEkiruqcp1o2IciBlTY3Y2lp6sYgWoFLlpp1XAA0i2wztEyYhyxxtLEaSmaJm0dBoxRA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9uIWunNf+ZK7KubPHfwUJ6AF0mct9977L/r2riHQyaB1iTPZpT
	XzHk+GqdtSTGnP4LgwkmqnGvkhCW7RStlUSpXppZFuf2Wfzj5v33qpug
X-Gm-Gg: AYBFou1mecslvfo8ribv4rWV3yRwM222LoSM7r85ySBcoMgU40pJF3Q0pdhrKoads59
	n3xfcjQ8wa1/3XPbxOwCXzrUmsWnah11RUNz69OhOHgWcBwmVh8zJwTPwGuagFdH4tK8DBiVdfj
	RSE0S6HBcl/uBj7b1IQJq/IEiRPchkLOXvZ+B95qmM/aRmLFgDnZXqWEq+Kco95DkipcjVMdx5n
	IbifBkKf20CLOnJ+ewUoqiCcGOdFa+TSesod3yz3Hj7NH0o7r+bs2tQ3vv1GM9VALdRV/M+um2X
	YKL8xw3bH/+2Eob8MDbgTR0tOLldHZZ6MQI2t4dClrf680AfMAFaiE+lcXS/2zdyMEi0LYjk7LY
	/XulYGw7d5N19YcBPi1H/fdE8NK0rJrxyLo0aedRdM6vFhIBjwz4/O8yFdqdjzIJmM5vHaK8s1Y
	7GqtZG12iWL56kB0nQ/co1PFz0VpuRQkB9F4pnf+71JFWmIrp7AkgmQmtCOE31iuSXjcBGlbr/L
	9HELAOKaVsI3w32DILyOEzZZrL3w/Ihj8O6Mprv3e0EtJSzITTq1Ww8yFpvirKUqFn3Hf7xgODl
	0UyRt/XQAB5KMGv+EswDyZ6m2oCgcuMOEE+A8NhQJew0Yul3YsnpKTcYGsrRdDXdjl7clLWWZmF
	4c216sfCqZjLyuBUwKh0gd0cyL5ThrMLyfPys2jFVdjzfrbbyA3zz7ISFTr2IC2XtlNcYxQeon7
	lNw2GdNe8qPBaQSjb3H0ide+vuiWKcMxDGYeX/xJMRkzQ220tmiqQuj7PHpgAU2Y6bSFKJVya6
X-Received: by 2002:a05:6830:3114:b0:7fa:ac4f:79a with SMTP id 46e09a7af769-85f1d0ac516mr699871a34.22.1793911931772;
        Thu, 05 Nov 2026 12:52:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v8 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Date: Thu, 05 Nov 2026 13:52:01 -0700
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43S3U7jMBAF4Fepco2R/+1WaLXvseJibI9bo4aAk
 3ZBqO/OpAURAkRIubFif+OcnJemx1qwbzarl6bisfSlu6eFv1o1cQf3W2Ql0bqRXFrBpWT9IbR
 lYDsrLDtAHVguuWNHwaKBHFNGEwNv6PhDxVyezvS/28uazt5hHEZv3LEr/dDV5/Psoxj3vY9RP
 4+hhzPUoAKgxAD+77aFsr+OXduMY47yt5AkCDI3a2W4tsrMITWF9AKkCJLe5iiCjyqKOaSnkFu
 ANEFJOeTC58TBziEzhdYLkCHIqKCVAgwhf8nIfkAkLUB2/LTxxwalbeBxDrkptBS2IyiuUWqfr
 DefMzpd2lHx8UD9Gy6VaQL0yOg9gZuVtdKjSzraIE30iQISShtUIHmSwss1ADrUY61a7Hs4F3e
 zupmnPtYd9sxLQ1H/Z6lQ5bv6lr5gWjihwRkUBj6u+OcnVn/H1qehli3bl4xDafGttII5JYLzy
 XCu0tS+PZ1eAVq4jVyHAwAA
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

DesignWare UART receive thresholds are one byte, one quarter full, one
half full and two bytes below full. Describe this mapping in dwlib so
CPR-described DW and LPSS ports use their actual FIFO depth when reporting
or setting rx_trig_bytes. Widen the 8250 threshold tables, setter byte
counts and sysfs parser to 16 bits to support larger DW FIFOs, including
the 2 KiB configuration.

Enable the same interface for Octeon using its fixed 64-byte FIFO depth.
Expose rx_trig_bytes for ports supplying both trigger callbacks, including
port types without a static trigger table. Retain Octeon's special register
accessors, optional-register probe bypass and existing DMA selection.

Reuse the same trigger setup for the Allwinner integrations. H616 has
fixed 256-byte FIFOs without a readable FIFO-depth register. A523, A527
and T527 have different depths across their UARTs and report each port's
depth in the FIFO Clock Control register. Select the fixed platform-data
depth when provided, otherwise read FCC, and validate the depth before
building the threshold table.

Dedicated compatibles select the Allwinner configuration without probing
overlapping optional DesignWare registers. Keep PORT_16550A, configure
automatic flow control, preserve BUSY-safe integer divisor programming
and keep the UART clock gate enabled during termios changes. The sunxi
setup uses PIO.

The series first prepares setup error propagation and platform callbacks,
then widens and shares the 8250 trigger conversion, enables callback-based
sysfs controls, and adds common DW setup and Allwinner bindings and driver
support. The SoC DTS changes are deferred for a separate submission through
the platform tree.

Based on tty-next at 6628e7d4c6b2 with the posted RX trigger callback-lifetime
fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform setup runs before
installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v8:
- Defer the H616 and A523 DTS changes for separate submission through the
  platform tree, following Krzysztof's review.
- Separate the dw8250_setup_port() return-type conversion and caller error
  handling into a preparatory patch before the platform setup refactor,
  following Andy's review.
- Place the RX trigger table first in the hardware-configuration members
  of dw8250_port_data, following Andy's review.
- Group and comment the fixed-depth/FCC selection, and use the conditional
  operator for Octeon's default FIFO depth, following Andy's review.
- Carry Andy's Reviewed-by for the H616 driver configuration.
- Link to v7: https://patch.msgid.link/20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com

Changes in v7:
- Rebase onto tty-next at 6628e7d4c6b2 (7.4-rc1), keeping the latest
  posted DW divisor v4 and RX trigger lifetime prerequisites.
- Keep the shared conversion internal to 8250_base now that both callers
  are linked there.
- Move callback-based sysfs exposure ahead of the common DW trigger setup.
- Expose rx_trig_bytes when a port supplies both trigger callbacks, even
  when its port type has no static threshold table.
- Initialize Octeon's FIFO-relative thresholds from its fixed depth while
  preserving register access and DMA selection.
- Widen the 8250 RX trigger tables, setter callback and sysfs parser to
  16-bit byte counts for the larger FIFO depths supported by DesignWare.
- Move FIFO-relative threshold construction and the trigger callbacks
  into dwlib, and use them for CPR-described DW and LPSS ports as well
  as the Allwinner integrations, following Andy's review.
- Share FIFO-depth validation and propagate setup failures through the
  DW and LPSS probe paths before registering a port.
- Keep the existing integer loop in the extracted conversion helper,
  following Andy's review.
- Use explicit fixed-depth and FCC-discovery branches in sunxi setup,
  following Andy's review.
- Clarify that FIFO-relative RX triggers are shared DesignWare behavior;
  describe Allwinner FIFO discovery and register-layout details separately.
- Link to v6: https://patch.msgid.link/20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com

Changes in v6:
- Export the shared RX trigger conversion in the SERIAL_8250 namespace
  and explain how driver callbacks avoid new legacy port types.
- Lead the H616 trigger description with the FIFO-relative mapping
  and include array_size.h explicitly.
- Name the trigger divisors and full-FIFO margin, reusing them for
  FCC depth validation. Explain that the upper bound follows the
  current byte-sized 8250 interface and can be widened with it.
- Describe the fixed-depth platform-data field independently of sunxi.
- Carry Ilpo's setup/helper review tags and Krzysztof's A523 binding ack.
- Link to v5: https://patch.msgid.link/20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com

Changes in v5:
- Reject FIFO depths that cannot produce positive, byte-sized RX trigger
  thresholds, report the invalid size and propagate setup errors to probe.
- Add the A523 UART compatible and use it for the shared CPUX UART nodes,
  including those inherited by the A527 and T527 boards.
- Read the FIFO depth from FCC when sunxi platform data has no fixed
  depth, preserving the fixed H616 configuration and FCC clock controls.
- Explain why the per-port trigger table is derived from the FIFO depth;
  use the same sunxi helper for the FCC-discovered A523-family ports.
- Move the shared RX trigger conversion helper into 8250_port.c and
  export it, following Ilpo's review; retain Andy's review tags.
- Use FIELD_PREP() and an intermediate trigger value when building the
  sunxi table, following Ilpo's review.
- Select the DMA setup helper directly for the 64-bit-only Octeon
  platform and match the single-line comment style, following Andy's review.
- Carry Krzysztof's Acked-by for the unchanged H616 binding addition.
- Link to v4: https://patch.msgid.link/20261027-submit-h616-uart-fifo-v1-v4-0-d37e018fd0a6@gmail.com

Changes in v4:
- Introduce common Allwinner setup helpers with the fixed FIFO depth
  supplied by compatible-specific platform data.
- Rebase onto tty-next at 6b4b543fa187 and the posted DW divisor v4 fix,
  installing the BUSY-safe setter after platform setup.
- Use an early return for FIFO-less DMA setup, following Andy's review.
- Default to generic setup when platform data has no setup callback.
- Select Octeon's optional-register discovery with IS_ENABLED() in its
  setup helper, preserving the existing 32-bit and 64-bit behavior.
- Extract the shared 8250 bytes-to-FCR conversion, including the
  unsupported-table check, into a preparatory patch and use it for
  H616, following Andy's review.
- Set the fixed 256-byte FIFO depth in H616 platform data and omit
  fifo-size from its binding and DTS, following Krzysztof's review.
- Precompute the Allwinner RX thresholds during setup and retain the
  sunxi FIFO-depth helper for filling the table. Use named FCR encodings
  in the helper, following Jiri's review.
- Share threshold-table initialization and callback assignment through
  a sunxi RX trigger setup helper.
- Group and comment the H616 trigger and RS485 setup.
- Link to v3: https://patch.msgid.link/20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com

Changes in v3:
- Introduce a platform-data setup callback in a preparatory patch,
  replacing skip_autocfg and preserving the existing Octeon setup.
- Describe each H616 UART's FIFO capacity with the standard fifo-size DT
  property and use the value already read by uart_read_port_properties().
- Derive the Allwinner RX trigger thresholds from the FIFO depth.
- Use an unsigned trigger index and conditional runtime PM guard,
  preserving error propagation when the device cannot resume.
- Rebase onto tty-next, replacing the earlier DMA prerequisites with the
  posted RX trigger callback-lifetime fix.
- Separate DMA enablement into follow-up work, retaining PIO operation
  for the H616 FIFO configuration.
- Link to v2: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com

Changes in v2:
- Keep PORT_16550A and set the FIFO size, transmit load and capabilities
  during setup, following Andy's review.
- Select H616 setup through the matched platform-data pointer and remove
  the type and DMA burst-size platform-data members.
- Use get_rxtrig/set_rxtrig for the 1/64/128/254-byte receive thresholds,
  with port locking and runtime PM around register updates. Keep the
  standard half-full FCR default, selecting 128 bytes on H616.
- Advertise UART_CAP_AFE so CRTSCTS enables hardware automatic flow control.
- Rebase onto next-20261023 and declare the posted sun6i pause/lifetime
  fixes and their prerequisites for DMA enablement.
- Link to v1: https://lore.kernel.org/r/20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com

To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
James Hilliard (11):
      serial: 8250_dw: allow port setup to report errors
      serial: 8250_dw: select port setup through platform data
      serial: 8250: widen RX trigger byte counts to 16 bits
      serial: 8250: share the RX trigger conversion helper
      serial: 8250: expose RX trigger controls for custom callbacks
      serial: 8250_dw: derive RX trigger thresholds from the FIFO depth
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner A523
      serial: 8250_dw: discover Allwinner A523 FIFO depths through FCC
      serial: 8250_dw: configure RX trigger thresholds for Octeon

 .../bindings/serial/snps-dw-apb-uart.yaml          |   2 +
 drivers/tty/serial/8250/8250.h                     |   4 +-
 drivers/tty/serial/8250/8250_dw.c                  | 116 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_dwlib.c               |  94 ++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h               |   4 +-
 drivers/tty/serial/8250/8250_lpss.c                |   4 +-
 drivers/tty/serial/8250/8250_mxpcie.c              |   2 +-
 drivers/tty/serial/8250/8250_port.c                |  27 +++--
 include/linux/serial_core.h                        |   2 +-
 9 files changed, 227 insertions(+), 28 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com>
prerequisite-patch-id: d8219673210dac82d3adab41578ff2f76f5862c9
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

