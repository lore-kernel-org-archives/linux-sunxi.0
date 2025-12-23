Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7A833D6D4
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766487865; cv=none; b=px4+3P2zEW4sbI8I2vWjpJ71U06iTMt7gQfViXM8kw0OG+5pZse6pAS6G5Py5qdn1l+RKLfDYJUhNwNazGWLbI9ZFJb7pdnSPjijHtrhawUe/+R60tKNGds8P6pAj2Kc+e7gohcaWxzm1Xxq5fFxkfc7I9iaJZkblK+s+2UzFJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766487865; c=relaxed/simple;
	bh=biUgEjzTLA2qxnGKmM6Ej5xs7lQ2WYxGQ9yr+adss88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cV8dyZdpK7SIEUxc5AuxBWNdZh6yRmKBX+qz4TxRJ0a/f7GPsPHyFcOU7tgarWE/9SEZUYt+1G0w2N4HViq+p4Sge0UqeXRbLikSnQ8Rn0TFamH2eXB/gZzei1mxRlsipmkGna+tQCcbtqNJfgLwmPn8UxFlp0R4W2rANR9k8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4iFTtyU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4iFTtyU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D538C2BC9E
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 11:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766487865;
	bh=biUgEjzTLA2qxnGKmM6Ej5xs7lQ2WYxGQ9yr+adss88=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=r4iFTtyUaJSeS53r1g6gYRFQ7LBaaU420AqItPgA01WKlV5q/GSaZwo5Y56adUcE8
	 u2d8PJaKvSBlyIoSlSx9EBMkmTqI5lE7OhtEd3m0mt0ypIdXUu86yEReqPgADay1Wu
	 1TnsXU79RRm0GCehzjxo1DccTqpYKDFimY3zRVGjBpBp140cl2IXt8llhHYbkzj44P
	 qS0WPx5fFkv3eVcFgNTxYag6jaHPWTkeJ/ATaaWXfpJNzDAbCJOolk76PdEn3+RgFT
	 6TM0VIWEe4Bs2OipQqftao//8I0zJxrPlQ1NbUAPqeZEUiBGfxuVW3LxW5SuVxbQy7
	 Ut4XKpDb0EqCQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59581e32163so5771810e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Dec 2025 03:04:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX02zL5ApBwb/WDDpRTSNxwH6/qZZwob4/KGYpz0fowb6p+ZRToWbKpPPVMOxJpN4ddkxwn4MLFHfY49A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2DSCZwwT+qStlWkXD42v/HSKUydplHOFr1lkY4CqR74bChta5
	MYSgG/3EwMl37l/HMF6X38zMZasOTYdsTdh6P1HzWAj6fLt1n4+KzuJ8YfHBrayA0eGxvOigwy8
	6YTJGQoeYqLsQb6Lb0WIaNOg3H4qgC8Q=
X-Google-Smtp-Source: AGHT+IHFRCOw1OndrHUP8fu/5Pu86rNoly2fZw9WpBncVYiaNKQ4oxRlCC+E8Yk0b5wLZeLJPra7VnbPIBMd4pnW17A=
X-Received: by 2002:a05:6512:b85:b0:598:853e:4865 with SMTP id
 2adb3069b0e04-59a17d670demr5354973e87.50.1766487863823; Tue, 23 Dec 2025
 03:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-printk-helpers-v1-2-46a08306afdb@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 23 Dec 2025 19:04:11 +0800
X-Gmail-Original-Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
X-Gm-Features: AQt7F2oTKoNzOiHRkxSJE0lLrLQx6-2c3kaid1cyT2kNWjPKTkvyybHt0ZNsvmc
Message-ID: <CAGb2v65_bC23uVNdXXy0OW3Zx4wxO+CAuae5zPR4m2zt29kYXA@mail.gmail.com>
Subject: Re: [PATCH 02/12] i2c: sun6i-p2wi: use i2c_adapter-specific printk helpers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 6:02=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Convert all instances of using device printk helpers with struct device
> embedded in struct i2c_adapter to the new i2c-specific macros that hide
> that dereference.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index fb5280b8cf7fc0e3cba8ea6a318172ea2b011a02..845ca56cdae2d056c122eb648=
c082f319d955b5e 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -122,7 +122,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         unsigned long dlen =3D P2WI_DLEN_DATA_LENGTH(1);
>
>         if (p2wi->target_addr >=3D 0 && addr !=3D p2wi->target_addr) {
> -               dev_err(&adap->dev, "invalid P2WI address\n");
> +               i2c_err(adap, "invalid P2WI address\n");
>                 return -EINVAL;
>         }
>
> @@ -139,7 +139,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         writel(dlen, p2wi->regs + P2WI_DLEN);
>
>         if (readl(p2wi->regs + P2WI_CTRL) & P2WI_CTRL_START_TRANS) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
> @@ -154,12 +154,12 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap=
, u16 addr,
>         wait_for_completion(&p2wi->complete);
>
>         if (p2wi->status & P2WI_INTS_LOAD_BSY) {
> -               dev_err(&adap->dev, "P2WI bus busy\n");
> +               i2c_err(adap, "P2WI bus busy\n");
>                 return -EBUSY;
>         }
>
>         if (p2wi->status & P2WI_INTS_TRANS_ERR) {
> -               dev_err(&adap->dev, "P2WI bus xfer error\n");
> +               i2c_err(adap, "P2WI bus xfer error\n");
>                 return -ENXIO;
>         }
>
>
> --
> 2.47.3
>
