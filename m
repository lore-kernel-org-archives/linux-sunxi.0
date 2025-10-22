Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205F30F53E
	for <linux-sunxi@lists.linux.dev>; Wed, 22 Oct 2025 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761123765; cv=none; b=nkruN6T4QH5y86vwIcOIlz1LnsgeK+381dvzq5GLiqV7wNI1gVtlDddSlKxLBVv1xmLCEhG2sOze7KD8Vti9sPBqJCtJ7k9wobq5gsJEdJFt8GmlZ7sTNMtJUVp58x8FVgJxnoSLEkaUSRmrV02Jt6ah4uuQHRbkU9kH/RYDnr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761123765; c=relaxed/simple;
	bh=RAn9DUN+XwBeOn/ARjMhyZhD6sfiWfeYDtT/mcFMGBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HRCmLkvsjtYeZXk7kcCLmFcscatC4MTkYGTT/CoZJYCfxSsMmRY7C4E9ZlxVX5/JLpvZLCWfuhIAaRtMO17jciCcUQnj+mCRiQBd6whmBF4BV+ON07JC6l1hmWHo7QBSuYh6Lklw9KEzCrUUBEYZ/I/hsotJCz6e7ozavzsfZqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N3c3SpV5; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N3c3SpV5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87A9AC0B8B2;
	Wed, 22 Oct 2025 09:02:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 36F36606DC;
	Wed, 22 Oct 2025 09:02:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00CFE102F2424;
	Wed, 22 Oct 2025 11:02:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761123760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oDRCUkMoCDby5S/aZrDjp1VXkak+fQdoG5RdkGXcB4Y=;
	b=N3c3SpV57p5/GKS5PSw7jmNA1udiZ4jXASbHWVwRfwDneehJCGrqoNujIJH7dGUKy0P8SW
	Gwrpaj8sBhW97sO2TJlj8vA7fDjThqucjwNAkTfRgMBJkr8p00UXfw91V42W6vvZ5JfYG7
	/JcxDVomjRkPhkCUi0EjhpriqPlXzOYXf7jxDf/1NgdjYTNRQTC49WHgvkdL2eG1X9H7uy
	AHbENFrT5qNHYN54ydrdcpWeFSohXnMloWLAIJPKC6d0LrS9ldokxcFZ5I5ZRpgMDEtssH
	8QdrA8u6UmMSsYRO7b6XVxk3mYwdc6y3gp651iSnUuhM67xdB46zehcfJ1INfw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Wentao Liang <vulab@iscas.ac.cn>,  Johan
 Hovold <johan@kernel.org>,  Maxime Ripard <mripard@kernel.org>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  linux-mtd@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/15] mtd: rawnand: sunxi: rework pattern found
 registers
In-Reply-To: <20251020101311.256819-6-richard.genoud@bootlin.com> (Richard
	Genoud's message of "Mon, 20 Oct 2025 12:13:01 +0200")
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
	<20251020101311.256819-6-richard.genoud@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 22 Oct 2025 11:02:36 +0200
Message-ID: <87plaftikz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Richard,

On 20/10/2025 at 12:13:01 +02, Richard Genoud <richard.genoud@bootlin.com> =
wrote:

> On H6/H616, the register ECC_PAT_FOUND is at its own address, and not
> part of ECC status register.
> So, introduce the pattern found register offset in sunxi_nfc_caps, along
> with its mask.
>
> Also, introduce a non compile-time field_get() because FIELD_GET() and
> u32_get_bits() don't work with non compile-time constant.
> https://lore.kernel.org/lkml/cover.1739540679.git.geert+renesas@glider.be/
>
> No functional change.
>
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 36 ++++++++++++++++++++++++++-----
>  1 file changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 8f5d8df19e33..4cfb5d3e9c06 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -29,6 +29,9 @@
>  #include <linux/iopoll.h>
>  #include <linux/reset.h>
>=20=20
> +/* non compile-time field get */
> +#define field_get(_mask, _reg) (((_reg) & (_mask)) >> (ffs(_mask) -
> 1))

I see there are already 26 users for this, let's hope it gets merged
soon and this one dropped.

Not a blocker for me.

Miqu=C3=A8l
