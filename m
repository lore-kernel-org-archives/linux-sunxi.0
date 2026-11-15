Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727877;
	b=m5oUvcFaSqLTTOz0Ppr7kPi0cmN+1GnpJSVIOeQVroY0hu5CFVFmj1VdFND1/UwI+CFx
	 zm586b/Uinicyam5UYDCtLm6NAGGNnG9b7f1YwME08XcB1tqhp936Sj6L5FIqIP8UVEOM
	 1HRLVeaJ0KOb5zLEed/Noa+/peVPnhMsXwIycb8MlM9262PIcRQfX79UxrBrC8LrR5Gtv
	 HLEjIT6GrAihMI39dHRYBxQdyvdh7YgsbMLq02tMlS3J7o/ELNASiaSjrbe46woDlVSte
	 oF1h+T+op/oRDgcuFJMD25bWJk52lcCax6Ve1DPn/cSFelVmxXxNJzzfk1HmRTmryOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
	b=zszKhCCa83kzKhNLB0K6sYgp6c4K/5LXJYitMfrOvj27haG9NGIgmMCvO/G57GqD0d0g
	 ts7V+Ms+R+jmbqlmsNP/WrClOdCGEGVZ8DHdAUFIMghI9UnXmKBe/nfvmg8xUwBv7K0TX
	 OcZoiMreVreeiXxXPYPHTrpBe1bK8hmSV8RihhpZFNNPVVKIOnbQwCw9HLvX3vQNIDmUy
	 DpNmiHe/0aUxuJCJxvhzRKtewePDrQaJZx2+3bPZTMfqwySldwpsbW0WpSTyHHFRxpC1x
	 kqSstHxP4sisT5zv9gvehwseH2Uyywo9P1LrW+P3FJqT5Kh1IgliJzva6MV0St6eKmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHGbz8nk;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E637606A31D
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E637606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fHGbz8nk
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2719975f8f.0
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=fHGbz8nkH3ikpMKrKjjdG4uB++MoLoYPuWycsQu+8LygYddJFKxld2owWJkNg8Nx/4
         4H2FvPo/S1k4qKglfxWRh6ZEyA9VoFyHlvAjIh46gpVlB5fu9LSdKqAdl2ichV9TFOEG
         9m86nTbZKrhGHKwCcw6vnqnwCjzUV7w2YIksVawCaGnNe/Ly1QN5pgtgxAze926DaVt4
         TuzbzWai78YfqAvbp7yxIL2z0gjuAAoPFIAcbS0upG+PA55H6l8b0Ucy/u7W4AouOfzs
         eUeAQZ7T3HVyW26tjHv9uK4ZrjjIDiT50G94XSpWUiVITx3ecTAceQ9yXY8LWavnlJLF
         CwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=K0VM5gPS9imyqkaGJwwS21L37SJxAnfcTkwwuYlhh3f/thtShZ3/oWfJ/0eAeLsGSz
         NZdLeqEV8cPc/CzdubEtOxIXEHJJVMD4ax1INZZ1LRAyTWG29lmWe7Tx4UXYmQt30ph5
         rOPdqdfgFQnZfLnY41eI0hzZ+O40b6hiU7IhDu9NGNI8flBy+tK7KCrIF5b3T82hyGt7
         g5/XRwMpqWnGKiJau9ygh5JQAOuabN0dXwXju+Bgarp/eONp7RuwjnLL/BgzUEgVTvDs
         /fodGzR3zWln7P4QP/eI1dL4hKNdYFs6EIzRZe/aS8vYPYHsvFqqmA8OY04zBGYXVsY7
         L7CQ==
X-Forwarded-Encrypted: i=1; AL+hErG34Clg5xu02Es3kJIj3UYn8bM0IMpC7L0dNQJpHxorC5MTrIJuwUXa/qBGF8Xi55NjZX+sryhLta8kUw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/jAk9ttKgXYCLAeNAOFYbZfFkpvEiiXaToiFUd+8WsO8Hy7eUk
	516O6zpTnUpXoys+zCgIxKcQ4nBN2x0EfHGHYNJupe1s+Hi3ObL/Nct7
X-Gm-Gg: AYBFou3MbJLWy4td3awDaE7KOmpGvlhKn7UXwVf2sFP04JHd2qBfMmVdneqrSgJ1/5F
	Aupkk2disFGaainI7yRWprFv1vufxj04VBX3LcLqcdeWHghdvH2buEA0laKMImUG2KueZtuHxFe
	4LEqu1d5hjtAKuBKvV2Nwk8p8Hmy/v06kh4Yh2myd4UEoSOuD75eCHT+6yrO/NT7d9lEHSDSfEf
	yShsNF9XmQ3Sl3oGQCSpuGoAxGSwIOezJE87GnG1QTNrzlFQh3EcEclGrl5AyVqPC5uhAT31gO0
	bztFBpbo0Mui33vmn7/slvIT2r7Hn7wnwUhgBma5bhcZV2UuqkDC45qpumRBL2gltWgob6j7EVh
	69V+ePOjnNO8/E9eE9oeODyz6n+3o+9ovu5SmXvN/Fv7rWPH5xyjQfcTUZ0/Urb/t9Egr1orzaj
	TG9EavSlOy5y0535X2ZYK20O9WIthADh0yJHYkIWGwV2yZ/H63yxarGaS/aDmx55d4qxtheyBdI
	KLiWecmt/7ywtww5DvBUI/Ztp4uKJDmTiCAj9gl+GRQtcTJWVhRpfpxw8YDqHxc47sZdPUpYCJ0
	epQqCjTZZBRbfbXfFh7DdAzLYkHc5O2gV5ZmUXH6jaMmUG5PX1ud1iUqSSti9AE6FAdSde2cVnw
	x/5C3T3nG4XYjIBmPLSJF4JA7k6/zUCccWsC1R+NJyAO9Xml3OyhW3EUd3OEEy5WS7dPxYowvs2
	/sAGJXOa7t8aVZHm8t5wRpYF6Ucn7DKCUSSXX89KreLhUA0z3Bk7tKYVEUbfLIOSEy+Cam909eM
	DlPBns53s28FoDmblpuKE+ohA==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej


