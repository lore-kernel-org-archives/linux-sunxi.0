Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873355;
	b=eQGiNPNbByCcyjP2/A6lJFAIBFowvV4YYmvjEVpn6LX0O+PEtKj1wdn7htiSOlimZM+H
	 pPjVFc6bx3R+3j2R7eBIsP5kzbQi+Jwgt0pZek1DrbRcqzAHd0+/ZHZ29bEuxBrKseTwa
	 WgKt+0Mrcy9/A1ESWLJ6SN3uHPlfAAdAfE80XeGLnf8w1MtuPXmpHLdQ4eYr2gzHXrSxG
	 IHR8t7ETsJ7GSHmOtNG9eaw5AzhUQXSixhDxtp363piYPKY3NRZmdt81kyQCNWm78PCax
	 Sblz1S9fftEmdczj7UtaGMIrFcExFRmknfalN0ioGxe5fvYwS4zPfSlWU3+I/SkakzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=75yyN+wYPmh4Hv6W18LTzVXcBapZ5SC3mIWHEkYwJ3s=;
	b=vOQpvFz8gb5/wt16AMYHxD4YyzQxDww5pmxZaisf0/PbKL5uRsTd+bvWmCo6OiR5kRO4
	 AL2rF/JIDnGXvNB2IYcRzbdR2KaEF6sKVPbItYXTJVLkq+hoXQXSI/jKhfbHOrgZOBd9E
	 OMP1SKLN6qpOkpWORrJQtnq3apbcg6wcuxmRYNJYpnAsheD8t86ZkaxT/bCYv5iu32NYm
	 WvQdKJP21xpF9V01I9xxVR0VjOtPpc94eILd18lmiRcwJpqY6s9E/8Cf0QObCi3qWtnRd
	 NAyKyUA10G+dMBx7JxO8Y+rFBcAO6Cpna8w9Cm12Wg20stveZlM8ybylPjOuUgNCBhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="rLwf8/Y+";
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED425606A31A
	for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 20:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED425606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rLwf8/Y+
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4f699fe49b3so1250819b6e.3
        for <linux-sunxi@lists.linux.dev>; Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873354; x=1793478154; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=75yyN+wYPmh4Hv6W18LTzVXcBapZ5SC3mIWHEkYwJ3s=;
        b=rLwf8/Y+IQfdQ2LmpsxNh2SOMr5Bkehqan6ztGaJSZp5giRU2iXmzbgdskrRstgaRL
         nHQBmncWQzcEWiMje+qke3TWCDbf2KjRm0QLGa72EZMmNXvcMA00lrdlOiQwZ2kJOtng
         SDsZawm8W51XKPh7jRLI5gt9afPXfJzcgvO6bQ0sOO1/B1obg5lhaPzcoBXGRKmC7jTW
         L8CwaOgR2ditAPn6vi6O0HEcFJYVJKc3xDJVJUFRUNExXE0r3qwioMwbaiprC+1yeDBF
         JxJb1aVEO8bAYhQVcUeWHH9idUsJdgYPxM7st4GIXjlsaQbmgcODm1tC7prINFYaB4+8
         Jvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873354; x=1793478154;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=75yyN+wYPmh4Hv6W18LTzVXcBapZ5SC3mIWHEkYwJ3s=;
        b=ZRVdPkXW36ccunx+WO4fYZqHGp+gPOS6T1TQw2zj7RDDtyhmU01b1XiSXRZyqU+ZWG
         MAL9ePiqvdYV/AuFjdOsrHTGvteQgQ/AKlFpYevqgL+kaWxYRZNfwtK3+ch7wXHdW+ag
         7SMMJqdR/I7+mH8jbEjVHwEPRo9HozFU/D8gVVFCAMWAmVn5hC80oYv/HWYOVmXVqiAX
         N9HGqiG91beeGY0imLADiYhyUl+bVoZx6DgYsi9DaipteOiCZ0FtOc8PsMp7RwoOvWfi
         jcl0yU8kh2hrYdmsSyOgkXU9oiMsZD5q3ktJgUF4wODjYVnwvpkjFoahFHhTw91QPWBW
         biLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQYdUCSRIsSPfXLTR/1QjKm59kUO2VGqd7Q5Xi+QbfxSeThMCtVxyaE2lj6FHGAld/A3vLz8ZEl8htIg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKjaWVfrlHrBJBiDAYTayOve7/3ba9eTYDIR166gQGIzNZSky5s
	dNW1Ejfxz6qcXoGLin1sHaHvHy7Duil5O5XvwtGLwmfwPdyIQ0IAQEEp
X-Gm-Gg: AYBFou18xkFppPR2YxLVfm0QxFNps8CoKIhg9XffN/hQO/RskyMyteHpqJZSIw5EVDG
	ZzN2I2kSM57gmUh4Sq3PVwrGLaHz/qEXvkyZkT/aF1dMXyElU7vOEq29R4rCZmz5ZkxbokItGPs
	l2A+Acaf83GspUhx+mMxtAWdQh7K97n9j5Kwz5hKoudXTUpC+OjBZ1uSCPl+Ys4ZaiI+6nde5Jw
	fDWk1xEk9ssA+gyFJYlOwSvPy9aOtphTE/7IEQDuHXbggvVJkTPZbKtLEtLuhBoQ/hkp0+H6Q34
	6rsLcTB88kOZIJsN3++hvBK6LOEnP33ZNU3JLBcnHLRJy8qUol623KbGJbzPfnnfSSFvelggjFX
	BtTDf2dMRCy8S+KjUyX56oJxTr+Pf90y/l7MXLi1PR1b6RiR1whMLDFrMmj/dS4N8mQlEOdPfXU
	4vfwUQplaFbymIxAvN4duUr4QZnUeX1meGlMNpxaLmZf6swUh3FBeHQs4lirGH0v2V0Xr9BVB1l
	qg4d5EPOJNw2MBcECnxG3OfdYfcrQeetLq1O8snHY5YRWkkMw7cfPqGRQq60NM62bTTlTPY8gNv
	CSNppAaoxqaNEyk29jmoP2U49EwoHW5KkE93Gj1rpZT3G89YXhJ20wpt397ttdQhRcSx212faeO
	h8wRjaNwbyBKWT6EHkwNVppU6lEBiTgFANdw7TOtwQ3VuLo+f7HnzwsTOVuAwd9bBXG9LzpQ7qi
	UiWpkj
X-Received: by 2002:a05:6808:14d4:b0:4d6:90f4:48b1 with SMTP id 5614622812f47-55c0038ebe6mr1678982b6e.51.1792873354005;
        Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/4] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Sat, 24 Oct 2026 14:22:22 -0600
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42R3UrEMBCFX6Xk2pH8NGlaRHwP8SJpJruRdqtJW
 laWfXfTdhe9EYTcDJn5zjkzF5IwBkykqy4k4hJSmE6lEA8V6Y/mdEAIrtSEU64Y5RzSbMeQ4ai
 YgtnEDD74CRYGvTS+dx5lbykp4x8RfThv6Ne3vS6z79jnlbd2HEPKU/zatBe29t1lxN8y5VHA2
 ghrkKM1+uUwmjA89tNIVpmF/xfEC8h4Klshaa2E/A267oYjfs5lJXlPQaxJCOW/ALuKMV173SB
 vWora+NaiYEx5RbXjqJWtm5a7xq1JR0zJbLvsqqebtfpubb2AGUBzSSGecwwHGILHHEa8BWbQC
 GYb7SSlwv34fC5Gr99XjTWUwwEAAA==
X-Change-ID: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte UART FIFOs, but lacks the DesignWare component parameter
register used to discover their capacity. Its debug-divisor and RS485
registers also overlap offsets used to probe optional DesignWare features.

Describe the FIFO capacity in DT and add an H616 compatible for the
integration-specific setup. Keep the existing 16550A port type, preserve
the firmware-provided depth and derive the Allwinner receive thresholds
from it. Configure automatic flow control, preserve the BUSY-safe integer
divisor path and keep the UART gate enabled during termios changes.

The series first introduces platform setup callbacks, then adds the
binding, H616 setup and SoC DTS changes. Based on tty-next at
1184f87e2790 with the posted RX trigger callback-lifetime fix [0], so the
custom trigger handlers follow the registered port's lifetime.

[0] https://lore.kernel.org/r/20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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

---
James Hilliard (4):
      serial: 8250_dw: select port setup through platform data
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: describe the UART integration and FIFO size

 .../bindings/serial/snps-dw-apb-uart.yaml          |  17 +++
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  18 ++-
 drivers/tty/serial/8250/8250_dw.c                  | 123 +++++++++++++++++++--
 3 files changed, 142 insertions(+), 16 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-message-id: <20261024-submit-serial-8250-rxtrig-lifetime-v1-v1-1-731b78d5003d@gmail.com>
prerequisite-patch-id: 9a9395c715c2bf7bbcae5bdd16a339d7f2af6269

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

