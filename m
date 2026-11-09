Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240967;
	b=a5yml4DJgu/LVBf+CNrnQNppydV4+HTH/UyRCB6rc0TuNcD8GpbfHwSc3rvrFrc1sa4+
	 Q0O4xHR91iApUE6QYcSsKa+nhFU5MO1J6rVz/p2U+YdqKZHRViMrwZcILx+1FiB08QCun
	 Rq6joxGXLuLDrRyzB5KSN+SNLN4tsbBu9LS6NyMWnqZalioS584c17dmyL6wE/6OegRXj
	 RKEkUqGfnYSUxfncTReg7u7XQOhqNZ/NY29RCo3gYYpFoixCaBcHSlxWpcWkqesVzbM1N
	 ozUiN1youPEbPvMQU/WJW2qPPA6BCkatQ1100KFlKhcGyrr0V7a3xOdsM3XJw8IMlIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240967;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	b=Jvyl7onBUdWbm4mou6BoOJDzoaPcbL5x/4ZORbDhObRVl0Eoz3AhaTS2FQx9BtMASWMz
	 3yoBT9WcDbMPoY87k0GMiM/9MjniF/7RNBB/sr+aVVBeIY/9ZcCmELXL/2BjYHlT39Yco
	 qH6GBiscp5VmXlVvJJFKXmaNGAuLxtlqhq12+e59RjDnH01pQFE3yCNuvDcOR0Lj3Df0K
	 zn38hwrRNja5UFpLHaG7G1zTvcts94+Q2rJGD71YsYekeg22Gnyeao1yil/bOn+usanN4
	 xDzc72DUqvCXNGbVi7BOaiTbaQySnKPoFK8rMii74TCHG/G8Oz+53UM39EzTPlQ3MPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i6au/myG";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927D3606A326
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i6au/myG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5961B1F008A2
	for <linux-sunxi@lists.linux.dev>; Mon,  9 Nov 2026 16:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794240966;
	bh=a+uAUjhXKEApJwrL+oxv5vaGLoNsPevTJGtjjvevzRI=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=i6au/myG9p4GsOKM3Vi2VV8GPL0M54b1Q0aP+nLEVBGLWzFiIIQL51O1MPCO+TJ4P
	 dOOlbWjxw1rDvIUfDn3HiHecyjD8xeH7auCSya7gDynZpsG6ifrwDgv2bj7GEdYFIS
	 6koTwc3GNJ3y4HxS5QqxvXa+YXh6iYr6A8T2PwO6HCn5shYGBESjwyGMR34m80I3S6
	 RwOdZ0texE0E8hg2AoMGmeS8P3ZBs66cKKylaV0qlfR4zBPdrX44gquG1jpaLHZqWu
	 iVi83j2JSgA+Ktlq/6aFAKZQLOSxJXn2dcRSQ5YbGFPhVhc6rBxkKvUFpemhYanYHR
	 PRqMUgFKiJXFQ==
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4ab8cb2a6e4so613241b6e.0
        for <linux-sunxi@lists.linux.dev>; Mon, 09 Nov 2026 08:16:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF9HYPLe6s1a6pnuYXKos0fkcFXZuEJIvKofjiFc2+bgUeDuwzYQv3yqcyoNXXpHjKGPEB9zVeQYUMfdQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ScdGEZwmhQ763bsNV1/JgClB1qzGYKGtWTEC/3YNNHsqMLwR6
	TM+sio4Jva06a8qcDjqdEZFx+ZJesqbRonFOBOhyhesm+w1OpSGJrGaevyODVKXK+phrp70grSV
	LickKnKVUpjgiG/LP6OAzsR57OH502Fo=
X-Received: by 2002:a05:6808:1209:b0:532:4867:8916 with SMTP id
 5614622812f47-5683c9e2ac2mr94540b6e.4.1794240965556; Mon, 09 Nov 2026
 08:16:05 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
In-Reply-To: <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Nov 2026 01:15:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
X-Gm-Features: AclHuK8oi8fLMntRJV56LqbfIWbbWAJenIS4kljcKk7VrVTWKVxckSNOSzGxgTs
Message-ID: <CAGb2v66J=FaqimwrqrbVuBVb5GMuhizp2Hnt6vN7CRMNhiuCFA@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 2:27=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add support for the Power Reset Clock Management (PRCM) module found in
> the Allwinner A733 SoC. This clock controller manages the clock control
> and reset functions for device modules within the CPUS domain.
>
> The PRCM module includes the management of three primary buses: r-ahb,
> r-apb0, and r-apb1. It also provides clocking for several key
> peripherals, such as R-UART, R-I2C, R-SPI, and the R-RISCV subsystem.
> Additionally, the reset lines for these modules are integrated.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
