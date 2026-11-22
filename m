Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368148;
	b=UV/Ze29hPC5GUFyTE62FVF2mSlaDoAGiuImqdSZ1WfvYazDCZZ1Vkk4z0R+qxmoAZrI9
	 6DHoGnYpW2/eDnd+eli1/6/8q8QZAgvw/I+nD4O22VkAls2lNA2VXTnmV3itVfBCD1/Pa
	 8SYRpuVqSKXmMv58cMkO4O31QOLY6blPjJTxDqN3GtMCl4sVmXmEWr5eRDGkXeC4KC50S
	 0orFEKQfsThOWXTOo3PCjtVi7IF2KCXzfrVZHPZo4HOccoceqPTvZ80NmJaEbVXSTb4Uk
	 y7VhwV33Jde0kEdMHIMzwoW2EZYWRTuDi4kd/6E0qHTtuWEIGHxacTwvec4I+Oiw+bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
	b=NTk1nHCDvtwoVYQVSNWNB5RkytEZd9DDU7KymFrq34YOVeoMBO/QYiwnTJ1keDX6y9Vm
	 oNfgI6IDGHBTPh4Qs+A1hKuju8QUNtqESFFvf70Zw344gAtQi3Ea6k1GJaUMtNRl8LWqW
	 yQ9p1mm4w1BUQ7u1sATE79VbhW2Rl+7gVw1LSWQ0JCBCuU+d8GN9EsiWU67KbM8pgNsWH
	 C3i9GCpWuALPXTgd72rmIZ4+f2/EbiyN5U68wY44kudCgx9JBn+KeSDqhYDJB0BfO1EXq
	 OWnog3VpQK5PqmZjpW0XmKrHBMCqREDMSxv4LQE6yDLW+yQ3zgA06gM8PZwPnCdKDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxVhyDhH;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9C3606A339
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD9C3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SxVhyDhH
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b4021b572dso1643748a91.2
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=SxVhyDhHUkhgZ0U87stoZdvy0LCxzYh5Q3dlcjiSOQNFiurH4Cc78V52nzuom70Kca
         wrr0PzI5ut/B/VyaD7y3YSrU7nqqx2CgU4cbtqPgxjknhGf4nM+hgV1BuCIPkGUoX/AM
         Tt/SIIQ0ozc9dx08WvZ2yT0fzRdp7k2Stc0ub+SmHA3yglKyj3kmAuVVHyKQhXQBKwci
         S0kgm+nwLZyJqxaSzFc88++WXwv4+nMRi25qG1S9bQC5lpb8vZMsTQzjZPuTKqzyxtFl
         HpBbOlPG0ezAu9Q0lhbALeJ4ERBDAy5dVms+yf3h2Yf1yc0wVrb2r+Tduz08Ddo9KWJh
         95eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=0lagWgWNFsmxUt7Wao5WcBDupFI9I8zOftG9qcfPiyxIDqSYdAtlUJDWWrkfcc1x0x
         nyJkAt5ZMagkBDqrATL7hNsH3+48DyIsk34q7/P+ziytN4xJFByql8b89wmPgAkzXNd7
         zSxbBkcR3H132V20GUPGRWF+YMNwaoil6aqBYBNmHI8n7m6ISV6f/zVXjGRUG4do1pFe
         qnIuFHykkIY1Eeg0T56exiet+c0MVG/fZAOuS6YsY1X/U6WrlwdcK920dBLEpgi10F8A
         WKZHE/KtepfsFWv4qOw1i4bRA649Rs9aHJwCU2WEqBqMtXGQbbYX+pB0F/ty2Eg7vxk/
         XwNg==
X-Forwarded-Encrypted: i=1; AL+hErGJhqmtrITli+zBcqNoCwk5Ydcp1bJncMAaQqFiTggswkKxBVu+aowvdV2a9bc9vTtoDNMA5J/MjKQAgA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9yeEbs4dvKUd5YwM42ZFn/8rPxCn2UPRw1zYToiUZZBMw3aYbe
	2BnFbJtuY26SFbAzQnziaRZpN3xFPaVONpNrkYzekstsBBVKIr8xNOme
X-Gm-Gg: AZFdTZfvbcQddK1oMFgz51I9weOtWJVw9zu6F1tUgDdk7HZ1geJtDLorI9ObDecVMK+
	P2FpTunP7a0YKnbWMO/eNYnyj+WTImSmDyyZkOVzib0Tdo4/XfrSmXFnhw6c5VZJ1KzE1cnkhrQ
	+4ftd8zUgaQAyOcvQve3pYrGzFJGLNRt1UGb5x/4x2B2Nm+d7vK6hLVQrfxVsX9FIzyW7KGiA25
	HJRCskgINiHO2YkZ7R5ujx8x/p8jkHpdKngfa5ngBnqp67lvCnKN7rVWajlcJKG/co2KUs+QxZK
	ZIfaXMOaROj7piVPCi7DtaV0RO+dzAcwAzumjNr0jLKrCVgDjB42grXo1LnnHDGeM3Ii+BvW+tw
	3diE/cR2bUqlj60aFMobbBXkBsyADydo0sfa1/qqJANsAMOnmyMnfZZBHtTPHlddmJZpU9HJz4P
	cpQv3Y+vAVFnD4JlHuY/9SKVESJoZ/6TJOROBzDnOLstjgRgPEnM6qD8wEuAnYdG9CbO80WrHKF
	LgZLeD87jfbWECQTTJPYQxtsUDPvHvRSNdo6gfdKHzDpU8B2rFhvKexWkH9qmCMDffIRizaZRhq
	l0T9Mkr7tRytdeXnMcRcRYa2DhqjbfTVJVQfffDP8aUb4/u4ueoMO48a1Mut4NAxhGzduoccIji
	Cmu0=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)
