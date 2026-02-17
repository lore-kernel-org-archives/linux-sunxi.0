Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE5236CDEC
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771346626; cv=none; b=hiSRhbbUm3Ca+u4LmYZAq/XI0+P4ZbqWy4CfJmRYOz1301NviANyeOCKbYVr8pGrOLCnW64IujY8hHSspdp6xenO/B07bDP1ZCx93ph9lra35u+RSMLAr0U3qAXh66/gHiuqffZmC9YFYt/V/3VbeYcpbYeWViCpR4mletaRMvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771346626; c=relaxed/simple;
	bh=e44I+gmR/Crii5lzJC5/nGh/rjAXjynQw2DgvMzop3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbmdIH3dxgPuCCmg/NWpKqlx/mjXXKjKuVc2ifIsdMbC0TApkaQ8Hf5IJvKW3B5J6V/K4ptunkPb+3D8yKR0wBgHmQoxMRvAEiCLN9u1o6P+3KOtwRY82BBtfBATe/7hrTyVpqhLX/siJIaZvzUVMOjyss5LWr98T8Qc6FSGwLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEinzWkh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEinzWkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D532C2BCB0
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771346626;
	bh=e44I+gmR/Crii5lzJC5/nGh/rjAXjynQw2DgvMzop3k=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=uEinzWkhfejDthNLMSVfdDkyp7ZNlrdBHapzEqlt5sMHX0GPeazD25p14sZ81t/uP
	 HOrdojvB5kGpj12bhyOuJ1+NgVk2RiV7+qSI9tGm/wnhbpZCNvcdXrGLqPwWPyenKo
	 Jyoy0TVyjv5wQnb0OynEUCkF+uCIHjzS03bMZM8Qc+A+eguT/vzoLHG9nZKr3s3hX+
	 55+uvw0F81gURTjMubgsUf5EPcuMTdpMLNo3DU9nDCsS9BHJdnHeSf24uJjVJigij2
	 OcoKwaIgZ0ZNsA4Bf/weRPvx5MybGAtP4B5zNkEWklkrxEyo/qfnDPCpsuqbMHgaoK
	 3LsEw+fwntDyQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso6207599e87.0
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Feb 2026 08:43:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpZwqZQTglNZ2G1KUjWiq9urlCiXE8FFOEgHPklgrAnOa/bEbS7vC/oImk/GczxkEC43312jv8mNzarw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2FAv/AKN7Dc8G7b755SK3D7BC3nURaHHFZzcErPu3XN3lTQGD
	RpisPp54xmMs2M+X/kd9SQIqTSkmtb8T4+X+9yScEeSe7yY2VuonOiJb56j+UTV3Vu6XUBi7k3n
	/aBjnoxAjJl6S3KkOKrh7zVims4OPWO8=
X-Received: by 2002:a05:6512:114a:b0:59e:340:e557 with SMTP id
 2adb3069b0e04-59f6d357cd8mr3391698e87.19.1771346624454; Tue, 17 Feb 2026
 08:43:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org> <20260217163208.5db4cd1e@orionap.fritz.box>
In-Reply-To: <20260217163208.5db4cd1e@orionap.fritz.box>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Feb 2026 00:43:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67NcduBxxrFeVkhi7eKyBBcMKy6dptHFrtZg2-Xs2Nf7w@mail.gmail.com>
X-Gm-Features: AaiRm50IgvwBli9VJ3oskhBXlgPk6-8kaHQNo2uOGlyvC7LHA0MeNNq9rzrpr3Q
Message-ID: <CAGb2v67NcduBxxrFeVkhi7eKyBBcMKy6dptHFrtZg2-Xs2Nf7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	James Hilliard <james.hilliard1@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:32=E2=80=AFAM Andre Przywara <andre.przywara@arm=
.com> wrote:
>
> On Tue, 17 Feb 2026 00:09:45 +0800
> Chen-Yu Tsai <wens@kernel.org> wrote:
>
> > After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> > gpio_chip::get_direction()"), a warning will be printed if the
> > gpio driver does not implement this callback.
>
> I am curious how this could slip through? Did the get_direction()
> callback become mandatory at one point, but no one noticed that it was
> missing for sunxi? It looks like the situation was even worse before that
> patch, as it was dereferencing the function pointer without any check?

Digging deeper, my attribution is incorrect. The actual commit that
triggers the warning is 471e998c0e31 ("gpiolib: remove redundant callback
check"), in which a check of .get_direction before calling it was removed.
So I believe this just landed for the next release.

Thanks for spotting that. I'll send a v2 to add that information.

> > Implement it for the sunxi driver. This is simply a matter of reading
> > out the mux value from the registers, then checking if it is one of
> > the GPIO functions and which direction it is.
>
> Mmh, it feels a bit backwards to resort to the function name *string* for
> comparison, when it's always 0 for in and 1 for out (which we actually se=
t
> in pinctrl-sunxi-dt.c now). But the mux value for IRQ is different betwee=
n
> SoC generations, and I guess for historic reasons function strings are a
> thing in pinctrl, so this is probably the best solution after all:

Yeah, I was a bit undecided, but using the raw values for in / out and then
having a string comparison for irq made things even weirder.

> > Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
>
> FWIW:
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>


Thanks!
