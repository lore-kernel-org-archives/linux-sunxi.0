Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740835;
	b=ucZNmHaZVVV2+OyyVFl7dKSPdWT3UbqRAQRFoW+YRKAv41nvmK7vBvcBafuqcoOdcxh2
	 QUfzTOanU4E5syM1Fu3/dLHEAZQ2hsTZpwK9q/xshxwXP+KQ9Ykl+leGIJHdDNDa/tl3y
	 1zoNWc5J2GqftBi0FYutsbeF1bYdKaG4gBBZzwmwo6HkUcNoUQOVuXOQYZ2KN4NvNYrDX
	 t7B40vhXogod2U+yzOgMur/eTWYGKzWEKnVWnRjkvAR7sgEcWUDcNcx/3jeMrTR38Gv83
	 o2pug4+Gzy+9kt15VJK+Kab/YvTNE4Whx+PIudQVlEz0cBMmEn3oEm90igP97s3jIHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
	b=PokacIDn+pTNsNiCHQVGXLxiBgCCkpVN8kPiHjDp79g6fGZEDR6U/+o/BpcysDECexuM
	 xrBZwMhSOfQyP5t1r8etFaf0Y4FFxH+HUlF6otwQzWlfmb+XNPXhZ9vThw4XekMng93Zr
	 pXP6KGIgyGTHU9rYF9cg07wLbDIxdrrDlL8Din0XqirMVay3pfJP0yuKMPpSYdRwUqacs
	 eO+/7EkfDgybNhofi2Asd47mqiuLYkTPNhqRoOh9eL02QY3/F1+UKAdPtmarulkVpoLKF
	 Lowo4e4dV+rf4uLauyWuNZi2KZ1YbkYYnbFxRI0gkmf41HWSSD6hDfKMtcH5MC/huIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=biYQRnJK;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5DC606A31A
	for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 07:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D5DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=biYQRnJK
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-51f2e9e6987so968060b6e.1
        for <linux-sunxi@lists.linux.dev>; Fri, 23 Oct 2026 00:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740833; x=1793345633; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=biYQRnJKeQa/B9QFhufvWdZ4NHGX9EHj1TFpwE5kV7hJv2H6ASsa3v8VXtcO0FgbWR
         zjhrVJOejmDv8HpmM8tg8OvuwIL+/lNoDqGsYZKg2OvxzkNOjW9qItWKnbpuWS5C2O38
         m+tuMfsmGxup6qgA1pBD2uKVLHuY0qpOnaLzcr70xrctKf5hULL0y3kyXGZtmUVZvWk/
         ziggnVY6W7+2Tzv0w90+/nM4ys6MOwfusjx2g71WpKHqQul19ks7ptgAxZceeMJj44NQ
         I2qKbj75f8jl8GEKyZjQLooGsGjjCNH3cPsTfkpt7NAIuaqNX7DlzEAsrcweqt6R7uSa
         Z4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740833; x=1793345633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=45to1KyNca3iZWz1ynFCrLebqSO0Gkuz8FnFEnoX6Vo=;
        b=bX8bLAo4mVa9Nb/gJzR+k28UnNSllE2alttP0dtkO4vS2kFISoRI2HZS7kmjxhx3oi
         HFIf0x8IqramQJxnVVog58PGNdY7AOKO/m7zopmTuzeaDQobJC8vZJmkGR+SY6qHkRaJ
         PjKusuKarLGN8KK5TkCNUem5IHilY9waMnZp8YmUtBrzyRp+Kz514z+HhbQlu4CkpdUV
         sKN6iL4TVyjmlc2BjFxuDKTf/SCaRrA6gNzOx1b83Fsvy+1chctljlC+4ImZYGkEBRr7
         j3zYlFDZVP6MWMZtJ688J7LrDmu7WVZWkNFwQQy7qxK0sYTvXv0dV6d8UVN6iq9kNmvm
         hPOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzYFHM6+Lcr0h2bA0LB/K2ml6oAl5Z8X2p2noaum4/MrWnOsZ5yO1MCt9C26YbevGxCF1bHiSx+hu19A==@lists.linux.dev
X-Gm-Message-State: AFq9FYJVChGJvC73HpcNFi2YtZe22jwsu6Nc0XzLEz5TrqiZRwRmbDsZ
	62nonlz1d8CJQ85cVlFJsfFExu/Gu71MqWty4zjBtwms0vZ96e2vvH3L
X-Gm-Gg: AYBFou0VkDBFA31JCbX3goCrCtddPdc6ecL2kSQiKVJffdn/ncvsY5RnAeuFDtZXoMA
	H5f1cVr48w+Lao+AjjupBZl9wMEGzVZ6jgT//zDlwmilxkgHZRgwtNWV+oB2AjdAeQzSaELnqQC
	6Sfx9eyh8aRJsfEAxizD5KTKF/lanbZz+aoJMnBMD79roJ0ncQr7FjyJkFfuuLQ23RPAEEScETM
	yVZX7+xwsomNARtKV5wZP46S472Pqy3wmcrpVuiRfrsPAK0S3zm0rqaBZXaZ8H1E1l6tol8/5Lp
	H8Qd2LWcAQ/kV1+3MaIBL61Bj+vMsdocWV3fIA2x41f+8KNRk/Zbd8xhjBj4/SldfkY3MzgI6Ga
	WpDmblweHWkUzz89gswTOd8p5wX7f0M419MwEb578Zw7ydjocInKjO1Jd+NRRI4kMoZwTbABJ11
	apbWYmh/+5tlE3AWSE+PRd7AQqLQO9QP5YNdOYPqZdtlSSVtFijjJzDQKWNeDs58nihfbpyg60I
	dRMitfcLRHGqpfRsJsXAbCgtcgABtOvr2IrwDg/sRS6SPDZn8Spxvl8lizTtuImah+vezfr0MwF
	GTumjjUqhM4j5b6wX8Zigk3077f9J9zB5tH8Klq3ZTe/94Jq5kmhhUyK48JBJX6H0WdRMSPZhVY
	NO6UmYnVOSB9LB85++vBVRjeUt1gkBoDrG3v7UYHO1byLntIqpCCVjijDVryOEWl7g6ulVHeClN
	FSqBU=
X-Received: by 2002:a05:6808:c1b6:b0:4f5:1b84:8cd3 with SMTP id 5614622812f47-557eb4799f4mr2769761b6e.24.1792740833602;
        Fri, 23 Oct 2026 00:33:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:33:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] serial: 8250_dw: describe the Allwinner H616 UART
 configuration
Date: Fri, 23 Oct 2026 01:33:48 -0600
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMAxA0atI1gbagl14FXFRY6IZGJW2iiDe3
 TqzfIv/L0gclRO01QWRD026LgW2roDmsEyMOhaDM85b4xymffhqxtlbj3uIGUVlxcMiNUFoFG5
 oMFDyLbLo+Vt3/d+l/TDl9wf3/QBuxM/gfAAAAA==
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

Add an H616 compatible and select a fixed port configuration with the
documented FIFO capacity and receive trigger levels. Preserve the
BUSY-safe integer divisor path and keep the UART gate enabled during
termios changes. Attach the existing 8250 DMA path using single-byte
peripheral bursts, with channel acquisition and PIO fallback handled
by the normal startup path.

The patches add the binding, driver configuration and SoC DTS compatible
in that order. Based on tty-next at 1184f87e2790.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: serial: snps-dw-apb-uart: add Allwinner H616
      serial: 8250_dw: configure the Allwinner H616 UART
      arm64: dts: allwinner: h616: identify the UART integration

 .../bindings/serial/snps-dw-apb-uart.yaml          |  1 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     | 12 +++---
 drivers/tty/serial/8250/8250.h                     |  1 +
 drivers/tty/serial/8250/8250_dw.c                  | 45 ++++++++++++++++++----
 drivers/tty/serial/8250/8250_port.c                |  8 ++++
 5 files changed, 54 insertions(+), 13 deletions(-)
---
base-commit: 1184f87e2790e8af9be3116f608d2e86b4792d7d
change-id: 20261022-submit-h616-uart-fifo-v1-c5afcdfe5cb0

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

