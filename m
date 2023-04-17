Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC76FCB
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Apr 2023 13:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08E6C433A1
	for <linux-sunxi@lists.linux.dev>; Mon, 17 Apr 2023 13:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681738378;
	bh=YnO373PW8kFPYYEga0WKpnzfKPRu65AqgaMNSJcVERc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=K+tF1m4CWen8Pb45l6Ofuvy5jJZrWa5OkbOtta7j9xSL9G6y1gPoqts4Q7UuO4GIY
	 vhukENSBwvZtBPGFtgwEl245KEawE/4qE3mlVHVJgDb5sUOUiYCAcJVEk/c6neLYTl
	 gWZ+D5r+BhCMIH3FySxEc1RlW1VGUGCUhFO1J3cCv6Ok5U5Dk2R4prsB113sohqUqt
	 nqBChqzzQf2rpWp0MJuiPL2aaKMhVj/aTsoWw5SNZn052dMEKL77RG5Ft0cQV0OkaG
	 n8EkRY3W4SuI9QX8da2TQcMPdtePDgCAt7XK27g20SCvea4ea8RyHM4+SgxBlXm0Eq
	 map3H+TcMyv/Q==
Received: by mail-pl1-f177.google.com with SMTP id q2so30522597pll.7
        for <linux-sunxi@lists.linux.dev>; Mon, 17 Apr 2023 06:32:58 -0700 (PDT)
X-Gm-Message-State: AAQBX9csDBWj2JhYXfdv2ScULo/A+/R7DyXul1twkBCuFvUqV0ce3tfU
	x7WYV2EXpPWLiOm6ZqP9g2e4hWyA1vp8PwStQ4h+pg==
X-Google-Smtp-Source: AKy350Y5U4Z/dfv+AvSqZXRHfVhVpKBzwMX3b9aXK5doLIcEmW2NRnzfpKko53ahGbE+qIVjBzucEnKmTK75Bh9acDc=
X-Received: by 2002:a17:90a:2944:b0:247:2c8e:9911 with SMTP id
 x4-20020a17090a294400b002472c8e9911mr3535372pjf.5.1681738378299; Mon, 17 Apr
 2023 06:32:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230415104613.61224-1-jernej.skrabec@gmail.com> <20230415104613.61224-3-jernej.skrabec@gmail.com>
In-Reply-To: <20230415104613.61224-3-jernej.skrabec@gmail.com>
From: Robert Foss <rfoss@kernel.org>
Date: Mon, 17 Apr 2023 15:32:47 +0200
X-Gmail-Original-Message-ID: <CAN6tsi72CP+DO-MG0=7Ajmqnd-q7r4bw_rxnvya-e4wUVEeujg@mail.gmail.com>
Message-ID: <CAN6tsi72CP+DO-MG0=7Ajmqnd-q7r4bw_rxnvya-e4wUVEeujg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: dw_hdmi: Handle snps,disable-cec property
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, wens@csie.org, samuel@sholland.org, 
	devicetree@vger.kernel.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com, 
	hverkuil-cisco@xs4all.nl, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15, 2023 at 12:47=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> New DT property allows to skip CEC initialization.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 603bb3c51027..e7e8199d2fb1 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -3615,7 +3615,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_devic=
e *pdev,
>                 hdmi->audio =3D platform_device_register_full(&pdevinfo);
>         }
>
> -       if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
> +       if (!plat_data->disable_cec &&
> +           !of_property_read_bool(np, "snps,disable-cec") &&
> +           (config0 & HDMI_CONFIG0_CEC)) {
>                 cec.hdmi =3D hdmi;
>                 cec.ops =3D &dw_hdmi_cec_ops;
>                 cec.irq =3D irq;
> --
> 2.40.0
>


Reviewed-by: Robert Foss <rfoss@kernel.org>
