Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280393;
	b=cxFl+X5R2zhfgdwbqOLmvKoJYTLKx5arX/aKs5En6odwhZkt60ZiM6wDsn26bVP+GCpI
	 pErAjcwzSa7Dc2lAKlajhu0bLXBMgebQ403VQiF9/Q62ZyfTrQ1OaXJbustO4fTQoX7Xq
	 Io24MCrJJViEyJ6ibJKERuUcBN5Ep3hpYoOLZNT1ymOy/wv+86K9Uga40sXWreBZ9Pt6w
	 hVpWC9ujG5VpbnGq+9AUEQTZbrDxyg+1DD9Y72mz1B7W9XmkMYoBVdZcm0hJpGyz3YVmN
	 QDX6bYifhMu3ZMcaxZIKGV315CFUV17Py9V+j6KBTBo0exlGWADI9oVQyuptX4DJkjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
	b=aN8mYbUg2DUyNAwJZLlnUEdxCOqLMBPg+M8GlFWM+9ncNJG98mWEp26oQzE37GGGDc71
	 xVIvyDqK8mr6AOF9CkKu961XWgK5NK5JRfICHixUApN5FBrmtIiY0yCDIa/k37vgUGUmb
	 jm6MuV2eHQqpyYa+ERgkgW4snoyaVZW+IzPfMR86z5kMq5vndMDH8gkrqLpl3SctO/Qap
	 43tW1zFwBPOm2awTjyiNxf4OLac9NwjA8esGfUHQMOPc7enVnBrvIkKlI8do8JVAVezqi
	 GVQIL4+BbKrHfSllNF+k/F7rBI8iGlhFlPc7bNCDyueSk2eTRuLXg0YDz6vdS3lFMVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wMua84Ez;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D68606A326
	for <linux-sunxi@lists.linux.dev>; Tue, 10 Nov 2026 03:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D68606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wMua84Ez
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-833e671ee9fso1553510a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 19:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280391; x=1794885191; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
        b=wMua84EzFFCWkMgyjKlIQnPjI+jo5snrH+8l3xzFwqv5FBbunyagJVXmD/kO7XeRYp
         F4wWQQLj9d2Sr1e1+hzblZ2yqD2jphSALOOpa8kT1p5ladSYlRcod+c8JeyynTNfNBUD
         wBPDHYh5shRi8s4OibWlEuSCyQUCwTCZlajlVqxFQamvuP8Nc2OMMHJvjDGVg102SFJz
         jIPa+Von7J0F37W8ykPXqhh0vwybi17dqKdWejTxFpT0AqvraIM+3JeL6x5/fZSItQyo
         /3WSnaGgYN29Uc2Fn/7NCbGx/3III0r/Kq4ttjlPUOe0oHNbCBXnMwclz+AVXfmWZe8U
         002Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280391; x=1794885191;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kJS+888z9/xW37rRbsLAqP6ADhXzaU9fOkbt37UWOAQ=;
        b=2VL4TcBgp1ml5gq1nLu6ki66Fcq7YkD9u1VwEw2MLlcTyJqhmK6w/X7Rfb2gZC6285
         lPHLY3VrVeAJfs2yJTvs7URC3AbiNaV6xntd8ZLBA124lxDWe6DcLzA+JwMi5luIbv5j
         +pnIKNeyv4PPQJWQ30u07tRxsSYPkXcf0xmngqHhaPfqkfvp2d2s0WQqmqTRomFESi8H
         u5zdfJj6OfaEGWKc7o0YpyiU1gHl9P6P+nVh7xCwUN/dgy6c9WzccxiuqM0rLJhf5SyN
         RYGKVIegKZvyAgUpBCVw0Myny9ByCHKJX9DqHGGal0qgIL3CzPIVXu9Fzw6qjXGkBgWm
         p/Cg==
X-Forwarded-Encrypted: i=1; AL+hErHfQewsZdze8FoxorGvx5BMowl7mzToKhbEOgMCBl4sFhn2yxK6pSVYTVz7kt8lSZolJJ3nEH4TiH1WNg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/PQYYM5lShK5/qrtoEndYmTFJc7VTi0UMO7GbykVfQ614DuCHx
	Lu8QUonBSRFQAOOmD5yIJGjmcv/sC9Ob/V3TFy4SFmuz3ond8xvnjVML
X-Gm-Gg: AYBFou2TK5/3IGfiRdnZbf2EqqS+XktgpsHRmVAjxPibLLaZbw15hSAQhhW/Buzjjua
	eg9FpX71p2ZvTOZwEAn4yUjWgrpQfp9PMTIumad8hSvy/jS/SkPpcLxdtFVA4tftn+1Z6yd26aq
	DHrvzAAyB6x3APLffJV42dMUWziwo14HYRF7rPBgps9KO+xMckRIlplbkIbhk7iCobZM4cEdU+D
	Sakni2GKqtkw4Worvm0+0exBcEQQAea32XrqCU4aM9B7l/vFiNXM2j7EF02tts+cKoopJgPf6Un
	MABruVhmdTsL7ibLvFAOo2ghuN49ai0Wg+CkQMqY2J47z2WFgdtIKsjq73NZn3IVRVhC9WeJ3mi
	wTh9gs5XRjXxNen0HhJNDkALCk9aVja305vy4woiXP8JnHDB69+nWhx6Iki1FanV7/CQd9ZWl2b
	Xn7HvopQpFUF5l92jSDtGSCj4AyzzwVA7GQHghMZiRoQGYYzW3arz41T03+g4QbyMfOlKM7VxRz
	OrjR/z3L9e8ljjIvY3k3bpppAKOfghNT49+VZWdidIWaA/sfxDFk55mOOTBckU4rIBVAdB7bL2v
	znLYvyLWBTtXI9DhJbA8v9lS+DaTeclVmIX+1y9loQwQNtzxq3JaQh7alqMo5P4f7RQYYcrRzNv
	hkQGi/JFS5PFnWXZc5xjBTCK6h/8nHIpktyPap6e/yPKBdPnbQGR8eCpVCXI+LZPiDQPyYgAcBc
	otZ+/H8SaAc6sPoKki3PMBgQ1nVw8baKhtFpxsPBPQ4tfpAWE2mrUZ
X-Received: by 2002:a05:6808:30a0:b0:4c4:3997:ef2f with SMTP id 5614622812f47-5683cbaa305mr1043116b6e.17.1794280391467;
        Mon, 09 Nov 2026 19:13:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v9 00/11] serial: 8250_dw: share RX trigger setup and
 describe Allwinner UARTs
Date: Mon, 09 Nov 2026 20:12:49 -0700
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43T22rjMBAA0F8Jfq4W3SWHUvofpQ8jaZSoxPGu7
 KRdSv59x0mXGndrFvwyWDpjz+W9GbAWHJrt5r2peC5D6Y8UtHebJu7huENWEsWN5NIKLiUbTqE
 rI9tbYdkJ6shyyT07CxYN5Jgymhh4Q9d/Vszl7Uo/Pd9iuvuCcZy86cS+DGNff19zn8V07m8a9
 X0aejhDDSoASgzgH3cdlMOP2HfNlOYs/xeSBEHmplWGa6vMElJzSK9AiiDpbY4i+KiiWEJ6Drk
 VSBOUlEMufE4c7BIyc6hdgQxBRgWtFGAI+UuN7CdE0gpkp1+bGhuUtoHHJeTm0FqxHUGxRal9s
 t58rZGfQ2YF8gQJTQ1JMgivwxy63Mas4q8TDfJ4m70mwICM3hO43VgrPbqkow3SRJ+o0kJpgwo
 kT1J42QKgQz3NZ4fDANcN2G7ul+2b9gYOzEtDPXtlqdDu9PWjjYJp4YQGZ1AY+PzEh+9Y/S+2v
 o217NihZBxLhx/TL5hTIjifDOcqze3ny+UPfVsWV9ADAAA=
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
Changes in v9:
- Keep the conditional setup call and place its error check outside the
  conditional in the preparatory patch, following Andy's review.
- Use FIELD_MODIFY() to update the RX trigger field, converting the FCR
  encoding back to its field value first.
- Collect Andy's Reviewed-by for setup error propagation.
- Link to v8: https://patch.msgid.link/20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com

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
 drivers/tty/serial/8250/8250_dwlib.c               |  93 ++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h               |   4 +-
 drivers/tty/serial/8250/8250_lpss.c                |   4 +-
 drivers/tty/serial/8250/8250_mxpcie.c              |   2 +-
 drivers/tty/serial/8250/8250_port.c                |  27 +++--
 include/linux/serial_core.h                        |   2 +-
 9 files changed, 226 insertions(+), 28 deletions(-)
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

