Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2FB6F068
	for <linux-sunxi@lists.linux.dev>; Sat,  6 Jul 2024 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720266254; cv=none; b=iMWnwtvHgwyCergGg2X7+CEyyI5y7FxwSkeg14T7atgj/nPipqgoGpQj4lF1GqzWtVpy3ibY5C4M/Mkl/40omDkmgDAKappr8peYj5grf6zTATmiqQ5Dc/rjP8Iw63g80MjhigeMfPkERkZnWPV03rYDSiBjogf14WdRrPnvoq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720266254; c=relaxed/simple;
	bh=3WQQrxcBcr055f1jLShA2iF0olkPjnm/KLdE+z7pmYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BZMzVasOakrj039uhAyux56EIfFWuODpsCkpdvMnYIx5NWLGQY+H5DlhMFo05eCAMj3+ZNpIo8nqxyjB/ukuh6cD5OnmjpHfwwDTZn1YtwsyGA6HzeuP07TA7FkIBhWr1HJ/JQn5+VMZ8NDHp8Wgvm1jK1JR0sgsgm8RE4dFp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52e976208f8so2749752e87.2
        for <linux-sunxi@lists.linux.dev>; Sat, 06 Jul 2024 04:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720266250; x=1720871050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V+134akog2wvWq0vXgpMfAQRTi+1SDwDutTFUFvF3Uc=;
        b=kY9mroUsE8rrRCgCd/WmJVIim7d6oXuVFM11xDA0i/UnUUrg1vq0WSdrPuA6fGMPVm
         8VNj9tlWEwzdlp6hDGd9snAOlJ4MQizKrg/RxI73BjvdUGzc6SXUARmYNvzsp9uF/LQB
         Yg1X7nm0+SDp9tdeMTYGwtz0w7i9SwJcg3Ev8EJ/J8ApEszvG/NGCNwliF0tI03XPg1R
         R+5M+uN1EhfJZfGZ9tgeutSzTMBaVbBYMJLIDebDon5Dzk46R6E2rnjjpNJh1ICL/meY
         n+tWgTNWFXCvO4r5187Rebto26omFHLDPWKO5QwZphvYcfTQjgfhzz+qxJVQDQWGH1+P
         9Vvw==
X-Forwarded-Encrypted: i=1; AJvYcCXGvFj/O+QCz1P1nx0GpLPZxSRhap3fsuSjydc0yx0jgubeucjXZ1kGHMZFxbyMPsSTzQ3JvAkXLWnGoYMDiLc0bOjLKzZF2CtwZUk=
X-Gm-Message-State: AOJu0YxYciJ5ova0BeSh66HUmUH9Ws2OKvWMWzEZhlG+m9PMyMmB8kzb
	clmX4KnBya6nCRyuYE2PxOwkfdN7B8wHf8sfU1GS74DWfn2cf56NcQNbVZxs
X-Google-Smtp-Source: AGHT+IFp9U4WTtSSqTs/Tb0iAmYIojQJ09XRkb/6yJ2E8puhdJnt5Z/02AmzXxVxipzFletJ1NrP7Q==
X-Received: by 2002:a19:c518:0:b0:52c:84a2:d848 with SMTP id 2adb3069b0e04-52ea06d15aemr5085238e87.65.1720266249572;
        Sat, 06 Jul 2024 04:44:09 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab2f77dsm3021666e87.229.2024.07.06.04.44.08
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jul 2024 04:44:09 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ee9b098bd5so6800021fa.0
        for <linux-sunxi@lists.linux.dev>; Sat, 06 Jul 2024 04:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXggrPmLgAyN0l0VWURpcwKw0ivkSmtVSW1dLg5j9ux6Xzt52V5zva+f9y2LzOh9G+u5+N5FkjAh7a7DcWrLDNoWXzgee3+VgfBf6Y=
X-Received: by 2002:a05:651c:d3:b0:2ee:56b0:38e3 with SMTP id
 38308e7fff4ca-2ee8f9ae2bdmr48618231fa.24.1720266248186; Sat, 06 Jul 2024
 04:44:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com> <20240706112116.24543-49-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240706112116.24543-49-wsa+renesas@sang-engineering.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 6 Jul 2024 19:43:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v66u=QhV_EWAbqD9i1ZgVyAToTSr6L8m6ShJyCsimqGzfg@mail.gmail.com>
Message-ID: <CAGb2v66u=QhV_EWAbqD9i1ZgVyAToTSr6L8m6ShJyCsimqGzfg@mail.gmail.com>
Subject: Re: [PATCH v2 48/60] i2c: sun6i-p2wi: reword according to newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 6, 2024 at 7:22=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>

> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c=
-sun6i-p2wi.c
> index 85e035e7a1d7..074eade6c4a4 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -10,7 +10,7 @@
>   * The P2WI controller looks like an SMBus controller which only support=
s byte
>   * data transfers. But, it differs from standard SMBus protocol on sever=
al
>   * aspects:
> - * - it supports only one slave device, and thus drop the address field
> + * - it supports only one target device, and thus drop the address field
>   * - it adds a parity bit every 8bits of data
>   * - only one read access is required to read a byte (instead of a write
>   *   followed by a read access in standard SMBus protocol)
> @@ -88,7 +88,7 @@ struct p2wi {
>         void __iomem *regs;
>         struct clk *clk;
>         struct reset_control *rstc;
> -       int slave_addr;
> +       int target_addr;
>  };
>
>  static irqreturn_t p2wi_interrupt(int irq, void *dev_id)
> @@ -121,7 +121,7 @@ static int p2wi_smbus_xfer(struct i2c_adapter *adap, =
u16 addr,
>         struct p2wi *p2wi =3D i2c_get_adapdata(adap);
>         unsigned long dlen =3D P2WI_DLEN_DATA_LENGTH(1);
>
> -       if (p2wi->slave_addr >=3D 0 && addr !=3D p2wi->slave_addr) {
> +       if (p2wi->target_addr >=3D 0 && addr !=3D p2wi->target_addr) {
>                 dev_err(&adap->dev, "invalid P2WI address\n");
>                 return -EINVAL;
>         }
> @@ -188,7 +188,7 @@ static int p2wi_probe(struct platform_device *pdev)
>         unsigned long parent_clk_freq;
>         u32 clk_freq =3D I2C_MAX_STANDARD_MODE_FREQ;
>         struct p2wi *p2wi;
> -       u32 slave_addr;
> +       u32 target_addr;
>         int clk_div;
>         int irq;
>         int ret;
> @@ -207,7 +207,7 @@ static int p2wi_probe(struct platform_device *pdev)
>         }
>
>         if (of_get_child_count(np) > 1) {
> -               dev_err(dev, "P2WI only supports one slave device\n");
> +               dev_err(dev, "P2WI only supports one target device\n");
>                 return -EINVAL;
>         }
>
> @@ -215,24 +215,24 @@ static int p2wi_probe(struct platform_device *pdev)
>         if (!p2wi)
>                 return -ENOMEM;
>
> -       p2wi->slave_addr =3D -1;
> +       p2wi->target_addr =3D -1;
>
>         /*
>          * Authorize a p2wi node without any children to be able to use a=
n
>          * i2c-dev from userpace.
> -        * In this case the slave_addr is set to -1 and won't be checked =
when
> +        * In this case the target_addr is set to -1 and won't be checked=
 when
>          * launching a P2WI transfer.
>          */
>         childnp =3D of_get_next_available_child(np, NULL);
>         if (childnp) {
> -               ret =3D of_property_read_u32(childnp, "reg", &slave_addr)=
;
> +               ret =3D of_property_read_u32(childnp, "reg", &target_addr=
);
>                 if (ret) {
> -                       dev_err(dev, "invalid slave address on node %pOF\=
n",
> +                       dev_err(dev, "invalid target address on node %pOF=
\n",
>                                 childnp);
>                         return -EINVAL;
>                 }
>
> -               p2wi->slave_addr =3D slave_addr;
> +               p2wi->target_addr =3D target_addr;
>         }
>
>         p2wi->regs =3D devm_platform_ioremap_resource(pdev, 0);
> --
> 2.43.0
>
