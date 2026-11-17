Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920710;
	b=suEKvEtxb+BD7eBJZcmkRWOy8akxwmfAYOUajl3jd7khMtf44pxEw9C7jNQSpa4HMXqn
	 aHD+mnvLLNWZ0Cp7DWeKdteiBKCTDdkVR/1B0whk0EJ4xutL2iVySkiyKDTw4DB8Iccv/
	 vRy52iFhbaPsJM6xnEBWcwd354fzzMdTlUk5+qo9+iUT6+CEH2yqAKgMC1JEkTc2ZKJPQ
	 TaLUJb0+laIsY8p/54nQolID9RQUT9qpZq0rUEjunHJoQIeAwlQu0AyGQM1qVHOxtajGw
	 g51A8vhTHw6ayr+aXaleTcKA/W7LiLd79puIM30SQoGBiEND8NuPWv+GLBcXrJov+9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920710;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=aFq54pY4EowgW1OTnF49eoGgH8cs593NTtkoAWkYhtw=;
	b=XkmWFdzhG2uMT0hIpSqQ6m0KO2n9vQuwFY/gprYisZCn57VjO1a1QawGnMAjSNN2H/mY
	 iwPEXlORYv7apofHjxdG+nwGKkOpFRLbacdyx4N0tgXb04CQ2/9gKfoVRxVZLeXwltTlu
	 vG3mMfGSNKD1xEODMlVKpoqsp44/jmMpQZsJsVKEOE2SGpx3EC1FO7DaHQGOtCocMjVsg
	 ryA0Gk4OQINM+Zauhu2j046SSQRHZVgM0UlZF7qGOgK7vtErJ1PsLrhbzrCqHR1a0Wku3
	 smq8CUNC6dCcp8kZz+NqAbpY0CBUd6UNy6hk8PDbvS3wEg05HJujuTgtjZRcHgee++Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EuR34IKS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45CD606A32A
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Nov 2026 13:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45CD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EuR34IKS
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 149DD205A39;
	Tue, 17 Nov 2026 14:05:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFq54pY4EowgW1OTnF49eoGgH8cs593NTtkoAWkYhtw=;
	b=EuR34IKS78/70jA0BYwlFltzbYpToNVtlCkJSn1sEeFSYBVUk5alXzemWRufKyGF7WARYs
	kCCGDrWfE8Xf3rGpOk5h/oTKtrRndgcwnBwGTXdKLsVUjgkSypD0gavWNddYjkBCeoH28R
	7aswVtDmVCtPcAw3S84/hmvrNlozkQ1E+rVQA2ds14xORdsf80h7spAObHIvqyFf7rnmQt
	KNuogkpKmrGlupLgiZI8HYnB6yBE1bz5LWepbX/Pq+eB8uKzmCfBWCh8kLCe2yqnSofmcy
	c4JMC9SxQsmz6bq+VXTrW+o8Bf/TbvJ4RYOj+7brZyfcQy7LR6yOPv8td0qelQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794920708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aFq54pY4EowgW1OTnF49eoGgH8cs593NTtkoAWkYhtw=;
	b=b4CuNcaW53D0Yi3pjeP3TOFrZ2sR2Qv5jjxxnHWmQ8auf8Zv070xzx26OaFl7uW5d//eOY
	oE9RFhJvty+d+cuKB04ZvKwcoPoq2tgCxEHsgii/Ua8k9G2BGcIrb5lMex4LQ2Sl9uUInA
	F5dUHpAda+vDbPW+TGFUS5jU+VJZkGPgotaDpawUB69z5YOnASJDjERnkdMSTU9gNYt9o5
	VLDmjUhAFtS8fMwKF49CN9my4qJhWte1NHLaKWCfSULgCr+oiVZDlzVMNFfSsVwC2uxrvp
	z3uSSwJN/NNIomeVY7B+qHNp5Ub+3oYe1c257D1ntah9f6Ax9cwsEwC2KzW4eQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794920708; a=rsa-sha256;
	cv=none;
	b=KkiV7OtFgI2w9GfXbA/k6E6DSPnj3I63JajbRZ8SMZVNpC0BKRWL/QSKj/gFRD4iZ0JB+9
	d71rvk8aa8bykkh5kDDTritaZQqRUFRGnGSvCEz7M+Yc5eL4PSGTTq+p+2SUavsMQkuQ/N
	Us66u6dsgWd+5sPrrNmXlb6/QKPkI/LcZVN66qxJOpr+TLKpA6P9WotEqZdzB4BP6sNbnt
	ctxWOda4P4RMwiz5GbSoDM2jvzq4yfSPFuggaZg9kUxg+0azuK7tO/1DfHIcuzZskuUMuz
	jHXjsg92CW+JVTsCvVf7K1i6zm+xlGu66NUSAWQJyxwZO3KcLBa+yl5XTKvmWQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <974d629b23d38d46a033513db9b4e783b9c11cda.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] usb: musb: sunxi: Assert reset before deasserting
 on init
From: Philipp Zabel <p.zabel@pengutronix.de>
To: admin@roadbobek.com, Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec	 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Vinod Koul	 <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Date: Tue, 17 Nov 2026 14:05:07 +0100
In-Reply-To: <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
References: <20261117-usb-sunxi-reset-fix-v1-0-c2b76e0e84e1@roadbobek.com>
	 <20261117-usb-sunxi-reset-fix-v1-1-c2b76e0e84e1@roadbobek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Di, 2026-11-17 at 13:00 +0000, Roadbobek via B4 Relay wrote:
> From: Roadbobek <admin@roadbobek.com>
>=20
> When a bootloader such as U-Boot (for example with
> CONFIG_USB_MUSB_HOST=3Dy) initializes MUSB and boots Linux
> without stopping USB first, the controller reset line is
> already deasserted at probe time.
>=20
> In that case reset_control_deassert() in sunxi_musb_init()
> is a no-op and stale MUSB register state persists across boot.
> On Allwinner A33, MUSB stays wedged in a_wait_bcon with
> DevCtl=3D0x99, Power=3D0xf0, and a frozen Frame counter even
> across hot-unplug and replug.
>=20
> Assert glue->rst briefly before deasserting it when
> SUNXI_MUSB_FL_HAS_RESET is set so MUSB starts cleanly.
> Tested on an Allwinner A33 Q8 tablet (Laser MID-786).
>=20
> Signed-off-by: Roadbobek <admin@roadbobek.com>
> ---
>  drivers/usb/musb/sunxi.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
> index a17b1c150626..3d16049e53b5 100644
> --- a/drivers/usb/musb/sunxi.c
> +++ b/drivers/usb/musb/sunxi.c
> @@ -9,6 +9,7 @@
>   */
> =20
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/extcon.h>
>  #include <linux/io.h>
> @@ -239,6 +240,8 @@ static int sunxi_musb_init(struct musb *musb)
>  		goto error_sram_release;
> =20
>  	if (test_bit(SUNXI_MUSB_FL_HAS_RESET, &glue->flags)) {
> +		reset_control_assert(glue->rst);

No error handling?

> +		usleep_range(10, 20);
>  		ret =3D reset_control_deassert(glue->rst);
>  		if (ret)
>  			goto error_clk_disable;

regards
Philipp
