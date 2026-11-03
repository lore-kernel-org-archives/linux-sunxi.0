Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742007;
	b=klE5cFvKJjdgr8uCUMlI8b2S2Tpi2kvLJa3EVa+A5C5drzwzlU3D1dvVkEFzTgdYe2ot
	 IczHbXGzEh05vE5bnS2oVVEn8PW8vykoVt322lAllocDS7ady1sym+J90PjYmjO/2lXub
	 yvDgHBbij/YCQS+dVraQUEdx8oenhVpKPOFRt81IIS7vs9QZP3guQLUWGr+pfTwVbue/v
	 EhEjvr/Rom6uv0LMChT/ErYXMyq8CSwjeaxXMbanXmAJ/DOvRDBzIHrdaQJzWj30/oKR6
	 eKzY7ptgKGRQDqIq00kMVIwsrEmmkByg5rRIqtryZBkdRBNqbwF5MfohdjAqM3VunJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=d1haNodWRxR/D8zN+t8/KrK0XwUOD7Nlpgam8UcZKFA=;
	b=kPlgwQvikdZJvqt36VJa8kIUjr7pZiAIsDRn9PfXyLguoAqg2oI/GDXZLzDD5p2n75WI
	 gT+DEASVtMi9KitcuqnoSZ8D3J9tveWYmLi5XJUPFUzMoj1BKb6gtHByUEoLTdgtgPfgx
	 F5WGvacm0cCysgafjihAnXPHkSw52g3v1kI32dR3ANb51Ago5Ks7S8sobG3KOpqoYa+eF
	 zl9bdpg5goDfcl1gG17JuKVI/AKs1/QfM65+ymxciTMvUNq0N67pMEAjAlIb1HUrXjXcz
	 IfYYSYYewHoqMNfer+/uD4IZjsJQzM+XiLQEq3UgUaJG1uEG00rRmZRXB0hz3TW4K0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2CyfJR4;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D29E606A328
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Nov 2026 21:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D29E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E2CyfJR4
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af81963f35so64246b6e.0
        for <linux-sunxi@lists.linux.dev>; Tue, 03 Nov 2026 13:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742005; x=1794346805; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1haNodWRxR/D8zN+t8/KrK0XwUOD7Nlpgam8UcZKFA=;
        b=E2CyfJR4fv0XsksX/AZdQHDWbwliWoc6JY/h1oTjmCYhTHzqkCnptJM+9xo2rTVnxL
         jG51tYOFDGJMOhi8zjGtGt1M1D0i+JOemyf6N4KpCMtsdCfN8EhIVSrkop3GCZ2N0hRM
         R8WhfBDy778ZwWdOCXpFChmub+s8dguQPHXv8lZt/ilhVIZNZcGMKfXwQCAF5WOWyj1q
         OyNmxlfEg1cQgAkZzZ3LlI3qr1FUs7xbZIf+J5lMbDcrpH/cQZi0njP460txK3IXswOJ
         xn08SvagweeVamGur3HR/FiwMt7AORHl24n+OLEV4jdk+dqxFhQ02eTD9DC28pNYQ+bd
         9MzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742005; x=1794346805;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1haNodWRxR/D8zN+t8/KrK0XwUOD7Nlpgam8UcZKFA=;
        b=YVvF8hSAZcJnd7sVIjLzKBA7dTCEPY4QkWNwuFI8V3m+zKxtAPzPNuzFQ9rM/W3qsP
         bnTZTU/nSzMyOFuLjLHR4tucKgTDjqhyrx82d4rYwCT6MiOj2GU6UQ8cMtHMAgXeGZXw
         79L6P4UdsS6ZX/KRF3jcOL+l/zfnFdoHk25luNXXkg9h6/XZ68qBKJnvufkUuS++x+S/
         AhcfL/u1Fzed0U87q935dRerdgcphjUju1g9jj7HTIxijpV/gGMq4EIW8aNWKkKhA7Sh
         vPqVvjczGmXcXYnLjcPcsPjM5Nv229dYBoAhb3dvZlC8tNaxEruF4RKpGFOXn1smh5xV
         rlZg==
X-Forwarded-Encrypted: i=1; AKwUvBz+DpChAA79sGEGtj07mEEEpBH31D9trn1zjgw7lw1UbLIiOzgc0jMowSKVxBVCYRDFIfWXuNurlPuO7Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Nu2s1bKLcoLsd0auv5Ct1hnyoSMWUwkgFLXV9VyJ4UUsX0/Ho
	L39KlnazntgFQlSz3ZkyapeT5lDu2y3hw0c+WHufTv9cXZYPTi4Zefu/
X-Gm-Gg: AYBFou1srZhYktJld68W2TOJs14H6CjzHbUOQN5XI+ThZ0fMeJjDwYlu4n/dYwUM380
	v8yMvYxy28joArl9QE97hsP6DxP45LER20HCB5DDttfIcytkYxiD7L2/iTzVhnncvpUMCrq6f0/
	TwExRvQMJY9VrVmV3qy/OLUjIVJgQxCa/QbPPGfkIwTJkMYj2cvpZks7U5lp4yna2tknEHPRHoV
	Tz+1ppqI4vtwFgFY0R6Ej6VDIs/fr0V5JdrrmA9b/qklVGpVc0pls+f6AJ5gxsTu7uTpYO0m3kh
	eiZcNzF4YKkKM8a36EUGnEf7RMRmBYkpgKWM4PdiCwpAHTVYUcX5rA2PpG/mtYG69aMpEQBMS/3
	/+VhzfJfNI6+kW5VRz0gDAmgAvo/fJTlvbIRz3JYgJA+HvjlLTiKucJ1/BWDrFX7Z6pXKCPHLGb
	Bf7pLJnjdyFSbCHGzSQ5svw/Z+Ie0n9F4jLv/fg1zzCut2D8NdnZnDXEsUS0RF0fo3HR7Lrsbic
	feu+FBY0VD8RWFNRh5JoaAdVAQaWB3Nk9UkqWeNH/Z+xruQhT0pfWh7/gP6XhNeiHiIyOZZ2jfW
	Hh7RZ8vGCHYTxQwCsN6dOlE6AtJzER2t7n+1aDNjq3e8vRtHhzSeDvMGituxHfBj8kGTD9WOmgY
	zrpupoOBDp2S2sf4ZVCLLcSiMH09/F4sjwdDI8rey25KOcZQFG8MiXzXTgICPtGkGs8doh6LG2+
	OZGFb9GgZMAyoXhTyLwGwzY3u1ImCjKInpNuYmu8IT62Ll9FYbKDrpXJb0zCajdxfH2ledanhzT
	Q==
X-Received: by 2002:a05:6808:bc4:b0:55c:888:30ff with SMTP id 5614622812f47-5640dfd3c9amr9970472b6e.45.1793742004830;
        Tue, 03 Nov 2026 13:40:04 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:04 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v7 00/12] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Date: Tue, 03 Nov 2026 14:39:53 -0700
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43S3U7CMBQH8FdZdm1Nv1uIMb6H4eK0PYUaxrQbi
 CG8ux1gWFAWk900a3+nPed/qDvMCbt6Xh3qjLvUpXZTFuahqv0KNkskKZR1zSnXjHJOuq1rUk9
 WmmmyhdyTmGJLdox4BdGHiMo7Wpfj7xlj2p/o18V5Xc6+oe8Hb9ixSl3f5q9T7R0b9v2UEffLl
 I8SlCAcIEcH9mXZQFo/+raphzI7/l+IFwgiVTOhqNRC3UJiDMkJSBSIWx09c9YLz24hOYbMBCQ
 LFIRBymwMFPQtpMbQbAJSBVLCSSEAnYu/eqSvUJEmID08bRisE1I76sfQ8TzUjB/bEpv+POnaQ
 Yek/C/gvNKaWzRBeu248jaUdzEhFQrgNHBm+QwADcohDQ12HZzyNq+ebps1pBTWxHJVOvRJQip
 JbfOlaYxIZpgEo5ApuF7x+R4r/2Lzvs9pSdYpYp8avGSNESOYMzYoSkUY24vj8RuCS5ZyPgMAA
 A==
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

The series introduces platform setup callbacks, widens and shares the
8250 trigger conversion, enables callback-based sysfs controls, and adds
the common DW setup before the Allwinner binding, driver and SoC DTS
changes. Based on tty-next at 6628e7d4c6b2 with the posted RX trigger
callback-lifetime fix [0] and DW BUSY-safe divisor fix v4 [1]. Platform
setup runs before installing the BUSY-safe divisor setter.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com
[1] https://lore.kernel.org/r/20261027-submit-serial-8250-dw-divisor-v1-v4-1-41714a75e15a@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
To: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-serial@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev

---
James Hilliard (12):
      serial: 8250_dw: select port setup through platform data
      serial: 8250: widen RX trigger byte counts to 16 bits
      serial: 8250: share the RX trigger conversion helper
      serial: 8250: expose RX trigger controls for custom callbacks
      serial: 8250_dw: derive RX trigger thresholds from the FIFO depth
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner A523
      serial: 8250_dw: discover Allwinner A523 FIFO depths through FCC
      arm64: dts: allwinner: a523: describe the UART integration
      serial: 8250_dw: configure RX trigger thresholds for Octeon

 .../bindings/serial/snps-dw-apb-uart.yaml          |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  12 +--
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  16 +--
 drivers/tty/serial/8250/8250.h                     |   4 +-
 drivers/tty/serial/8250/8250_dw.c                  | 114 +++++++++++++++++++--
 drivers/tty/serial/8250/8250_dwlib.c               |  94 ++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h               |   4 +-
 drivers/tty/serial/8250/8250_lpss.c                |   4 +-
 drivers/tty/serial/8250/8250_mxpcie.c              |   2 +-
 drivers/tty/serial/8250/8250_port.c                |  27 +++--
 include/linux/serial_core.h                        |   2 +-
 11 files changed, 239 insertions(+), 42 deletions(-)
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

