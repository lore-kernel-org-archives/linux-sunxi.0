Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A861E1A9
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Aug 2023 13:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E1EC433C7
	for <linux-sunxi@lists.linux.dev>; Thu, 10 Aug 2023 13:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691673504;
	bh=mbigJpGS4WoULRHUK4EfHdbdi7SQCXGaf99EX6XTHl0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=JWWwJWM1HZtMNpTw/s7Ixl6qqngAo7pz4fwpLg+9rVQtQ2E4Np0x22xWf6fZyTGa8
	 4+JEUzlrGbzeHoEx8VMX9nMnvTiqr5xTX5rFCHWfkU/NKaUs4LAJ2QjWcmenrt9sb7
	 Tq81v0/m7wDOV1AV6+G5kYHHyxbhZvogCZMy2DCtfwRMI3Rnxi5P//+QnRRFc30Ma4
	 4XFRF9iochWDGDRkhalnLzZ5LPy90se67LCjzXpa/FjZt6laKpGTc8OJGOfl3lj+oG
	 qdwE8ozpuSIeuG+ETL6RiwjojqBOu46wQpde2QwsXUS21PnhCINtmTkUHdZPs05qAY
	 +vLOPu42/1IZw==
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-564ef63a010so1498196a12.0
        for <linux-sunxi@lists.linux.dev>; Thu, 10 Aug 2023 06:18:23 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxjp/BmzH1yMw5mlgJmh7QI9wxOSScWGHtr+t2BTJ0QUnJcILXW
	QFoFYYQuXN48Vetvi9GipTGCTut8LBDnY7vnElY=
X-Google-Smtp-Source: AGHT+IHOx9/WWwkVcYH2MMs/XrF/9tqNcOh0Bxz25sWEAurlWxQVxYPJfGJmGeg/NzvHVWw/gM9zJHSj0ihOhgo/ysw=
X-Received: by 2002:a17:90b:3a89:b0:268:c5af:d253 with SMTP id
 om9-20020a17090b3a8900b00268c5afd253mr2725005pjb.8.1691673503547; Thu, 10 Aug
 2023 06:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
In-Reply-To: <20230807-a64_pll_video0_notifier-v1-0-8a7ccdc14c79@oltmanns.dev>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Thu, 10 Aug 2023 21:18:12 +0800
X-Gmail-Original-Message-ID: <CAGb2v64ZxaizTOLMZfJKujAZqZCiowbotxBhvfCmLV_exF-ooQ@mail.gmail.com>
Message-ID: <CAGb2v64ZxaizTOLMZfJKujAZqZCiowbotxBhvfCmLV_exF-ooQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pll-video0 notifier for v6.5+
To: Frank Oltmanns <frank@oltmanns.dev>
Cc: Icenowy Zheng <uwu@icenowy.me>, =?UTF-8?Q?Ond=C5=99ej_Jirman?= <x@xnux.eu>, 
	linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 5:36=E2=80=AFPM Frank Oltmanns <frank@oltmanns.dev> =
wrote:
>
> Hi Icenowy,
>
> it is my understanding that you are the original author of the following
> patches are in Ond=C5=99ej's 6.4 branch [1] [2] [3] but not in his 6.5
> branch. I assume it is because of merge conflicts as the part about
> setting the parent has already been fixed in the 6.5 release candidates.
>
> Therefore I've removed those parts and adopted the commit message of
> PATCH 2. I've removed your SoB, because I think you'd need to sign of
> the revised version. Especially patch 2 has become a bit simpler and I'm
> wondering if it makes sense to try to upstream the three patches now.
> What do you think?
>
> Thank you for your amazing work!
>
> Best regards,
>   Frank

Please send to all maintainers and relevant mailing lists (as given
by get_maintainers.pl).


> [1]: https://github.com/megous/linux/commit/2cd3d57adf83e2d091baed77e1aaf=
c01d545d123
> [2]: https://github.com/megous/linux/commit/c9c7bfe22f0fefdfc1dc2ce84b452=
964112399d7
> [3]: https://github.com/megous/linux/commit/e19ccee10a8492535b6cda1ba97cc=
cc2074d6e65
>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>
> ---
> Icenowy Zheng (3):
>       clk: sunxi-ng: add support for rate resetting notifier
>       clk: sunxi-ng: a64: keep tcon0 clock rate when pll-video0's rate ch=
anges
>       drm/sun4i: tcon: hand over the duty to keep TCON0 clock to CCU on A=
64
>
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 15 +++++++++++++++
>  drivers/clk/sunxi-ng/ccu_common.c     | 22 ++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu_common.h     | 12 ++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c    | 15 +++++++++++++--
>  drivers/gpu/drm/sun4i/sun4i_tcon.h    |  1 +
>  5 files changed, 63 insertions(+), 2 deletions(-)
> ---
> base-commit: 1cf5c37ee3c2334a964c65e52b4e0c59b4332d7c
> change-id: 20230807-a64_pll_video0_notifier-164cbc78b341
>
> Best regards,
> --
> Frank Oltmanns <frank@oltmanns.dev>
>
>
