Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6DD3A8C3
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Jan 2024 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920325; cv=none; b=TyUp7iSLJYtzh6ROO8HQL0lA6Fu2/Bo7a/5QOuDaVOIJefct92psvdfWKR/8xuWFSHlnJJGudW/C08Y5695CltZ3+wTiq67yqbuGPCmDuWCm9pTejFkXKruvF2apN0nVBm7I/FVg88B/X6WhvSYky7Gswz060i9N9AWV1Dhz+dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920325; c=relaxed/simple;
	bh=DsPCBfxhfwqn5+KUS4+3J9IPplxIlTdI3o7BZcP1A7s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NTS7GLdNulQHyUBGZmLDbS0sj6PabdIpHD3simSUiVjr0Wqo3jYpamMSoo1yVbCOoRbrOyGAt9ePG6uS2rFwatcGri3cWQ11jhTZcjWltX+5Q6KPfNiofxHadTaYhWTgUfPFzSoyYssuru+BRgzg+UaW5jP+JuieJrh6W9CnmU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0B191FB;
	Mon, 22 Jan 2024 02:46:09 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 696DA3F5A1;
	Mon, 22 Jan 2024 02:45:22 -0800 (PST)
Date: Mon, 22 Jan 2024 10:45:19 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Emilio =?UTF-8?B?TMOzcGV6?=
 <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: usb: fix kernel-doc warnings
Message-ID: <20240122104519.66116259@donnerap.manchester.arm.com>
In-Reply-To: <20240121051858.17647-1-rdunlap@infradead.org>
References: <20240121051858.17647-1-rdunlap@infradead.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 20 Jan 2024 21:18:57 -0800
Randy Dunlap <rdunlap@infradead.org> wrote:

> Move the function description comment to immediately above the
> function implementation, the add function parameter descriptions to
> prevent kernel-doc warnings:
>=20
> clk-usb.c:80: warning: expecting prototype for sunxi_usb_clk_setup(). Pro=
totype was for SUNXI_USB_MAX_SIZE() instead
> clk-usb.c:91: warning: Function parameter or struct member 'node' not des=
cribed in 'sunxi_usb_clk_setup'
> clk-usb.c:91: warning: Function parameter or struct member 'data' not des=
cribed in 'sunxi_usb_clk_setup'
> clk-usb.c:91: warning: Function parameter or struct member 'lock' not des=
cribed in 'sunxi_usb_clk_setup'

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Emilio L=C3=B3pez <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> ---
>  drivers/clk/sunxi/clk-usb.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>=20
> diff -- a/drivers/clk/sunxi/clk-usb.c b/drivers/clk/sunxi/clk-usb.c
> --- a/drivers/clk/sunxi/clk-usb.c
> +++ b/drivers/clk/sunxi/clk-usb.c
> @@ -73,9 +73,6 @@ static const struct reset_control_ops su
>  	.deassert	=3D sunxi_usb_reset_deassert,
>  };
> =20
> -/**
> - * sunxi_usb_clk_setup() - Setup function for usb gate clocks
> - */
> =20
>  #define SUNXI_USB_MAX_SIZE 32
> =20
> @@ -85,6 +82,12 @@ struct usb_clk_data {
>  	bool reset_needs_clk;
>  };
> =20
> +/**
> + * sunxi_usb_clk_setup() - Setup function for usb gate clocks
> + * @node: &struct device_node for the clock
> + * @data: &struct usb_clk_data for the clock
> + * @lock: spinlock for the clock
> + */
>  static void __init sunxi_usb_clk_setup(struct device_node *node,
>  				       const struct usb_clk_data *data,
>  				       spinlock_t *lock)
>=20

