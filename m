Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714550;
	b=uXLcDEUght35NqUCimhaM2jxMVQQmbaxr+djorSCDjlBUlGJSEqrHYRjDo69Zn2WOb50
	 TNeCEKsUJcWPcnUbugTVXMOxVkQqwnW4MGFyuZmkKOaZcTwpNQnD5m4ZTXBRLMBOrwVHC
	 8pXHYZqBid9DjtUlX5J6oHvnl5HxOEZpiBTnKNCHjPnCW2WYsIGykfztu+Z1vYFAy2eV7
	 6L8jEWzcgRNsoaZmqm8ATcENpSmz9bI/4lUR+ATz6ESftTKanCbYybOZIKH6y1l1LRyqY
	 HuH8L6aeUkwr/ABXuxWUEL+oUXoLsURnablvo6V3Ro/xrmNWmiiOj84sud+dJTAGNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
	b=BeoKOkd3TK4XRrW8So/cupMRsR5L2gt206d4aLb+qu+yi87OoC1JnzxwJCXUJbreNpox
	 sno+Sg3KqOm2zW/rRo8Y4GDZOciQfacNNahMjIiNtGLehhNcWrfZCal0mp1Q4pZ6075lO
	 3JMFNNHrvuvOYZspXwxIojlKj2z2Msidt8hO/ykDV+E8McMlzOsdR8EBTAdM4aV0N3uMz
	 MQjECYjLtG0EmqOd4eTkMQcHKPrEYf+7exJUv7RuBwPEoXF8p/QRsXUIdJZXkcoSF6jkO
	 lxWFa2MRbq8esZ+FTz8z/keCv9GMReb1WEAgRUw1ZPNTF2TMaQ0ZmfMWAVpubqBJedg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AA78jGKr;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7CB606A321
	for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 17:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B7CB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AA78jGKr
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so47348095e9.0
        for <linux-sunxi@lists.linux.dev>; Thu, 26 Nov 2026 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795714549; x=1796319349; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=AA78jGKrlenpYWrYn+dNf6Vvjksuja1eHp6JGmI4XCT//lWxW/+r3b9VvNm6w4sf/K
         6I1oBW2ooklM2/N2KzGp3Eas3hLscz625GK1ueBA5H6cOBiE83JSd9P3VF40zIku8TTp
         MuSoZ75Xs7zP1+1a9pNjV8FII4IaccD1zAb1Ee4yA1TfVKKXOzJtk9rJbbjHomNxhQGG
         OAnoJJkOFOOY2/K8J4YaZlLE/swKPiuY9zXqFVC3eB+DCmaZws1I4Bd/1597NnNqy902
         lLsdV7qSXoPf9ZPIILryrUs2MxPbEvUAZ9v73QPR34IQjr2vyyRXrc/hVu+4CruY8BRn
         eC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714549; x=1796319349;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX7hQvpKRLbWPJiO5CVxnjE3ZLRTJ3WKFWSTYSfxc60=;
        b=hJaLkIQygqzPo7Pcm6+GDp7XhnBLV9NbFdKQ87Uyrz3qTICs4xFQPXeRho7mArMjVk
         nQyUvzVcJCyFRkuLBOX42JtwMzO35ny0eODtgV+eDUuCZ5caO46G1whSUbUCq1qwMvOX
         HiMhs3xSnogdgzSqHihKrF4F7E7RUZ/P2hFnv1t4jxoT46ksbVCl+kTfSb+b1+Ivqzao
         n8d2jVyzOZINGAYZw+aTcsqDXX/PL06/WPygIrmF38PNVNiCRqCVXoqZOPMCiKWHIVpI
         XaQ75WQ+yFnjbHZeuIFtCvvnq+IwwpzGpzReb+A9PKwJGrtk73VsiyOLbKa3D9oibah5
         qmnw==
X-Forwarded-Encrypted: i=1; AL+hErEn/K0fLAQTKkdrE8M6qeqAGS592B8Kg34xQqrSVLgczNABYQEl5wFgve7yusLhDwJ7Al2We0xJeWMfYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/8vp+y8/r7McnbZFM185qwbqhaIqDpta03OmT9zdARlH7zvrGK
	4tkQhuynFJqzYtNDhepiGBO/bLKhmEiVa4IKTM37numTzCVybMXnjnK5
X-Gm-Gg: AZFdTZf1oIK767llxR/pf0Oi/FpL7JG9C3ntdeJVSutQ5m5vNgUZmt0N5p0OKyQKFZs
	eYXub2LAuQYOJh03ufmQg7Q6jPTMh+C4Xrwu60t+pEU8CLsSuh6xZ4kKXwYjYk36KKAMbZr5ui8
	YgQUlDD1IACYauurpcvi4Uz4NT1r0VJ7GyDRH1v6qIKuK003kQcZ4/LavtbjzwZ+BWH6BqA0jhQ
	oL23do51zDDR7DOyADe9ODPPvkqvXJtbK8iFqXrMGdnJH3R7h9zlJiVz/zZejnjGN+O/VdHBn9j
	SjWRQSTZhiF9w1U2wj25UiCwTrI68LzQI8E77I895pRsltjekb1oeW/uc8zPFjJqjCG7pSKjvaz
	2IQQ5draRvyPJ4JjGOcxPKDgf7icSdQeseUNNLF9G1y24yow6mERx5bPguZzNGkIIsh3Txug2i+
	Mdze5gcZlb48H2CIGWrdifeUZ9YGIQNRHF58JDeI8b1TkPIo9JxvuerC8n9FWuT5FJC6GdRmB0a
	IvHVxxT+2/AY6KDluIyusDg4Z8HqkdY9OB01mTdZFH7GSgE5bqLMlxRNPFLFNorXMWEROJ9ms5j
	871K/rDZwRQVgcmTh6xciIKV7MlUGS4s7EB6VfphSDz+qDQtFKhteWUh6v2LWAVfLR1+VUo7iDG
	3aWd6nQ6BUwIb5i9keW+ciRrhSH0wG3u6u2EelGc7pyuptQjcbGvKgNKwDpMr2+/avdCX6QpIUf
	JimV/pcfwiV/dDUOqTawYKNmJNN1hK1s3Mg0hex8u0hDcbZnW5IsIOrtIcXI43b/xv2fOo65/is
	YlbhXAaYiRA4X2L+KE7zPl8xRoSkjKpnrQhE/9JdcgJAIbCjW9gDz8EyBFvXEU30Oic0DtslmPt
	VpIzxVY5
X-Received: by 2002:a05:600c:4f84:b0:4bb:8701:a2df with SMTP id 5b1f17b1804b1-4bb88809950mr448141145e9.17.1795714548844;
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
Received: from jernej-laptop.localnet (77-38-7-250.dynamic.telemach.net. [77.38.7.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm397758825e9.1.2026.11.26.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:35:48 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Alastair D'Silva <alastair@d-silva.org>,
 Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] pinctrl: sunxi: Drop unused parameter from sunxi_grp_config_reg()
Date: Thu, 26 Nov 2026 18:35:47 +0100
Message-ID: <AalbXD-rTNOJWAc97z7puQ@gmail.com>
In-Reply-To: <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
References:
 <20261126104954.441427-1-alastair@d-silva.org>
 <0defdc40-a96c-4df3-aadf-3c3db3c48b7d@arm.com>
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

Dne =C4=8Detrtek, 26. november 2026 ob 13:02:59 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> Hi,
>=20
> On 11/26/26 11:49, Alastair D'Silva wrote:
> > sunxi_grp_config_reg() takes a pctl parameter that is never used.
> > Drop it to match the original signature.
>=20
> Ah yeah, looks like a development artefact. It's indeed not needed, so=20
> changing it back to where it was makes complete sense.
>=20
> > Fixes: 8b367fc08be4 ("pinctrl: sunxi: refactor IRQ register accessors")
> > Assisted-by: LLM

This tag is deprecated and should be dropped in all patches.

Best regards,
Jernej

> > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>=20
> Cheers,
> Andre
>=20
> > ---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.c | 5 ++---
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h | 3 +--
> >   2 files changed, 3 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.c
> > index bf4ec4665e2b..d30a562315aa 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -763,10 +763,9 @@ static int sunxi_pinctrl_set_io_bias_cfg(struct su=
nxi_pinctrl *pctl,
> >   		else
> >   			val =3D 0xD; /* 3.3V */
> >  =20
> > -		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pctl, pin));
> > +		reg =3D readl(pctl->membase + sunxi_grp_config_reg(pin));
> >   		reg &=3D ~IO_BIAS_MASK;
> > -		writel(reg | val, pctl->membase +
> > -		       sunxi_grp_config_reg(pctl, pin));
> > +		writel(reg | val, pctl->membase + sunxi_grp_config_reg(pin));
> >   		return 0;
> >   	case BIAS_VOLTAGE_PIO_POW_MODE_CTL_INV:
> >   		inverted =3D true;
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h b/drivers/pinctrl/su=
nxi/pinctrl-sunxi.h
> > index 7c2f29e75519..3060cef3705d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -328,8 +328,7 @@ static inline u32 sunxi_irq_status_offset(u16 irq)
> >   	return irq_num * IRQ_STATUS_IRQ_BITS;
> >   }
> >  =20
> > -static inline u32 sunxi_grp_config_reg(const struct sunxi_pinctrl *pct=
l,
> > -				       u16 pin)
> > +static inline u32 sunxi_grp_config_reg(u16 pin)
> >   {
> >   	u8 bank =3D pin / PINS_PER_BANK;
> >  =20
>=20
>=20




