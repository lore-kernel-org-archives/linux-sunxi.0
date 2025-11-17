Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D1833993;
	Mon, 17 Nov 2025 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763363136; cv=none; b=gIZFZrQQaDlUiMx79h4BmFGJJ3p+1hiJ9jedvtf+CksyTqYJ7KoM6Di5Yfi5DbpEr4fO8PlDLF2xdpypQgFu+aErc1Tm/QArvPzqoLzXJ1NIV611CDt7ABDIPTfMquRiAopATeG0FfcmgmG6CfQloviR58IYQJq/9jj5xmXJaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763363136; c=relaxed/simple;
	bh=iU8ROMk83jPncCljG0G/Fsoi2HDIAUbVt2VmcnD6plU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4rahBHUbjJhqwZJiKOMuwV/fFIVTnaSCQJa8rzDk3yUligOzdL0gNxHr6G7OP6ptUl/j/EJYc8IZXOGbA4FkUr93c/DRBIV1d2+6f2g6p8jYcosVXqRzd1731qnn6RqMy4QNzBBCWf68pohDoOLImlORrMzBJ5FCNMvsr6cchU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zmf+GQm0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zmf+GQm0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765EBC4CEF5;
	Mon, 17 Nov 2025 07:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763363136;
	bh=iU8ROMk83jPncCljG0G/Fsoi2HDIAUbVt2VmcnD6plU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zmf+GQm0pAZ6z6C3arkzoxE5KbyOToef7Sp5DndQnxXr8JmQ3033UwODfZZpK7eMG
	 hNH2jlwIuNUC5NnJDZINgZJkjsQJmjVDQrUIWEvPazC8bT+gOyaYKNFP8Uis24UXEt
	 mU5oJ0PrmJNp25ZaImcMpp9pIDc8xskK7aEelL5VGWSuUeOnhVqU2YCiwbVsYM36cB
	 +17Rqg5eybYkDTX3XKBekgImKsuhhWCgQs0k0isOYITGYUfeEsHwvLyJGwVn6IGefN
	 4doh0ptX0oiLvP/wADeR//qwwzH01kT6exkg/8xtX7yON6lMV/FrtXhlnhvW0RUQWm
	 qytLrxDJMjTIQ==
Date: Mon, 17 Nov 2025 08:05:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kuba =?utf-8?Q?Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Subject: Re: [PATCH v3 4/6] dt-bindings: display: sun4i: Add D1s/T113 combo
 D-PHY bindings
Message-ID: <20251117-faithful-unique-millipede-d8bae5@kuoka>
References: <20251116134609.447043-1-kuba@szczodrzynski.pl>
 <20251116134943.447443-1-kuba@szczodrzynski.pl>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251116134943.447443-1-kuba@szczodrzynski.pl>

On Sun, Nov 16, 2025 at 02:49:43PM +0100, Kuba Szczodrzy=C5=84ski wrote:
> The sun4i TCON needs a reference to the D-PHY in order to support LVDS
> on Allwinner D1s/T113.
>=20
> Add phys and phy-names to DT bindings.

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets. See also:
https://elixir.bootlin.com/linux/v6.16-rc2/source/Documentation/process/sub=
mitting-patches.rst#L830


>=20
> Signed-off-by: Kuba Szczodrzy=C5=84ski <kuba@szczodrzynski.pl>
> ---
>  .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a1=
0-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10=
-tcon.yaml
> index 724d93b91..52589341f 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.=
yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.=
yaml
> @@ -115,6 +115,12 @@ properties:
>            - const: edp
>            - const: lvds
> =20
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: combo-phy

Drop phy suffix. Can a "phy" property hold reference to something else
than phy? You don't need names in the first place, you have only one
entry.

Best regards,
Krzysztof

