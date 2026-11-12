Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495528;
	b=K82FVujuGD+ODo95qvK/7s2UgyEBA6WkpPJY833Dg50DR+90SXtYoc7/Xh83WDo/2nPW
	 G04l7TCF+UIi2oMhQY0wWLBQTbLJ7zDhCRW+i47l5VSFmp1hn4joceHyu6k981g1rM4za
	 w2WXT9m6MuShyBLOXBNfTg5kt/JZIcnHX9yI5Zgb/2AXPm4kxrmlM+u8J7tp5qnJV14WU
	 7HL+0xQPApFwLL6ZiWyja1kP4CFtbJSv7idA08KakKRd3b7VTh5X1OqWfqwASPk+F2ejd
	 41Rb+HCRciYKPi5Idh8LuqyA9xgs4tjD0og29HMsBq3pv+jJL7DeVOcIDAnrgW8XpPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495528;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ahp2R8XXPiuO6iEjfb6UKUnsMrVVlx0bOA5QMiN/SCg=;
	b=WZiBy8TwLXdXwjgm/0swxZeUKUsjn+qVj1uLlgbkji/wKdl3YPdSG36WDhf7e2FLWhEY
	 QH5U6ZCJHw6NnHgNhc44nePh8CLLK/FNtOBnqXVjqKZVmxDFqFRXDO0renW38moNC1UzH
	 eKQEJzafBUozPbY9hqaTLQj7VrfVK1ipTPEdyhnGLAx27B5FUWMDwpZfhwpjo6YCTjILG
	 IzYR8x7MLvzT+FXHZcCXfK5JiYDuoEZBncfBgVBCD9wIpIfzZsEJUJEBfsABWvomIdyO4
	 DMNbEOkq0EyCi+V8IjzOHtrsT+ROHKdURbvRGK+EnptRLjQYCx6IB+iicBW+gedECsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evi7clWU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9A606A327
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=evi7clWU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AA01F00A08
	for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 14:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495528;
	bh=Ahp2R8XXPiuO6iEjfb6UKUnsMrVVlx0bOA5QMiN/SCg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=evi7clWUqzfu5IwbwBr1JJlISMJDxPDhvh6uAAOyCg4ZnCnklbxu8+ZjPmsyAJp/0
	 aP8kAcEIz52VuMwJki7SyO4fuxYHvB3MavOJRR03w0bl2i7fAv32f91k/+09mGMrj3
	 iWt4HXcH3d0ZZxsnA6Rm9vsEqznM4YC0+n0a6kqqns3tv22HaO3JdV6Q+ZvJtYkBfF
	 h9guIvmInAtJSD2Thdtkqr1TC4gRLGYeJpVypaDuYlIneKDv92USZioY1YD+c92ZTM
	 GNRqYI1l0LabEgiidIKy/Ghen9POAU1/k4/CNgnT6u71WupklB+95qmRViP8rE0x3t
	 oi8M7RhZ7wVeQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae25d9e2fdso4861121fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 12 Nov 2026 06:58:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEBd90M5D6hOGnPmt2oPgz5RXbt9pff8OLvqeOlFuG+UnzpwXVJqZyDxbVhRi/eumX+F23o7jEz8uh2fg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/EYCRc2NqXK0hP9JUopYV3y3sBEmM3NDq5RFtkv3BnPDJaZYPw
	8Bd1c3POESMyMNAXddovJjZePOQSNx2vx3tSQJc5BxmyB1O01JnOPX5pxaPgJQIC4HKTg6E5WyI
	jR5HLnod13gw7aZITV3muE2oz7txOqcM=
X-Received: by 2002:a05:651c:e0c4:10b0:3ae:25db:795 with SMTP id
 38308e7fff4ca-3ae25db0827mr3381781fa.12.1794495527049; Thu, 12 Nov 2026
 06:58:47 -0800 (PST)
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech> <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
In-Reply-To: <20261112-a733-clk-v7-6-db7c5451ffa2@pigmoral.tech>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 12 Nov 2026 23:58:33 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Ye4wEiE3y2msoFh1P5Cs7dvXQ_vESmVFEJ=qhkp9PVQ@mail.gmail.com>
X-Gm-Features: AclHuK-IX9I87FO9BVEBpEeLaHk1PETWtM0mWihOigloFLp60Bd_bejTc7ChEns
Message-ID: <CAGb2v64Ye4wEiE3y2msoFh1P5Cs7dvXQ_vESmVFEJ=qhkp9PVQ@mail.gmail.com>
Subject: Re: [PATCH v7 6/8] clk: sunxi-ng: a733: Add mod clocks support
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 12, 2026 at 4:15=E2=80=AFPM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:
>
> Add the module clocks found in the Allwinner A733 SoC, including video,
> storage, interfaces and others. While most of these clocks are similar
> to those in the A523 SoC, this implementation accounts for changes in
> register offsets and introduces support for new modules.
>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>
> Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 1087 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 1087 insertions(+)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-n=
g/ccu-sun60i-a733.c
> index 8bc603393f5a..5ea65bf5b5e0 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c

[...]

> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(i2spcm2_asrc_clk, "i2spcm2_asrc", i2=
spcm2_asrc_parents, 0x1224,

This and the csi master clocks later have an underscore in the clk name str=
ing.
They should have hyphens instead. I will fix it when I apply the patches.
No need to resend just for this.

> +static SUNXI_CCU_DUALDIV_MUX_GATE(csi_master0_clk, "csi_master0", csi_ma=
ster_parents, 0x1800,

This one.

> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);
> +static SUNXI_CCU_DUALDIV_MUX_GATE(csi_master1_clk, "csi_master1", csi_ma=
ster_parents, 0x1804,

This one.

> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);
> +static SUNXI_CCU_DUALDIV_MUX_GATE(csi_master2_clk, "csi_master2", csi_ma=
ster_parents, 0x1808,

And this one.

> +                                 0, 5,         /* M */
> +                                 8, 5,         /* N */
> +                                 24, 3,        /* mux */
> +                                 BIT(31),      /* gate */
> +                                 0);


These were flagged by a review agent comparing the driver against the datas=
heet
and BSP code.


ChenYu
