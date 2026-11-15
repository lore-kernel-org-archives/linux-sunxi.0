Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727926;
	b=0YTMqtXceKHbH0634e0AdEMnKefRwu5qKrr3/HXk13vHiRcU6ig/vjZJAakMUVzIbTGV
	 dQo5CwIqoYQohUk/ntJODJg3mzcRGx4XqyPTDo+NNW83QbdL1o0zH54gxUs6zX1i6idd5
	 y8WcD17yBRwXnnNR8UdMLVtpKYKeaACOXd8rv7bXrE4cKxYMbzKZBg8wN9raRMA4TuJtR
	 BSC7vE6CftsgxIJ0LKxlgxpLOlg7/LkrqHLcEf1NbtixriyV+SmYSg3I+Ic/YqCIYU20h
	 wUgRPrZkG4uNdjwxgfMX2efVkfXQGFEFiG0Cp52lSZml4IjiH+z/rxUxz7xrbPspHHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
	b=qh1tOUirsP4v5hAVvsk1L3hRoIeLgIR0RYfi41Kpi4YrjUgKHv7J7v/Y0Fi2jR8mlJrp
	 3PcyIacSTYemxHJzEWZr2E1vqDL4xpIOyE6iNIU7NpgLtkOXB8bAKeZDonYK1ucasAyhy
	 Uq11xdrek0Q2LwATXOWlooRFVEREMFFiLBHWo6Jgde3eit6AopW5lix6y3TVQspBGAK2m
	 +v1Um5s7FKbfwz5d/x1j3WdDunH6F97JnwnSki8RCD9c5hDJi0t+luQL6qIVVd/c+Ax4F
	 EZjS7xRH2rqoRIl7qSPKEQGHV6YgsRn9nu/uPe4HE1g9YZ/HU9ceL6uYVrknXEbJ0NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZT9PXM3C;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356E8606A327
	for <linux-sunxi@lists.linux.dev>; Sun, 15 Nov 2026 07:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 356E8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZT9PXM3C
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490a0e72588so1007624f8f.3
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=ZT9PXM3C9+J8wdJqUgB89hunEEc62GuMVBRlnJC/9kUP5hjE+0n8eA0Y9kjiL3lFSB
         QgZaiGLSqQHnag9dJU0B/T6JXpMIRGskPzhvDxebBLQBpJLQwr/o377Et746OtCrj2Ij
         b+8cA2fuj3pokRX77fWiq/EQHr1abVL1O6deuLSb2/74qiIaRrqXrLS26HuxpJio2G5/
         +NnT3MSfoH4oMaJiFOUlyCAmy7uXD3u64ib4QSU/JCPZjR8UsVTgDTbWFbxD5j279dlc
         3bEODA/5kNdszPwszWOgW3viCuiNZONZ84IvrPeSTPo0tDWU1TtEYvBEcXc8xxFQx3vi
         609Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=Ve1e0gEfXvhtFuUDMzK/Kj3jnxWhPMyNDovEev/wviNlQB67Y2JdCq3ZhiNGVKYXqm
         kFLJSnhNpm/MHRHNBrNvrjnHYspMWLBjbvxOPvaRLzEFsC5RPFLQ+PcpK7jbwivFVji8
         hNYQv7yVCixo9LrE3rzXNex2FmGNoZ2b/qQsJx9RiYRTHEAjApUbi7Baq9zJLbYcn1sC
         AtKVxo2yiDgxeSDoM+fO4qZNB7b3FXmEoHBiSv2qj81vRs9J+SfFsOCXt/f+fk064D8b
         qoXNU9IQ5g5Evhfe2M+Mb7s9lG3GbUXaY1wqLrR85beM/oi9xhzJUySgQMkcbaA1z+Np
         Qt5Q==
X-Forwarded-Encrypted: i=1; AL+hErEldxI01EH/2CGDINTkgaKuEixKkaB0N3uGl+TzaDRGSPdh8XX+rlPUQKHZ64K5l20R03bcAnBGYA9EeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/s17NI/ps2TVzjM97QYHEyP84mDOvqRXnxqM3J8or1bAS7UG/a
	mcwcRrExnVUVAWgc6Hj50CE5u9rNoMffr1AMBq9iXrWQKbxmPb47KroY
X-Gm-Gg: AYBFou1V8ygXqr/08pbxdJaew6R3Xaw0Y5YoiORVMShyAX3H8wtyypfyny3WWO/U2To
	mt6HWOS9zXpDP5jL8uTQ/NaJUwY/ySvYaOQ5w2GC8PfcDF2UsfRstu6GcvTejTNJf5UAnSUr32H
	K3c+No0cH+cxA00348XurN4QIItwFDwa7ymVnA4rcn/1uyAi5lnW8YUufsbrkZQEbGSzDSEBoPy
	f5Y4A4XlHM6dnL7c4QuXjuf1/kqIeFOh8cBtx43b9nzaDDl6n/cs/IlUCn0/FxPqqJZCOn6xurU
	vYPIazHkgXE4KqWxsn1wXcyxhWLE/8Z1n0cMYSvosTXAvTjBnrTkHZZERz7npH4OdxAkFjOzuNP
	CvbrAHwlPQ9YWAJMveEfFE7n8CR+nG7ApbcxjWdZlJdOEcoh+04DbiefH2OUvGxidVuoYQzW2QM
	qvq3P80R/0h/kg8wPjtHFbboAPHtszG/tHQcH+Ix+0HmNhNJbelBSAX4i/HHvu15KowQQVi2gXA
	wxfRQu3dVn+eYqQk8Jw4fwCep+14pkJflT8u20SqK5RwfYdW406N1C3rCSBGRVypauaeu3tphhg
	5AnnxkJ/v1sMFluN7lDP7rlAblTF/HeqaGW7fmllijv4t2Ogsh6X+InP9zlC2Q+EJ7sqtLrwLbf
	JENIqOAesn+fzLJ2s9ajDwPsrTtprUA+o68VMK7cPSYJKqBjdK1AS5UO5f/B+6lHWU644YBym9R
	W1WS6W3rrh5V9JULGR1fTRfhuIuipoPxPW5u1NUd5p6aYV8iGCHE5Pnv+WDTohk9hnod2+rszJU
	F+pG8G236vsOhwYsGH15uRvvYvcHGlxOvg6SoFNn5Ieon0=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
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

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20




