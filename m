Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFE02BE026
	for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773479522; cv=none; b=c2IKMbHfGFZ9tycIgplTEe+qTJrvecpUiCKDq+1h00Pn+6N22gTrHQonJBNBnLVtyqehkXI8Y/seMebo5RbzPTFMlX4JfpjopK6qbLoET4ZwICyZC6Wa6W3/Zv8LvsqfNZNOuI1B2ViXRKdVe1j0ZjaHl+n0OftNzQtB9FUF/x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773479522; c=relaxed/simple;
	bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pb37MWNA0CqZke1m6jIJ4ATAQUmrzZUmTVxdj5TFMBCO6k0XHj1gag0scc3UCccN3W0gpSxoHSP28uevX/nieRpZlnmxXGptG8+SeTRHDRpTl0lxRLaw467zyssvl+oeetIuIsoQmxaNoxQd5hCKkaAz+PFJZ6K0i329am5EgSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iMDnkPba; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iMDnkPba"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso3083136f8f.1
        for <linux-sunxi@lists.linux.dev>; Sat, 14 Mar 2026 02:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773479519; x=1774084319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
        b=iMDnkPbae4pKdPRr/PBzQFn/yMkMJKaqNPzvkSsB/c2I2Ued56lbd2O2mbYiIZb/bP
         ZgLhEpseV4CMg19ilWsF0Z16ft+1fyYseuGS0IsslrWdOq4s39dAC4Pn66Rc9prOlNGa
         b/9bitkPtiByJiEsL0R2aBlivrXm4unKpvenKqV31pQTaHT50L8fu8LlKoXyKTuJrNKJ
         ZWeCD1qNtka/ati0ZBKZ5xedQvGnCVY5newMaPcLYUiMnvWcIFgE98bhrY10PQwRl/Tw
         GRIS5DvMFgFtiXfQOaduWQE7lEwO8XPDqcIqDnv2esNx10C2tvUvyuvOF1UwPHjhkpN5
         F+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773479519; x=1774084319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QiwL16bjOziT5hiJB9OYiaVlhavbbKb1oaWep8hSRjk=;
        b=F0WtdTdO0nhVAZJcfttaMUx4hyr3m+KlDH8dZeJv2sS9Vmd8Q3yGIHFbp5rZaFFi2M
         caoU/4bXKrNC1qtRXJ6dRuP2ASn+Do4jQPtj9PIEvhKnMuHFU1E/AG9Esm4zTObWNtoA
         WkjBvnqq40pBVMzyUsGdxwwvYjFW1T/H0Sh2Kik36SadswoXcJaH+dxpR2RklxNiyNf8
         ilqpUneM9hSGc9M/wGCuTivTJLXGFRcKMW5Z9d/T7JiQkrXD+mPJD0iVmNJqk1kpfgZS
         ssSu5mxvT5pFbfIhnbB/BeXqDv4ccXPHLDdMl46RUkzeJdt9/eXf4xb4jsQ9A7X+tE27
         TbtA==
X-Forwarded-Encrypted: i=1; AJvYcCUMjuGYk5D1cRxFXtTvbJ58im+PN4AIxVXYUUH1y9L/qVIhI2db6L4LjWA5WeVR64NJINkFWtNXjKrptA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjXPzwMH8No6fyIqItzUYSKov7+EFKnRQUA4g0b16WOVFTsSiU
	M2PERomP8+ugyLwrZaHuDhzUkSYk0Ztjvw6ZFJ0MLdQiBbF/kwY2UVq/
X-Gm-Gg: ATEYQzyJYJzEL9UPNJfJmSA3h7Y6U6HE1/KWUd2BHIQnu2a/WIastenU/3vl0o3kzKU
	dpQvPzTjCmVjcvnNmAtkTWxgQVLg0crDYDUZRhYzo4TO9f51kYth5ZHySXE1LxXZvg5PgzksAza
	hM0Q4hi8YglqZ7QUwUb34xywKv3YzVTBwjeNlhQFGyABhShpeIp2naMu+fI6o1USjB4a98h1E4q
	HDD6MmMNa09Y+EutFtjm5iPaLhFB2aarNymKgSD3cfzdZ9sWHjvNvaQZl7y1YHRbbsSITipfprZ
	Wux+9+FGUgCVEPdwbD0ZyttQggtzADXH+q320yQbIiQD6IhX5+oU0ENsuI5VagCsx7J+WtvacLY
	Iq6cOgvIRVaPs2o5/YM6UK9lpr0tg7B3lg5T2f/fCQwAkmjOeIL6tvlyScul9DTSekQ1DvUMLlX
	whM1QkOHeYBAM9vwxsuTQyVzIhsU6qkm+XKJfr2lOjYoPwVGamQRjRawfRDvfTBAiEeUFp457Wg
	B3s39vvGit7DnM=
X-Received: by 2002:a05:6000:2f83:b0:439:b940:8bfb with SMTP id ffacd0b85a97d-43a04d87714mr11537033f8f.15.1773479519281;
        Sat, 14 Mar 2026 02:11:59 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273e8sm25569590f8f.33.2026.03.14.02.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 02:11:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Icenowy Zheng <uwu@icenowy.me>, wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
 Linus Walleij <linusw@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
Date: Sat, 14 Mar 2026 10:11:57 +0100
Message-ID: <1948361.tdWV9SEqCh@jernej-laptop>
In-Reply-To:
 <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
References:
 <20260313000652.11470-1-andre.przywara@arm.com>
 <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
 <CAGb2v65RD3ksSnEC0RjYYQ1J-NoP9gGfeTR1UCfLgKCJEFBSTQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sobota, 14. marec 2026 ob 09:38:11 Srednjeevropski standardni =C4=8Das =
je Chen-Yu Tsai napisal(a):
> On Sat, Mar 14, 2026 at 1:14=E2=80=AFPM Icenowy Zheng <uwu@icenowy.me> wr=
ote:
> >
> > =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywa=
ra=E5=86=99=E9=81=93=EF=BC=9A
> > > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> > > register frame. So far we were instantiating one GPIO chip per
> > > pinctrl
> > > device, which covers multiple banks of up to 32 GPIO pins per bank.
> > > The
> > > GPIO numbers were set to match the absolute pin numbers, even across
> > > the
> > > typically two instances of the pinctrl device.
> > >
> > > Convert the GPIO part of the sunxi pinctrl over to use the
> > > gpio_generic
> > > framework. This alone allows to remove some sunxi specific code,
> > > which
> > > is replaced with the existing generic code. This will become even
> > > more
> > > useful with the upcoming A733 support, which adds set and clear
> > > registers for the output.
> > > As a side effect this also changes the GPIO device and number
> > > allocation: Each bank is now represented by its own gpio_chip, with
> > > only
> > > as many pins as there are actually implemented. The numbering is left
> > > up
> >
> > Ah, is this a userspace API break?
>=20
> Unfortunately, yes. This means the easily computable numbers that one can
> use with the (deprecated) sysfs interface is gone, and also the pins are
> now split amongst multiple gpiochip instances.

I don't mind this at all for new SoCs, e.g. A733, but not really for already
supported SoCs.

>=20
> However if someone wanted the old "one gpiochip for one PIO instance with
> evenly spaced banks" scheme, I suppose we could put together something
> with the GPIO aggregator driver? It won't have same base pin number thoug=
h.

IIUC, this can be instantiated only via sysfs or configfs?

Best regards,
Jernej




