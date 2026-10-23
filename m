Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790372;
	b=N/haLKslAYD1q14/2CU/q7SMiLMSKQ80XRW7D6FzYxCgEeBjWwvvwll2bj4f8XoIBDWK
	 heJcNHpMaQbTZ0XLk8ZJ34pd4fp4v4wrorlMfJTZXr9x5z3awPbuP3IDBP5akDNaf2boN
	 jmXVVp8VXbO+h0OxkTQUJ1p5dkFVRMCRI2tm5s5kzxY19iX4FLhQ0bc7J3FuVz9XEkxCk
	 /5eZ/6J1s9Lz+9VgjaPvGQT8UaBYDRdzYjP1tP459Nao9tLcMFkFn0a51Jw5/iEGTmN0A
	 aGE9Ffua8BDO5wAuxox3IRJULtvg1I5o1JPJPi5MaGkEZDdDy3Ix4pNkjXNqlm5+ovg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
	b=e605eJpa7ICC0/8WBA1vrsClUPf9PYa8vWyKLthS+5vXg/dSwBe7TRKy7KQrHYORU2mY
	 KpUNqjXBRsT/HFok2lpmrArsiTft56ckxFOqFGM6iZvQTBvfwQ2OkSL3kkDn8A3E7DFFk
	 jKAjbHJg8TbNbRZk8mNaUGT5TtLvk2HZpRORmG1Etgephq+PwV0jW9uBJadI0OUiS/GQM
	 fDFsfaYKa6D62hVralXDt3S1e4YQVLOSNaSqkmjPDgkVsokvQ8TMNbD6YoGXYGPTalQWh
	 Z5Zu50rR2WzWq97I4PD4z7uVnlUBI45mIGHN96GoARMW+wfU9UOHqCfGUMgeFaQOjdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MgVDbwcC;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4A606A329
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 21:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0F4A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MgVDbwcC
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-845788309b4so646629a34.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 14:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790371; x=1793395171; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
        b=MgVDbwcCyP7CKq2/eOB9vA9PSrthofAmg/M9EixyMDrdY15BIraxs0LqeWtmWpWYVU
         X5nIXEqNystGjsb4sZobCnH92qxQJrseknDW5hpLZ/KwCJyMsL2zL5Teg4qMnU1pU2mF
         XGRbuhOupucmBrZzTblj4YjrvTpbJfZAgbzNDgoFqoV0JoH/X90BIsLz2zOQuI1YvdAO
         ZngO4SMKECxHb71u9Gyv7VwQB1Ut4JVqsiKqX8AkXLXctXVPz0bwrfVn7FUKzmbA2cKa
         J3gsVTF1W6KcDrmNXstpk41XzIR0Q2Cq/Zwlb72D5aw5CIt/B9itqPqqtz5Zeyny6rGo
         TsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790371; x=1793395171;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t/OVPwISYIuAdc7Q10pLScYKXWaZFmDPlbXzHuMOEjM=;
        b=krNSxqMJEXiy2iRwAhGN4nxiuclkAStxFvxOVadrExG5lvf7wMM3wssgB8RIvGdS2K
         3B7pi/1svyrQgS8nQI4HaT+vqgFVQI8sa67oPk1v79Z/oVW67xknuT3Jj6FRExET2uEw
         yORJPah4LxG56FX53H0kAHZtGVSfzww4Pj1o92gvjpaU8AuOQJ3R6D97ROgDE83tjZJM
         r9HpB4TIALvxkBnkMoB3KgF/ILuctlCVYc8qzyoUOaimzct8b66CpKiiZ6T7/XKCwQ3I
         RZhwHxNtx/lmlJ4JgA9QITMH7OJTv4BUIXIvqP2Q2vn1OO7uSTlTkk2v9DCCIDykfcwD
         bElA==
X-Forwarded-Encrypted: i=1; AKwUvBwKP3dVe5MXslFM0UAYq8nevmRSPDL2LXG3bKipt7JOh1P63c3MnftyghSx4y9H+tSQ49rj1mQaWNY6zg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKkWXu5wwBGG79m1GuBTdaAuLsQac2dhyWc7sZ5NFPBlydei5E1
	ckB4vG7VAUCQnpYK4Im8MZJULAXeMcqeA6Ho3ce1LOsU8zJImzzuahC6
X-Gm-Gg: AYBFou1WCdVsuVFsNXRmK/NW8XOtc1IAYpWpS9sWo03OtsTaiLBbs7N9ua1ixoZRnzL
	vfyxKMaN0lrmP7BjqUUoWvh7kxsbHrF6j/p9Vv9hKnPuJnmk82IR6qldk/Bah+3kJhDpbcCLst2
	mDzgzpNMkuMveES9oIMQxB2mSY4bZa/rY9/+UkosoheyCIqkGiWvpSWH8dy5pLQZhXm3KQLz/xJ
	gH8aFBtEbsgiBSCTWWR2RkAgFlsMeygYB/7iEp/D6bzjTokLW86plbzdmNxps5pMG/hlSq+QCv7
	sQSn28Vsx4GM7VHE7n290XybHQDe+6bvAHerSBQdxozQTOjfGJSiGhPw7gHbSOA+p8W+Ecbd0PR
	QULU4lA20ssmrokIznja2JKxqC9CE0N+0CYgEoy0SU4VhC4Fwpw84coSPDiXSFf47lW5qFvrBrL
	O0V2FuBPqwjf+0612AQ1yxZ0YGq5jiruNiIzFLbujfe37gEiHd6rP39j4qxQuUHxuWvqp9gLBVX
	k0JE4inEIAmTOEQqmgudYaZEuxQXy4P9QpWTVwCwinQTbPoESZDoMFtgfAR2XidZOnaI24u1XW6
	KsW6g3GxsIY0P6TA4b6mPxP49+xUhD+9FZWMiT7/rRhqwmw5bche7GU/KHo1XxjT9ReHU/O+gX8
	ydSu94HGGgUUFNhCHSwctlpjp6BOCr+bj6hClez129j6PO7yPcuH5C3G3Ag2aYwCrGOvDcgpNgZ
	roIA==
X-Received: by 2002:a05:6830:44aa:b0:845:3cfe:608 with SMTP id 46e09a7af769-850f7f763b5mr662878a34.0.1792790370828;
        Fri, 23 Oct 2026 14:19:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 15:19:26 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WSzW4bMQyEXyXYc7egRImUcup7FDlI/Im3aOLWd
 oIWQd69tIMetkCBvRCrb4Yz0ttyttNm5+X+7m052et23o7PMeRPd4scxvOjrZvGvGTIlCDn9fw
 yn7bLeqBE68s4XVbf/Li+plXqcFG3KhOWwH+czLdfN+mvDx9zsN9MLle964nDdr4cT79v3q/pe
 u6vDf7fJj5YrQycw7LN0b48Po3t+2c5Pi0P7x8+J/v5EkkuH+bLHGdb438IRjIYiEKTZBpbaVD
 VY1BqLVFHLgXHSKXdIoyLHKKA+zsl7K0UpsJjgM4JUGc10lAanYxKNh+N9pQTS/KmTbtBKiJUw
 bNjyDSiXBAEJ/PcU63m3LipFxMtHlYsrhjFJKzdyGZtI5nvqa7uNQH3KVUxlsnduPXBgg6lNWn
 JKzPuKRtpdPfJXQujskYJKc3J4eWS0yRUYfxnQyuTmBxqyb2SIoQ5qCZqyhFMoBp2qmNPVcjKZ
 rVL5EfrOZo0FshdZCIbUayOXfdUSgDxINg7QEi7DvbEUT+kuEkoKTP7mLKnUKRJmg08RZ0aN5R
 nZRNW6MM7VitSEo54Mu9/AE2U8xkEAwAA
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

Add an H616 compatible and configure the existing 16550A port type with
the documented FIFO capacity, receive thresholds and automatic flow
control. Preserve the BUSY-safe integer divisor path and keep the UART
gate enabled during termios changes. Attach the existing 8250 DMA path
using single-byte peripheral bursts, with channel acquisition and PIO
fallback handled by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on next-20261023, which includes the TTY changes and
A733 DMA register-layout updates, with the posted IRQ-safe locking fix [0],
pause-bit fix [1], virt-dma synchronization helper [2], and sun6i channel
lifetime v2 series [3] applied first. The sun6i pause bookkeeping lets an
8250 RX flush account the paused transfer and release its running state,
including when it is flushed before the allocator starts it.

Apply [3] with git am -3 on this base to combine its tx_status() changes
with the intervening NULL-descriptor cleanup.

[0] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[1] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[2] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com
[3] https://lore.kernel.org/r/20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +--
 drivers/tty/serial/8250/8250_dw.c                  | 87 ++++++++++++++++++++--
 3 files changed, 86 insertions(+), 14 deletions(-)
---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef
prerequisite-patch-id: 9dff51079bc5d3efa29e789a7c3f0488c81f5773
prerequisite-patch-id: ea1a9ffb79d473d7d81611bb7113fc21b63dc73b
prerequisite-patch-id: e4b676f0542956d309df0dd168d7866c05e3965a
prerequisite-patch-id: 502d7ee59c7643e92aa0e7c029ccb37e66bc539d
prerequisite-patch-id: 11000237f90066cfda7f17005010a3041277fabc
prerequisite-patch-id: 3cc8c1b80f1852d96e2b57ec7d09af935e4c413a

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

